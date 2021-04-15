//
//  InAppRewardCell.swift
//  Habitica
//
//  Created by Phillip on 21.08.17.
//  Copyright © 2017 HabitRPG Inc. All rights reserved.
//

import UIKit
import Habitica_Models

class InAppRewardCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: NetworkImageView!
    @IBOutlet weak var currencyView: HRPGCurrencyCountView!
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var pinnedIndicatorView: UIImageView!
    @IBOutlet weak var purchaseConfirmationView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var currencyBackgroundView: UIView!
    @IBOutlet weak var unlockLabel: UILabel!
    
    private var itemName = ""
    
    var itemsLeft = 0 {
        didSet {
            if itemsLeft > 0 {
                infoLabel.isHidden = false
                infoLabel.text = String(describing: itemsLeft)
                if availableUntil != nil {
                    infoLabel.backgroundColor = UIColor(red: 0.380, green: 0.200, blue: 0.706, alpha: 1.000)
                    infoLabel.textColor = ThemeService.shared.theme.lightTextColor
                } else {
                    infoLabel.backgroundColor = ThemeService.shared.theme.offsetBackgroundColor
                    infoLabel.textColor = ThemeService.shared.theme.ternaryTextColor
                }
            }
        }
    }
    
    private var isLocked = false {
        didSet {
            if isLocked {
                if availableUntil != nil {
                    infoImageView.image = HabiticaIcons.imageOfItemIndicatorLocked(indicatorLocked: UIColor(red: 0.380, green: 0.200, blue: 0.706, alpha: 1.000))
                } else {
                    
                }
                infoImageView.isHidden = false
                infoLabel.isHidden = true
            }
        }
    }
    
    private var availableUntil: Date? = nil {
        didSet {
            if availableUntil != nil {
                infoImageView.image = HabiticaIcons.imageOfItemIndicatorLimited()
                infoImageView.isHidden = false
                infoLabel.isHidden = true
            }
        }
    }
    
    public var imageName = "" {
        didSet {
            if imageName.isEmpty {
                return
            }
            if imageName.contains(" ") {
                imageView.setImagewith(name: imageName.components(separatedBy: " ")[1])
            } else {
                imageView.setImagewith(name: imageName)
            }
        }
    }
    
    public var isPinned = false {
        didSet {
            pinnedIndicatorView.isHidden = !isPinned
            if isPinned {
                pinnedIndicatorView.image = HabiticaIcons.imageOfPinnedItem
            }
        }
    }
    
    func configure(reward: InAppRewardProtocol, user: UserProtocol?) {
        var currency: Currency?
        let price = reward.value
        infoImageView.isHidden = true
        infoLabel.isHidden = true
        if let date = reward.eventEnd {
            availableUntil = date
        } else {
            availableUntil = nil
        }
        currencyView.amount = Int(reward.value)
        imageName = reward.imageName ?? ""
        itemName = reward.text ?? ""
        if let currencyString = reward.currency, let thisCurrency = Currency(rawValue: currencyString) {
            currencyView.currency = thisCurrency
            currency = thisCurrency
        }
        isLocked = reward.locked
        
        if let currency = currency {
            setCanAfford(price, currency: currency, user: user)
        }
        isPinned = false
        
        if let lastPurchased = reward.lastPurchased, wasRecentlyPurchased(lastPurchased) {
            showPurchaseConfirmation()
        }

        applyAccessibility()
        
        if let lockedReason = reward.shortLockedReason, reward.locked {
            unlockLabel.text = lockedReason
            unlockLabel.isHidden = false
            currencyView.isHidden = true
        } else {
            unlockLabel.isHidden = true
            currencyView.isHidden = false
        }
        
        let theme = ThemeService.shared.theme
        backgroundColor = theme.contentBackgroundColor
        containerView.backgroundColor = theme.windowBackgroundColor
        currencyBackgroundView.backgroundColor = theme.offsetBackgroundColor.withAlphaComponent(0.3)
        unlockLabel.textColor = theme.secondaryTextColor
    }
    
    func wasRecentlyPurchased(_ lastPurchase: Date) -> Bool {
        let now = Date().addingTimeInterval(-30)
        return now < lastPurchase
    }
    
    func showPurchaseConfirmation() {
        purchaseConfirmationView.image = HabiticaIcons.imageOfCheckmark(checkmarkColor: .white, percentage: 1.0)
        UIView.animate(withDuration: 0.25, animations: {[weak self] in
            self?.purchaseConfirmationView.alpha = 1
        }, completion: {[weak self] (_) in
            UIView.animate(withDuration: 0.25, delay: 1.5, options: [], animations: {
                self?.purchaseConfirmationView.alpha = 0
            }, completion: nil)
        })
    }
    
    func setCanAfford(_ price: Float, currency: Currency, user: UserProtocol?) {
        var canAfford = false

        if let user = user {
            if currency == .gold {
                canAfford = price < user.stats?.gold ?? 0
            } else {
                canAfford = true
            }
        }
    
        if canAfford && !isLocked {
            currencyView.state = .normal
        } else {
            currencyView.state = .locked
        }
    }
    
    private func applyAccessibility() {
        shouldGroupAccessibilityChildren = true
        currencyView.isAccessibilityElement = false
        isAccessibilityElement = true
        accessibilityLabel = "\(itemName), \(currencyView.accessibilityLabel ?? "")"
    }
}
