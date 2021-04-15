//
//  AppDelegate.swift
//  Habitica
//
//  Created by Phillip on 11.08.17.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

import UIKit
import PopupDialog
import Keys
import Amplitude_iOS
import Habitica_API_Client
import Habitica_Models
import RealmSwift
import ReactiveSwift
import Firebase
import SwiftyStoreKit
import StoreKit
import UserNotifications
import FirebaseMessaging
import Down
import WidgetKit

//This will eventually replace the old ObjC AppDelegate once that code is ported to swift.
//Reason for adding this class now is mostly, to configure PopupDialogs dim color.
class HabiticaAppDelegate: NSObject, MessagingDelegate, UNUserNotificationCenterDelegate {
    
    static let possibleLaunchArgs = ["userid", "apikey"]
    
    private let application: UIApplication
    
    private let userRepository = UserRepository()
    private let contentRepository = ContentRepository()
    private let taskRepository = TaskRepository()
    private let socialRepository = SocialRepository()
    
    @objc
    init(application: UIApplication) {
        self.application = application
        super.init()
    }
    
    @objc
    func handleLaunchArgs() {
        let launchArgs = ProcessInfo.processInfo.environment
        if launchArgs["userid"] != nil {
            AuthenticationManager.shared.currentUserId = launchArgs["userid"]
        }
        if launchArgs["apikey"] != nil {
            AuthenticationManager.shared.currentUserKey = launchArgs["apikey"]
        }
    }
    
