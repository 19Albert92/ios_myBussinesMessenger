// 
// Copyright 2020 Vector Creations Ltd
// Copyright 2021 QWERTY NETWORKS Llc
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation

import MatrixKit

/// BuildSettings provides settings computed at build time.
/// In future, it may be automatically generated from xcconfig files
@objcMembers
final class BuildSettings: NSObject {
    
    // MARK: - Bundle Settings
    static var bundleDisplayName: String {
        guard let bundleDisplayName = Bundle.app.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String else {
            fatalError("CFBundleDisplayName should be defined")
        }
        return bundleDisplayName
    }
    
    static var applicationGroupIdentifier: String {
        guard let applicationGroupIdentifier = Bundle.app.object(forInfoDictionaryKey: "applicationGroupIdentifier") as? String else {
            fatalError("applicationGroupIdentifier should be defined")
        }
        return applicationGroupIdentifier
    }
    
    static var baseBundleIdentifier: String {
        guard let baseBundleIdentifier = Bundle.app.object(forInfoDictionaryKey: "baseBundleIdentifier") as? String else {
            fatalError("baseBundleIdentifier should be defined")
        }
        return baseBundleIdentifier
    }
    
    static var keychainAccessGroup: String {
        guard let keychainAccessGroup = Bundle.app.object(forInfoDictionaryKey: "keychainAccessGroup") as? String else {
            fatalError("keychainAccessGroup should be defined")
        }
        return keychainAccessGroup
    }
    
    static var applicationURLScheme: String? {
        guard let urlTypes = Bundle.app.object(forInfoDictionaryKey: "CFBundleURLTypes") as? [AnyObject],
              let urlTypeDictionary = urlTypes.first as? [String: AnyObject],
              let urlSchemes = urlTypeDictionary["CFBundleURLSchemes"] as? [AnyObject],
              let externalURLScheme = urlSchemes.first as? String else {
            return nil
        }
        
        return externalURLScheme
    }
    
    static var pushKitAppIdProd: String {
        return baseBundleIdentifier + ".ios.voip.prod"
    }
    
    static var pushKitAppIdDev: String {
        return baseBundleIdentifier + ".ios.voip.dev"
    }
    
    static var pusherAppIdProd: String {
        return baseBundleIdentifier + ".ios.prod"
    }
    
    static var pusherAppIdDev: String {
        return baseBundleIdentifier + ".ios.dev"
    }
    
    static var pushKitAppId: String {
        #if DEBUG
        return pushKitAppIdDev
        #else
        return pushKitAppIdProd
        #endif
    }
    
    static var pusherAppId: String {
        #if DEBUG
        return pusherAppIdDev
        #else
        return pusherAppIdProd
        #endif
    }
    
    // MyBusiness-Web instance for the app
    static let applicationWebAppUrlString = "https://en.mybusines.app/test_mode=yes&iam=Maxim&User=yes;"
    

    // MARK: - Server configuration
    
    // Default servers proposed on the authentication screen
    static let serverConfigDefaultHomeserverUrlString = "https://matrix.m.mybusines.app/"
    static let serverConfigDefaultIdentityServerUrlString = "https://vector.im"
    
    static let serverConfigSygnalAPIUrlString = "https://matrix.m.mybusines.app/_matrix/push/v1/notify"
    
    
    // MARK: - Legal URLs
    
    // Note: Set empty strings to hide the related entry in application settings
    static let applicationCopyrightUrlString = "https://element.io/copyright"
    
    let lang = Locale.preferredLanguages[0] as String
    let lang_code = Locale.current.identifier
    let la = NSLocale.current.languageCode!

    
    static let applicationPrivacyPolicyUrlString = "https://mybusines.app/privacy"
    static let applicationTermsConditionsUrlString = "https://mybusines.app/agreement"
    static let applicationHelpUrlString = "https://element.io/help"
//        "https://matrix.to/#/#element-ios:matrix.org"
    
    
    // MARk: - Matrix permalinks
    // Paths for URLs that will considered as Matrix permalinks. Those permalinks are opened within the app
    static let matrixPermalinkPaths: [String: [String]] = [
        "app.element.io": [],
        "staging.element.io": [],
        "develop.element.io": [],
        "mobile.element.io": [""],
        // Historical ones
        "riot.im": ["/app", "/staging", "/develop"],
        "www.riot.im": ["/app", "/staging", "/develop"],
        "vector.im": ["/app", "/staging", "/develop"],
        "www.vector.im": ["/app", "/staging", "/develop"],
        // Official Matrix ones
        "matrix.to": ["/"],
        "www.matrix.to": ["/"],
    ]
    
    
    // MARK: - VoIP
    static var allowVoIPUsage: Bool {
        #if canImport(JitsiMeetSDK)
        return true
        #else
        return false
        #endif
    }
    static let stunServerFallbackUrlString: String? = "support@qwertynetworks.com"
    
    
    // MARK: -  Public rooms Directory
    static let publicRoomsShowDirectory: Bool = true
    static let publicRoomsAllowServerChange: Bool = false
    // List of homeservers for the public rooms directory
    static let publicRoomsDirectoryServers = [
        "matrix.org",
        "gitter.im"
    ]
    
