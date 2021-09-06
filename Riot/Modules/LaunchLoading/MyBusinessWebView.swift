// 
// Copyright 2021 New Vector Ltd
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

import UIKit
import WebKit

class MyBusinessWebView: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var id = " "
        
        override func loadView() {
            webView = WKWebView()
            webView.navigationDelegate = self
            view = webView
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
            let lang = Locale.preferredLanguages[0] as String
            let arr = lang.components(separatedBy: "-")
            let deviceLang = arr.first
        
            let urlRequest = URL(string: id)!
//        let urlRequest = URL(string: "https://" + deviceLang! + ".mybusines.app/appleUserId=")!
            var myUrlRequest = URLRequest(url: urlRequest)
            myUrlRequest.setValue("Cron", forHTTPHeaderField: "user_agent")
            webView.load(URLRequest(url: urlRequest))
            
            let back = UIBarButtonItem(title:"back", style: .plain, target: webView, action: #selector(webView!.goBack))
            self.navigationItem.rightBarButtonItem = back
            navigationController?.isToolbarHidden = false
        }
    
}