    @objc
    func setupFirebase() {
        // For iOS 10 display notification (sent via APNS)
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in })
        
        application.registerForRemoteNotifications()
        Messaging.messaging().delegate = self
        
        let userDefaults = UserDefaults.standard
        Analytics.setUserProperty(LanguageHandler.getAppLanguage().code, forName: "app_language")
        Analytics.setUserProperty(UIApplication.shared.alternateIconName, forName: "app_icon")
        Analytics.setUserProperty(userDefaults.string(forKey: "initialScreenURL"), forName: "launch_screen")
    }
    
    @objc
    func saveDeviceToken(_ deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        UserDefaults.standard.set(token, forKey: "PushNotificationDeviceToken")
    }
    
    @objc
    func setupLogging() {
        let userID = AuthenticationManager.shared.currentUserId
        FirebaseApp.configure()
        RemoteLogger.shared.setUserID(userID)
    }
    
    @objc
    func setupAnalytics() {
        let keys = HabiticaKeys()
        Amplitude.instance().initializeApiKey(keys.amplitudeApiKey)
        Amplitude.instance().setUserId(AuthenticationManager.shared.currentUserId)
        let userDefaults = UserDefaults.standard
        Amplitude.instance()?.setUserProperties(["iosTimezoneOffset": -(NSTimeZone.local.secondsFromGMT() / 60),
                                                 "appLaunchScreen": userDefaults.string(forKey: "initialScreenURL") ?? ""
        ])
    }
    
    @objc
    func setupPurchaseHandling() {
        PurchaseHandler.shared.completionHandler()
    }
    
    @objc
    func setupNetworkClient() {
        NetworkAuthenticationManager.shared.currentUserId = AuthenticationManager.shared.currentUserId
        NetworkAuthenticationManager.shared.currentUserKey = AuthenticationManager.shared.currentUserKey
        updateServer()
        AuthenticatedCall.errorHandler = HabiticaNetworkErrorHandler()
        AuthenticatedCall.notificationListener = {[weak self] notifications in
            guard let notifications = notifications else {
                return
            }
            let unshownNotifications = NotificationManager.handle(notifications: notifications)
            self?.userRepository.saveNotifications(unshownNotifications)
        }
        let configuration = URLSessionConfiguration.default
        AuthenticatedCall.defaultConfiguration.urlConfiguration = configuration
        AuthenticatedCall.indicatorController = IOSNetworkIndicatorController()
        
        let userDefaults = UserDefaults.standard
        for (key, etag) in userDefaults.dictionaryRepresentation().filter({ (key, _) -> Bool in
            return key.starts(with: "etag")
        }) {
            HabiticaServerConfig.etags[String(key.dropFirst(4))] = etag as? String
        }
    }
    
    func updateServer() {
        if let chosenServer = UserDefaults().string(forKey: "chosenServer") {
            switch chosenServer {
            case "production":
                let configRepository = ConfigRepository()
                if let host = configRepository.string(variable: .prodHost), let apiVersion = configRepository.string(variable: .apiVersion) {
                    let config = ServerConfiguration(scheme: "https", host: host, apiRoute: "api/\(apiVersion)")
                    AuthenticatedCall.defaultConfiguration = config
                } else {
                    AuthenticatedCall.defaultConfiguration = HabiticaServerConfig.production
                }
            case "staging":
                AuthenticatedCall.defaultConfiguration = HabiticaServerConfig.staging
            case "beta":
                AuthenticatedCall.defaultConfiguration = HabiticaServerConfig.beta
            case "gamma":
                AuthenticatedCall.defaultConfiguration = HabiticaServerConfig.gamma
            case "delta":
                AuthenticatedCall.defaultConfiguration = HabiticaServerConfig.delta
            default:
                AuthenticatedCall.defaultConfiguration = HabiticaServerConfig.localhost
            }
        } else {
            let configRepository = ConfigRepository()
            if let host = configRepository.string(variable: .prodHost), let apiVersion = configRepository.string(variable: .apiVersion), !host.isEmpty, !apiVersion.isEmpty {
                let config = ServerConfiguration(scheme: "https", host: host, apiRoute: "api/\(apiVersion)")
                AuthenticatedCall.defaultConfiguration = config
            } else {
                AuthenticatedCall.defaultConfiguration = HabiticaServerConfig.production
            }
        }
    }
    
    @objc
    func setupDatabase() {
        var config = Realm.Configuration.defaultConfiguration
        config.deleteRealmIfMigrationNeeded = true
        let fileUrl = FileManager.default
            .containerURL(forSecurityApplicationGroupIdentifier: "group.habitrpg.habitica")?
            .appendingPathComponent("habitica.realm")
        if let url = fileUrl {
            config.fileURL = url
        }
        print("Realm stored at:", config.fileURL ?? "")
        Realm.Configuration.defaultConfiguration = config
    }
    
    @objc
    func setupTheme() {
        ThemeService.shared.updateDarkMode()
        let defaults = UserDefaults.standard
        let themeName = ThemeName(rawValue: defaults.string(forKey: "theme") ?? "") ?? ThemeName.defaultTheme
        Analytics.setUserProperty(themeName.rawValue, forName: "theme")
    }
    
    @objc
    func setupUserManager() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UserManager.shared.beginListening()
        }
    }
    
    @objc
    func setupRouter() {
        RouterHandler.shared.register()
    }
    
    @objc
    func handleInitialLaunch() {
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: "wasLaunchedBefore") {
            defaults.set(true, forKey: "wasLaunchedBefore")
            
            var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
            components.hour = 19
            components.minute = 0
            let newDate = Calendar.current.date(from: components)
            
            defaults.set(true, forKey: "dailyReminderActive")
            defaults.set(newDate, forKey: "dailyReminderTime")
            defaults.set(true, forKey: "appBadgeActive")
            UIApplication.shared.cancelAllLocalNotifications()
            
            rescheduleDailyReminder()
        } else {
            guard let url = defaults.string(forKey: "initialScreenURL") else {
                return
            }
            let appDelegate = UIApplication.shared.delegate as? HRPGAppDelegate
            if let loadingViewcontroller = appDelegate?.window?.rootViewController as? LoadingViewController {
                loadingViewcontroller.loadingFinishedAction = {
                    RouterHandler.shared.handle(urlString: url)
                }
            }
        }
    }
    
    @objc
    func rescheduleDailyReminder() {
        let defaults = UserDefaults.standard
        
        let sharedApplication = UIApplication.shared
        for localNotification in sharedApplication.scheduledLocalNotifications ?? [] {
            if (localNotification.userInfo?["id"] as? String ?? "").isEmpty || (localNotification.userInfo?["isDailyNotification"] as? Bool) == true {
                sharedApplication.cancelLocalNotification(localNotification)
            }
        }
        
        if defaults.bool(forKey: "dailyReminderActive"), let date = defaults.value(forKey: "dailyReminderTime") as? Date {
            let localNotification = UILocalNotification()
            localNotification.fireDate = date
            localNotification.repeatInterval = .day
            localNotification.alertBody = L10n.rememberCheckOffDailies
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.timeZone = NSTimeZone.default
            UIApplication.shared.scheduleLocalNotification(localNotification)
        }
    }

    @objc
    func handleMaintenanceScreen() -> Bool {
        let maintenanceData = ConfigRepository().dictionary(variable: .maintenanceData)
        if let title = maintenanceData["title"] as? String, let descriptionString = maintenanceData["description"] as? String {
            displayMaintenanceScreen(title: title, descriptionString: descriptionString)
            return true
        } else {
            hideMaintenanceScreen()
        }
        return false
    }
    
    @objc
    func displayMaintenanceScreen(title: String, descriptionString: String) {
        if findMaintenanceScreen() == nil {
            let maintenanceController = MaintenanceViewController()
            maintenanceController.configure(title: title, descriptionString: descriptionString, showAppstoreButton: false)
            maintenanceController.modalPresentationStyle = .fullScreen
            maintenanceController.modalTransitionStyle = .crossDissolve
            UIApplication.topViewController()?.present(maintenanceController, animated: true, completion: nil)
        }
    }
    
    @objc
    func hideMaintenanceScreen() {
        findMaintenanceScreen()?.dismiss(animated: true, completion: nil)
    }
    
    private func findMaintenanceScreen() -> MaintenanceViewController? {
        var viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while viewController != nil {
            if let maintenanceController = viewController as? MaintenanceViewController {
                return maintenanceController
            } else {
                viewController = viewController?.presentedViewController
            }
        }
        return nil
    }
    
    @objc
    func retrieveContent() {
        let defaults = UserDefaults.standard
        let lastContentFetch = defaults.object(forKey: "lastContentFetch") as? NSDate
        let lastContentFetchVersion = defaults.object(forKey: "lastContentFetchVersion") as? String
        let currentBuildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        if lastContentFetch == nil || (lastContentFetch?.timeIntervalSinceNow ?? 0) < -300 || lastContentFetchVersion != currentBuildNumber {
            contentRepository.getFAQEntries()
                .take(first: 1)
                .flatMap(.latest) {[weak self] (entries) in
                    return self?.contentRepository.retrieveContent(force: entries.value.isEmpty) ?? Signal.empty
                }
                .on(completed: {
                    defaults.setValue(Date(), forKey: "lastContentFetch")
                    defaults.setValue(currentBuildNumber, forKey: "lastContentFetchVersion")
                })
                .start()
        }
        
        let lastWorldStateFetch = defaults.object(forKey: "lastContentFetch") as? NSDate
        if lastWorldStateFetch == nil || (lastWorldStateFetch?.timeIntervalSinceNow ?? 0) < -1800 {
            contentRepository.retrieveWorldState().observeCompleted {}
        }
    }
    
    @objc
    func retrieveTasks(_ completed: @escaping ((Bool) -> Void)) {
        taskRepository.retrieveTasks().observeResult { (result) in
            switch result {
            case .success:
                completed(true)
            case .failure:
                completed(false)
            }
        }
    }
    
    @objc
    func scoreTask(_ taskId: String, direction: String, completed: @escaping (() -> Void)) {
        if let task = taskRepository.getEditableTask(id: taskId), let scoringDirection = TaskScoringDirection(rawValue: direction) {
            taskRepository.score(task: task, direction: scoringDirection).observeCompleted {
                completed()
            }
        } else {
            completed()
        }
    }
    
    @objc
    func acceptQuestInvitation(_ completed: @escaping ((Bool) -> Void)) {
        userRepository.getUser().take(first: 1)
            .map({ (user) -> String? in
                return user.party?.id
            })
            .skipNil()
            .flatMap(.latest) {[weak self] (partyID) in
                return self?.socialRepository.acceptQuestInvitation(groupID: partyID) ?? Signal.empty
            }.on(failed: { _ in
                completed(false)
            }, value: { _ in
                completed(true)
            }).start()
    }
    
    @objc
    func rejectQuestInvitation(_ completed: @escaping ((Bool) -> Void)) {
        userRepository.getUser().take(first: 1)
            .map({ (user) -> String? in
                return user.party?.id
            })
            .skipNil()
            .flatMap(.latest) {[weak self] (partyID) in
                return self?.socialRepository.rejectQuestInvitation(groupID: partyID) ?? Signal.empty
            }.on(failed: { _ in
                completed(false)
            }, value: { _ in
                completed(true)
            }).start()
    }
    
    @objc
    func sendPrivateMessage(toUserID: String, message: String, completed: @escaping ((Bool) -> Void)) {
        socialRepository.post(inboxMessage: message, toUserID: toUserID).observeResult({ (result) in
            switch result {
            case .success:
                completed(true)
            case .failure:
                completed(false)
            }
        })
    }
    
    @objc
    func displayNotificationInApp(text: String) {
        ToastManager.show(text: text, color: .purple)
        UINotificationFeedbackGenerator.oneShotNotificationOccurred(.success)
    }
    
    @objc
    func displayNotificationInApp(title: String, text: String) {
        ToastManager.show(text: "\(title)\n\(text)", color: .purple)
        UINotificationFeedbackGenerator.oneShotNotificationOccurred(.success)
    }
    
    @objc
    static func isRunningLive() -> Bool {
        #if targetEnvironment(simulator)
        return false
        #else
        let isRunningTestFlightBeta  = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
        let hasEmbeddedMobileProvision = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") != nil
        if isRunningTestFlightBeta || hasEmbeddedMobileProvision {
            return false
        } else {
            return true
        }
        #endif
    }
    
    @objc
    static func isRunningScreenshots() -> Bool {
        #if !targetEnvironment(simulator)
        return false
        #else
        return UserDefaults.standard.bool(forKey: "FASTLANE_SNAPSHOT")
        #endif
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        let dataDict: [String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    }
    
    @objc
    func displayInAppNotification(taskID: String, text: String) {
        let alertController = HabiticaAlertController(title: text)
        alertController.addAction(title: L10n.complete, style: .default, isMainAction: true, closeOnTap: true, identifier: nil) {[weak self] _ in
            self?.scoreTask(taskID, direction: "up") {}
        }
        alertController.addCloseAction()
        alertController.enqueue()
        UINotificationFeedbackGenerator.oneShotNotificationOccurred(.warning)
    }
    
    @objc
    func reloadWidgetData() {
        #if arch(arm64) || arch(i386) || arch(x86_64)
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadTimelines(ofKind: "DailiesCountWidget")
            WidgetCenter.shared.reloadTimelines(ofKind: "StatsWidget")
            
            WidgetCenter.shared.getCurrentConfigurations { result in
                switch result {
                case let .success(info):
                    Analytics.setUserProperty(String(info.count), forName: "widgetCount")
                case let .failure(error): print(error)
                }
            }
        }
        #endif
    }
}
