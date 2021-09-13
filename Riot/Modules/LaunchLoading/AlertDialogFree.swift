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

//import Foundation
//class NewAlertDialog: UIViewController {
//    
//func showAlert(title: String, message: String) {
//    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height - 100, width: 300, height: 35))
//    toastLabel.backgroundColor = UIColor.black
//    toastLabel.textColor = UIColor.white
//    toastLabel.textAlignment = NSTextAlignment.center
//    self.view.addSubview(toastLabel)
//    
//    toastLabel.text = message
//    toastLabel.alpha = 1.0
//    toastLabel.layer.cornerRadius = 10;
//    toastLabel.clipsToBounds = true
//    UIView.animate(withDuration: 5.0, animations:{ toastLabel.alpha = 0.0})
//    
//}
//}

//class ShowAlertController: UIViewController {
//
//    @IBOutlet weak var messageView: UIView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        messageView.layer.cornerRadius = 24
//        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//}
