// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {
  /// Cancel
  internal static let cancel = L10n.tr("Main", "cancel")
  /// Chat
  internal static let chat = L10n.tr("Main", "chat")
  /// Close
  internal static let close = L10n.tr("Main", "close")
  /// Confirm
  internal static let confirm = L10n.tr("Main", "confirm")
  /// Controls
  internal static let controls = L10n.tr("Main", "controls")
  /// Create
  internal static let create = L10n.tr("Main", "create")
  /// Daily
  internal static let daily = L10n.tr("Main", "daily")
  /// Description
  internal static let description = L10n.tr("Main", "description")
  /// Details
  internal static let details = L10n.tr("Main", "details")
  /// Difficulty
  internal static let difficulty = L10n.tr("Main", "difficulty")
  /// Discover
  internal static let discover = L10n.tr("Main", "discover")
  /// Edit
  internal static let edit = L10n.tr("Main", "edit")
  /// Eggs
  internal static let eggs = L10n.tr("Main", "eggs")
  /// Equip
  internal static let equip = L10n.tr("Main", "equip")
  /// Experience
  internal static let experience = L10n.tr("Main", "experience")
  /// Food
  internal static let food = L10n.tr("Main", "food")
  /// Hatch egg
  internal static let hatchEgg = L10n.tr("Main", "hatch_egg")
  /// Hatch with potion
  internal static let hatchPotion = L10n.tr("Main", "hatch_potion")
  /// Hatching Potions
  internal static let hatchingPotions = L10n.tr("Main", "hatching_potions")
  /// Health
  internal static let health = L10n.tr("Main", "health")
  /// Invite Party
  internal static let inviteParty = L10n.tr("Main", "invite_party")
  /// Last Activity %@
  internal static func lastActivity(_ p1: String) -> String {
    return L10n.tr("Main", "last_activity", p1)
  }
  /// Leader
  internal static let leader = L10n.tr("Main", "leader")
  /// Leave
  internal static let leave = L10n.tr("Main", "leave")
  /// Level %d
  internal static func levelNumber(_ p1: Int) -> String {
    return L10n.tr("Main", "level_number", p1)
  }
  /// Mana
  internal static let mana = L10n.tr("Main", "mana")
  /// Monthly
  internal static let monthly = L10n.tr("Main", "monthly")
  /// Mounts
  internal static let mounts = L10n.tr("Main", "mounts")
  /// My Guilds
  internal static let myGuilds = L10n.tr("Main", "my_guilds")
  /// Name
  internal static let name = L10n.tr("Main", "name")
  /// Notes
  internal static let notes = L10n.tr("Main", "notes")
  /// OK
  internal static let ok = L10n.tr("Main", "ok")
  /// Pending damage
  internal static let pendingDamage = L10n.tr("Main", "pending_damage")
  /// Pets
  internal static let pets = L10n.tr("Main", "pets")
  /// Purchase for %d Gems
  internal static func purchaseForGems(_ p1: Int) -> String {
    return L10n.tr("Main", "purchase_for_gems", p1)
  }
  /// Quests
  internal static let quests = L10n.tr("Main", "quests")
  /// Reset Justins Tips
  internal static let resetTips = L10n.tr("Main", "reset_tips")
  /// Reset Streak
  internal static let resetStreak = L10n.tr("Main", "resetStreak")
  /// Resync
  internal static let resync = L10n.tr("Main", "resync")
  /// Resync all
  internal static let resyncAll = L10n.tr("Main", "resync_all")
  /// Resync this task
  internal static let resyncTask = L10n.tr("Main", "resync_task")
  /// Save
  internal static let save = L10n.tr("Main", "save")
  /// Search
  internal static let search = L10n.tr("Main", "search")
  /// Sell for %d gold
  internal static func sell(_ p1: Int) -> String {
    return L10n.tr("Main", "sell", p1)
  }
  /// Share
  internal static let share = L10n.tr("Main", "share")
  /// Summary
  internal static let summary = L10n.tr("Main", "summary")
  /// Sync Error
  internal static let syncError = L10n.tr("Main", "sync_error")
  /// There was an error syncing some changes.
  internal static let syncErrorMessage = L10n.tr("Main", "sync_error_message")
  /// Tags
  internal static let tags = L10n.tr("Main", "tags")
  /// Title
  internal static let title = L10n.tr("Main", "title")
  /// Unequip
  internal static let unequip = L10n.tr("Main", "unequip")
  /// Weekly
  internal static let weekly = L10n.tr("Main", "weekly")
  /// Yearly
  internal static let yearly = L10n.tr("Main", "yearly")

  internal enum Avatar {
    /// Animal Ears
    internal static let animalEars = L10n.tr("Main", "avatar.animal_ears")
    /// Background
    internal static let background = L10n.tr("Main", "avatar.background")
    /// Bangs
    internal static let bangs = L10n.tr("Main", "avatar.bangs")
    /// Beard
    internal static let beard = L10n.tr("Main", "avatar.beard")
    /// Flower
    internal static let flower = L10n.tr("Main", "avatar.flower")
    /// Glasses
    internal static let glasses = L10n.tr("Main", "avatar.glasses")
    /// Hair Style
    internal static let hairStyle = L10n.tr("Main", "avatar.hair_style")
    /// Hair Color
    internal static let hairColor = L10n.tr("Main", "avatar.hairColor")
    /// Mustache
    internal static let mustache = L10n.tr("Main", "avatar.mustache")
    /// Shirt
    internal static let shirt = L10n.tr("Main", "avatar.shirt")
    /// Skin Color
    internal static let skin = L10n.tr("Main", "avatar.skin")
    /// Wheelchair
    internal static let wheelchair = L10n.tr("Main", "avatar.wheelchair")
  }

  internal enum Classes {
    /// Become a %@
    internal static func becomeAClass(_ p1: String) -> String {
      return L10n.tr("Main", "classes.become_a_class", p1)
    }
    /// %@ Class
    internal static func classHeader(_ p1: String) -> String {
      return L10n.tr("Main", "classes.class_header", p1)
    }
    /// Healer
    internal static let healer = L10n.tr("Main", "classes.healer")
    /// Healers stand impervious against harm, and extend that protection to others. Missed Dailies and bad Habits don't faze them much, and they have ways to recover Health from failure. Play a Healer if you enjoy assisting others in your Party, or if the idea of cheating Death through hard work inspires you!
    internal static let healerDescription = L10n.tr("Main", "classes.healer_description")
    /// Mage
    internal static let mage = L10n.tr("Main", "classes.mage")
    /// Mages learn swiftly, gaining Experience and Levels faster than other classes. They also get a great deal of Mana for using special abilities. Play a Mage if you enjoy the tactical game aspects of Habitica, or if you are strongly motivated by leveling up and unlocking advanced features! 
    internal static let mageDescription = L10n.tr("Main", "classes.mage_description")
    /// Rogue
    internal static let rogue = L10n.tr("Main", "classes.rogue")
    /// Rogues love to accumulate wealth, gaining more Gold than anyone else, and are adept at finding random items. Their iconic Stealth ability lets them duck the consequences of missed Dailies. Play a Rogue if you find strong motivation from Rewards and Achievements, striving for loot and badges!
    internal static let rogueDescription = L10n.tr("Main", "classes.rogue_description")
    /// Warrior
    internal static let warrior = L10n.tr("Main", "classes.warrior")
    /// Warriors score more and better "critical hits", which randomly give bonus Gold, Experience, and drop chance for scoring a task. They also deal heavy damage to boss monsters. Play a Warrior if you find motivation from unpredictable jackpot-style rewards, or want to dish out the hurt in boss Quests!
    internal static let warriorDescription = L10n.tr("Main", "classes.warrior_description")
  }

  internal enum Equipment {
    /// Armor
    internal static let armor = L10n.tr("Main", "equipment.armor")
    /// Auto-Equip new
    internal static let autoEquip = L10n.tr("Main", "equipment.auto_equip")
    /// Back Accessory
    internal static let back = L10n.tr("Main", "equipment.back")
    /// Battle Gear
    internal static let battleGear = L10n.tr("Main", "equipment.battle_gear")
    /// Body Accessory
    internal static let body = L10n.tr("Main", "equipment.body")
    /// Costume
    internal static let costume = L10n.tr("Main", "equipment.costume")
    /// Select "Use Costume" to equip items to your avatar without affecting the Stats from your Battle Gear! This means that you can dress up your avatar in whatever outfit you like while still having your best Battle Gear equipped.
    internal static let costumeExplanation = L10n.tr("Main", "equipment.costume_explanation")
    /// Eyewear
    internal static let eyewear = L10n.tr("Main", "equipment.eyewear")
    /// Head Gear
    internal static let head = L10n.tr("Main", "equipment.head")
    /// Head Accessory
    internal static let headAccessory = L10n.tr("Main", "equipment.head_accessory")
    /// Nothing Equipped
    internal static let nothingEquipped = L10n.tr("Main", "equipment.nothing_equipped")
    /// Off-Hand
    internal static let offHand = L10n.tr("Main", "equipment.off_hand")
    /// Use Costume
    internal static let useCostume = L10n.tr("Main", "equipment.use_costume")
    /// Weapon
    internal static let weapon = L10n.tr("Main", "equipment.weapon")
  }

  internal enum Groups {
    /// Assign new Leader
    internal static let assignNewLeader = L10n.tr("Main", "groups.assign_new_leader")
    /// Only leader can create Challenges
    internal static let leaderChallenges = L10n.tr("Main", "groups.leader_challenges")
  }

  internal enum Guilds {
    /// Keep challenges
    internal static let keepChallenges = L10n.tr("Main", "guilds.keep_challenges")
    /// Leave Challenges
    internal static let leaveChallenges = L10n.tr("Main", "guilds.leave_challenges")
    /// Do you want to leave the guild and keep or delete the challenges?
    internal static let leaveGuildDescription = L10n.tr("Main", "guilds.leave_guild_description")
    /// LeaveGuild?
    internal static let leaveGuildTitle = L10n.tr("Main", "guilds.leave_guild_title")
  }

  internal enum Inventory {
    /// Available Until %@
    internal static func availableUntil(_ p1: String) -> String {
      return L10n.tr("Main", "inventory.available_until", p1)
    }
    /// You hatched a new pet!
    internal static let hatched = L10n.tr("Main", "inventory.hatched")
    /// I just hatched a %@ %@ pet in Habitica by completing my real-life tasks!
    internal static func hatchedSharing(_ p1: String, _ p2: String) -> String {
      return L10n.tr("Main", "inventory.hatchedSharing", p1, p2)
    }
    /// No more Gems available this month. More become available within the first 3 days of each month.
    internal static let noGemsLeft = L10n.tr("Main", "inventory.no_gems_left")
    /// Monthly Gems: %d/%d Remaining
    internal static func numberGemsLeft(_ p1: Int, _ p2: Int) -> String {
      return L10n.tr("Main", "inventory.number_gems_left", p1, p2)
    }
    /// Only available for %@s. You can change your class from Settings
    internal static func wrongClass(_ p1: String) -> String {
      return L10n.tr("Main", "inventory.wrong_class", p1)
    }
  }

  internal enum Member {
    /// Last logged in
    internal static let lastLoggedIn = L10n.tr("Main", "member.last_logged_in")
    /// Member Since
    internal static let memberSince = L10n.tr("Main", "member.member_since")
  }

  internal enum Menu {
    /// About
    internal static let about = L10n.tr("Main", "menu.about")
    /// Cast Spells
    internal static let castSpells = L10n.tr("Main", "menu.cast_spells")
    /// Challenges
    internal static let challenges = L10n.tr("Main", "menu.challenges")
    /// Customize Avatar
    internal static let customizeAvatar = L10n.tr("Main", "menu.customize_avatar")
    /// Equipment
    internal static let equipment = L10n.tr("Main", "menu.equipment")
    /// Gems & Subscriptions
    internal static let gemsSubscriptions = L10n.tr("Main", "menu.gems_subscriptions")
    /// Guilds
    internal static let guilds = L10n.tr("Main", "menu.guilds")
    /// Help & FAQ
    internal static let helpFaq = L10n.tr("Main", "menu.help_faq")
    /// Inventory
    internal static let inventory = L10n.tr("Main", "menu.inventory")
    /// Items
    internal static let items = L10n.tr("Main", "menu.items")
    /// News
    internal static let news = L10n.tr("Main", "menu.news")
    /// Party
    internal static let party = L10n.tr("Main", "menu.party")
    /// Select Class
    internal static let selectClass = L10n.tr("Main", "menu.select_class")
    /// Shops
    internal static let shops = L10n.tr("Main", "menu.shops")
    /// Social
    internal static let social = L10n.tr("Main", "menu.social")
    /// Stable
    internal static let stable = L10n.tr("Main", "menu.stable")
    /// Stats
    internal static let stats = L10n.tr("Main", "menu.stats")
    /// Tavern
    internal static let tavern = L10n.tr("Main", "menu.tavern")
    /// Use Skills
    internal static let useSkills = L10n.tr("Main", "menu.use_skills")
  }

  internal enum Party {
    /// %@ invited you to participate in a quest
    internal static func invitedToQuest(_ p1: String) -> String {
      return L10n.tr("Main", "party.invited_to_quest", p1)
    }
    /// %d/%d Members responded
    internal static func questNumberResponded(_ p1: Int, _ p2: Int) -> String {
      return L10n.tr("Main", "party.quest_number_responded", p1, p2)
    }
    /// %d Participants
    internal static func questParticipantCount(_ p1: Int) -> String {
      return L10n.tr("Main", "party.quest_participant_count", p1)
    }
  }

  internal enum Quests {
    /// Accepted
    internal static let accepted = L10n.tr("Main", "quests.accepted")
    /// Boss battle
    internal static let bossBattle = L10n.tr("Main", "quests.boss_battle")
    /// Collection quest
    internal static let collectionQuest = L10n.tr("Main", "quests.collection_quest")
    /// Are you sure you want to abort this mission? It will abort it for everyone in your party and all progress will be lost. The quest scroll will be returned to the quest owner.
    internal static let confirmAbort = L10n.tr("Main", "quests.confirm_abort")
    /// Are you sure you want to cancel this quest? All invitation acceptances will be lost. The quest owner will retain possession of the quest scroll.
    internal static let confirmCancelInvitation = L10n.tr("Main", "quests.confirm_cancel_invitation")
    /// Are you sure? Not all party members have joined this quest! Quests start automatically when all players have joined or rejected the invitation.
    internal static let confirmForceStart = L10n.tr("Main", "quests.confirm_force_start")
    /// Invitations
    internal static let invitationsHeader = L10n.tr("Main", "quests.invitations_header")
    /// Participants
    internal static let participantsHeader = L10n.tr("Main", "quests.participants_header")
    /// Pending
    internal static let pending = L10n.tr("Main", "quests.pending")
    /// Rejected
    internal static let rejected = L10n.tr("Main", "quests.rejected")
    /// Started by %@
    internal static func startedBy(_ p1: String) -> String {
      return L10n.tr("Main", "quests.started_by", p1)
    }
  }

  internal enum Settings {
    /// API
    internal static let api = L10n.tr("Main", "settings.api")
    /// Authentication
    internal static let authentication = L10n.tr("Main", "settings.authentication")
    /// Change Class
    internal static let changeClass = L10n.tr("Main", "settings.change_class")
    /// Clear Cache
    internal static let clearCache = L10n.tr("Main", "settings.clear_cache")
    /// Custom Day Start
    internal static let customDayStart = L10n.tr("Main", "settings.custom_day_start")
    /// Daily Reminder
    internal static let dailyReminder = L10n.tr("Main", "settings.daily_reminder")
    /// Day Start
    internal static let dayStart = L10n.tr("Main", "settings.day_start")
    /// Disable all Push Notifications
    internal static let disableAllNotifications = L10n.tr("Main", "settings.disable_all_notifications")
    /// Disable Private Messages
    internal static let disablePm = L10n.tr("Main", "settings.disable_pm")
    /// Display Notification Badge
    internal static let displayNotificationBadge = L10n.tr("Main", "settings.display_notification_badge")
    /// Every day at
    internal static let everyDay = L10n.tr("Main", "settings.every_day")
    /// Fix Character Values
    internal static let fixCharacterValues = L10n.tr("Main", "settings.fix_characterValues")
    /// Log Out
    internal static let logOut = L10n.tr("Main", "settings.log_out")
    /// Maintenance
    internal static let maintenance = L10n.tr("Main", "settings.maintenance")
    /// Notification Badge
    internal static let notificationBadge = L10n.tr("Main", "settings.notification_badge")
    /// Preferences
    internal static let preferences = L10n.tr("Main", "settings.preferences")
    /// Profile
    internal static let profile = L10n.tr("Main", "settings.profile")
    /// Push Notifications
    internal static let pushNotifications = L10n.tr("Main", "settings.push_notifications")
    /// Reload Content
    internal static let reloadContent = L10n.tr("Main", "settings.reload_content")
    /// Reminder
    internal static let reminder = L10n.tr("Main", "settings.reminder")
    /// Social
    internal static let social = L10n.tr("Main", "settings.social")
    /// Theme Color
    internal static let themeColor = L10n.tr("Main", "settings.themeColor")
    /// User
    internal static let user = L10n.tr("Main", "settings.user")
  }

  internal enum Skills {
    /// Can't cast a spell on a challenge task
    internal static let cantCastOnChallengeTasks = L10n.tr("Main", "skills.cant_cast_on_challenge_tasks")
    /// Unlocks at level %d
    internal static func unlocksAt(_ p1: Int) -> String {
      return L10n.tr("Main", "skills.unlocks_at", p1)
    }
    /// You use %@
    internal static func useSkill(_ p1: String) -> String {
      return L10n.tr("Main", "skills.use_skill", p1)
    }
  }

  internal enum Stable {
    /// Feed
    internal static let feed = L10n.tr("Main", "stable.feed")
    /// Magic Potion
    internal static let premium = L10n.tr("Main", "stable.premium")
    /// Quest Mounts
    internal static let questMounts = L10n.tr("Main", "stable.quest_mounts")
    /// Quest Pets
    internal static let questPets = L10n.tr("Main", "stable.quest_pets")
    /// Special Mounts
    internal static let specialMounts = L10n.tr("Main", "stable.special_mounts")
    /// Special Pets
    internal static let specialPets = L10n.tr("Main", "stable.special_pets")
    /// Standard
    internal static let standard = L10n.tr("Main", "stable.standard")
    /// Standard Mounts
    internal static let standardMounts = L10n.tr("Main", "stable.standard_mounts")
    /// Standard Pets
    internal static let standardPets = L10n.tr("Main", "stable.standard_pets")
  }

  internal enum Stats {
    /// Allocated
    internal static let allocated = L10n.tr("Main", "stats.allocated")
    /// Battle Gear
    internal static let battleGear = L10n.tr("Main", "stats.battle_gear")
    /// Buffs
    internal static let buffs = L10n.tr("Main", "stats.buffs")
    /// Class-Bonus
    internal static let classBonus = L10n.tr("Main", "stats.class_bonus")
    /// Level
    internal static let level = L10n.tr("Main", "stats.level")
    /// 0 Points to Allocate
    internal static let noPointsToAllocate = L10n.tr("Main", "stats.no_points_to_allocate")
    /// 1 Point to Allocate
    internal static let onePointToAllocate = L10n.tr("Main", "stats.one_point_to_allocate")
    /// %d Point to Allocate
    internal static func pointsToAllocate(_ p1: Int) -> String {
      return L10n.tr("Main", "stats.points_to_allocate", p1)
    }
  }

  internal enum Tasks {
    /// Daily
    internal static let daily = L10n.tr("Main", "tasks.daily")
    /// Habit
    internal static let habit = L10n.tr("Main", "tasks.habit")
    /// Reward
    internal static let reward = L10n.tr("Main", "tasks.reward")
    /// To-Do
    internal static let todo = L10n.tr("Main", "tasks.todo")

    internal enum Form {
      /// Checklist
      internal static let checklist = L10n.tr("Main", "tasks.form.checklist")
      /// Controls
      internal static let controls = L10n.tr("Main", "tasks.form.controls")
      /// Cost
      internal static let cost = L10n.tr("Main", "tasks.form.cost")
      /// New %@
      internal static func create(_ p1: String) -> String {
        return L10n.tr("Main", "tasks.form.create", p1)
      }
      /// What do you want to do regularly?
      internal static let dailiesTitlePlaceholder = L10n.tr("Main", "tasks.form.dailies_title_placeholder")
      /// Day of the month
      internal static let dayOfMonth = L10n.tr("Main", "tasks.form.day_of_month")
      /// Day of the week
      internal static let dayOfWeek = L10n.tr("Main", "tasks.form.day_of_week")
      /// Difficulty
      internal static let difficulty = L10n.tr("Main", "tasks.form.difficulty")
      /// Due date
      internal static let dueDate = L10n.tr("Main", "tasks.form.due_date")
      /// Edit %@
      internal static func edit(_ p1: String) -> String {
        return L10n.tr("Main", "tasks.form.edit", p1)
      }
      /// Every
      internal static let every = L10n.tr("Main", "tasks.form.every")
      /// What habits do you want to foster or break?
      internal static let habitTitlePlaceholder = L10n.tr("Main", "tasks.form.habit_title_placeholder")
      /// New checklist item
      internal static let newChecklistItem = L10n.tr("Main", "tasks.form.new_checklist_item")
      /// New reminder
      internal static let newReminder = L10n.tr("Main", "tasks.form.new_reminder")
      /// Include any notes to help you out
      internal static let notesPlaceholder = L10n.tr("Main", "tasks.form.notes_placeholder")
      /// Remind me
      internal static let remindMe = L10n.tr("Main", "tasks.form.remind_me")
      /// Reminders
      internal static let reminders = L10n.tr("Main", "tasks.form.reminders")
      /// Repeats
      internal static let repeats = L10n.tr("Main", "tasks.form.repeats")
      /// Reset Streak
      internal static let resetStreak = L10n.tr("Main", "tasks.form.reset_streak")
      /// How do you want to reward yourself?
      internal static let rewardsTitlePlaceholder = L10n.tr("Main", "tasks.form.rewards_title_placeholder")
      /// Scheduling
      internal static let scheduling = L10n.tr("Main", "tasks.form.scheduling")
      /// Start date
      internal static let startDate = L10n.tr("Main", "tasks.form.start_date")
      /// Tags
      internal static let tags = L10n.tr("Main", "tasks.form.tags")
      /// What do you want to complete once?
      internal static let todosTitlePlaceholder = L10n.tr("Main", "tasks.form.todos_title_placeholder")
    }
  }

  internal enum Theme {
    /// Blue
    internal static let blue = L10n.tr("Main", "theme.blue")
    /// Default
    internal static let defaultTheme = L10n.tr("Main", "theme.default_theme")
    /// Green
    internal static let green = L10n.tr("Main", "theme.green")
    /// Maroon
    internal static let maroon = L10n.tr("Main", "theme.maroon")
    /// Orange
    internal static let orange = L10n.tr("Main", "theme.orange")
    /// Red
    internal static let red = L10n.tr("Main", "theme.red")
    /// Teal
    internal static let teal = L10n.tr("Main", "theme.teal")
    /// Yellow
    internal static let yellow = L10n.tr("Main", "theme.yellow")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}