    // MARK: -  Rooms Screen
    static let roomsAllowToJoinPublicRooms: Bool = true
    
    // MARK: - Analytics
    static let analyticsServerUrl = URL(string: "https://piwik.riot.im/piwik.php")
    static let analyticsAppId = "14"
    
    
    // MARK: - Bug report
    static let bugReportEndpointUrlString = "https://riot.im/bugreports"
    // Use the name allocated by the bug report server
    static let bugReportApplicationId = "riot-ios"
    
    
    // MARK: - Integrations
    static let integrationsUiUrlString = "https://scalar.vector.im/"
    static let integrationsRestApiUrlString = "https://scalar.vector.im/api"
    // Widgets in those paths require a scalar token
    static let integrationsScalarWidgetsPaths = [
        "https://scalar.vector.im/_matrix/integrations/v1",
        "https://scalar.vector.im/api",
        "https://scalar-staging.vector.im/_matrix/integrations/v1",
        "https://scalar-staging.vector.im/api",
        "https://scalar-staging.riot.im/scalar/api",
    ]
    // Jitsi server used outside integrations to create conference calls from the call button in the timeline
    static let jitsiServerUrl: URL = URL(string: "https://jitsi.riot.im")!

    
    // MARK: - Features
    
    /// Setting to force protection by pin code
    static let forcePinProtection: Bool = false
    
    /// Max allowed time to continue using the app without prompting PIN
    static let pinCodeGraceTimeInSeconds: TimeInterval = 0
    
    /// Force non-jailbroken app usage
    static let forceNonJailbrokenUsage: Bool = true
    
    static let allowSendingStickers: Bool = true
    
    static let allowLocalContactsAccess: Bool = false
    
    static let allowInviteExernalUsers: Bool = true
    
    static let enableSideMenu: Bool = true
    
    // MARK: - Feature Specifics
    
    /// Not allowed pin codes. User won't be able to select one of the pin in the list.
    static let notAllowedPINs: [String] = []
    
    /// Maximum number of allowed pin failures when unlocking, before force logging out the user. Defaults to `3`
    static let maxAllowedNumberOfPinFailures: Int = 3
    
    /// Maximum number of allowed biometrics failures when unlocking, before fallbacking the user to the pin if set or logging out the user. Defaults to `5`
    static let maxAllowedNumberOfBiometricsFailures: Int = 5
    
    /// Indicates should the app log out the user when number of PIN failures reaches `maxAllowedNumberOfPinFailures`. Defaults to `false`
    static let logOutUserWhenPINFailuresExceeded: Bool = false
    
    /// Indicates should the app log out the user when number of biometrics failures reaches `maxAllowedNumberOfBiometricsFailures`. Defaults to `false`
    static let logOutUserWhenBiometricsFailuresExceeded: Bool = false
    
    // MARK: - Main Tabs
    
    static let homeScreenShowFavouritesTab: Bool = true
    static let homeScreenShowPeopleTab: Bool = true
    static let homeScreenShowRoomsTab: Bool = true
    static let homeScreenShowCommunitiesTab: Bool = true

    // MARK: - General Settings Screen
    
