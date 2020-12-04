//
//  LoginController.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/23.
//

import UIKit


class LoginController: PJBaseTableViewController {
    
    var loginV:LoginView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviHide = true;
   
        loginV = LoginView(frame: self.view.bounds);
        
        // 正在tableView里面可以让界面滚动
        self.tableView.tableHeaderView = loginV;
        self.tableView.backgroundColor = kWhiteColor;
        
        
        // 点击登录
        loginV.loginBlock = { (phone, psw) in
            
            var param : [String:Any] = [:]
            param["principal"] = phone
            param["credentials"] = psw.MD5()
            param["tunnel"] = "1";
            LoginProvider.request(.login(parameters: param)) { (result) in
                
                result.getDataDictionary { (dict) in
                    let user = UserModel.deserialize(from: dict)
                    UserManager.shared.user = user
                    
                    self.showSuccess(text: "登录成功") {
                        self.dismiss(animated: true) {
                            
                        }
                    }
                } failed: { (error) in
                    self.showError(text: error.localizedDescription)
                }

           }
        }
 
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
