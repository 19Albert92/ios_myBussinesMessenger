// 
// Copyright 2021 New Vector Ltd
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

/// SideMenuItem represents side menu actions
enum SideMenuItem {
//    case inviteFriends
    case settings
    case web
    case showToast
//    case help
//    case feedback
}

extension SideMenuItem {
    
    var title: String {
        let title: String

        switch self {
//        case .inviteFriends:
//            title = VectorL10n.sideMenuActionInviteFriends
        case .settings:
            title = VectorL10n.sideMenuActionSettings
        case .web :
            title = "MY BUSINESS"
        case .showToast:
            title = "About"
//       case .help:
//           title = VectorL10n.sideMenuActionHelp
//        case .feedback:
//            title = VectorL10n.sideMenuActionFeedback
        }

        return title
    }
    
    var icon: UIImage {
        let icon: UIImage

        switch self {
//        case .inviteFriends:
//            icon = Asset.Images.sideMenuActionIconShare.image
        case .settings:
            icon = Asset.Images.sideMenuActionIconSettings.image
        case .web:
            icon = UIImage(named: "icon_webview_item")!
        case .showToast:
            icon = Asset.Images.sideMenuActionIconHelp.image
//       case .help:
//          icon = Asset.Images.sideMenuActionIconHelp.image
//        case .feedback:
//            icon = Asset.Images.sideMenuActionIconFeedback.image
        }

        return icon
    }
}