    static let settingsScreenShowUserFirstName: Bool = false
    static let settingsScreenShowUserSurname: Bool = false
    static let settingsScreenAllowAddingEmailThreepids: Bool = true
    static let settingsScreenAllowAddingPhoneThreepids: Bool = false
    static let settingsScreenShowThreepidExplanatory: Bool = false
    static let settingsScreenShowDiscoverySettings: Bool = false
    static let settingsScreenAllowIdentityServerConfig: Bool = false
    static let settingsScreenShowAdvancedSettings: Bool = false
    static let settingsScreenShowLabSettings: Bool = false
    static let settingsScreenAllowChangingRageshakeSettings: Bool = false
    static let settingsScreenAllowChangingCrashUsageDataSettings: Bool = false
    static let settingsScreenAllowBugReportingManually: Bool = false
    static let settingsScreenAllowDeactivatingAccount: Bool = false
    static let settingsScreenShowChangePassword:Bool = true
    static let settingsScreenShowInviteFriends:Bool = true
    static let settingsScreenShowEnableStunServerFallback: Bool = true
    static let settingsScreenShowNotificationDecodedContentOption: Bool = false
    static let settingsScreenShowNsfwRoomsOption: Bool = true
    static let settingsSecurityScreenShowSessions:Bool = false
    static let settingsSecurityScreenShowSetupBackup:Bool = false
    static let settingsSecurityScreenShowRestoreBackup:Bool = false
    static let settingsSecurityScreenShowDeleteBackup:Bool = true
    static let settingsSecurityScreenShowCryptographyInfo:Bool = false
    static let settingsSecurityScreenShowCryptographyExport:Bool = false
    static let settingsSecurityScreenShowAdvancedUnverifiedDevices:Bool = false

    // MARK: - Timeline settings
    static let roomInputToolbarCompressionMode = MXKRoomInputToolbarCompressionModePrompt
    
    // MARK: - Room Creation Screen
    
    static let roomCreationScreenAllowEncryptionConfiguration: Bool = true
    static let roomCreationScreenRoomIsEncrypted: Bool = true
    static let roomCreationScreenAllowRoomTypeConfiguration: Bool = true
    static let roomCreationScreenRoomIsPublic: Bool = false
    
    // MARK: - Room Screen
    
    static let roomScreenAllowVoIPForDirectRoom: Bool = true
    static let roomScreenAllowVoIPForNonDirectRoom: Bool = true
    static let roomScreenAllowCameraAction: Bool = true
    static let roomScreenAllowMediaLibraryAction: Bool = true
    static let roomScreenAllowStickerAction: Bool = true
    static let roomScreenAllowFilesAction: Bool = true
    
    // MARK: - Room Contextual Menu

    static let roomContextualMenuShowMoreOptionForMessages: Bool = true
    static let roomContextualMenuShowMoreOptionForStates: Bool = true
    static let roomContextualMenuShowReportContentOption: Bool = true

    // MARK: - Room Info Screen
    
    static let roomInfoScreenShowIntegrations: Bool = false

    // MARK: - Room Settings Screen
    
    static let roomSettingsScreenShowLowPriorityOption: Bool = true
    static let roomSettingsScreenShowDirectChatOption: Bool = true
    static let roomSettingsScreenAllowChangingAccessSettings: Bool = true
    static let roomSettingsScreenAllowChangingHistorySettings: Bool = true
    static let roomSettingsScreenShowAddressSettings: Bool = true
    static let roomSettingsScreenShowFlairSettings: Bool = true
    static let roomSettingsScreenShowAdvancedSettings: Bool = true
    static let roomSettingsScreenAdvancedShowEncryptToVerifiedOption: Bool = true

    // MARK: - Room Member Screen
    
    static let roomMemberScreenShowIgnore: Bool = true

    // MARK: - Message
    static let messageDetailsAllowShare: Bool = true
    static let messageDetailsAllowPermalink: Bool = true
    static let messageDetailsAllowViewSource: Bool = true
    static let messageDetailsAllowSave: Bool = true
    static let messageDetailsAllowCopyMedia: Bool = true
    static let messageDetailsAllowPasteMedia: Bool = true
    
    // MARK: - HTTP
    /// Additional HTTP headers will be sent by all requests. Not recommended to use request-specific headers, like `Authorization`.
    /// Empty dictionary by default.
    static let httpAdditionalHeaders: [String: String] = [:]
    
    
    // MARK: - Authentication Screen
    static let authScreenShowRegister = false
    static let authScreenShowPhoneNumber = false
    static let authScreenShowForgotPassword = true
    static let authScreenShowCustomServerOptions = false
    
    // Mark: - Unified Search
    static let unifiedSearchScreenShowPublicDirectory = true
}
