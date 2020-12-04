//
//  RegisterController.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/24.
//

import UIKit

class RegisterController: PJBaseTableViewController {

    var registerV:RegisterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.naviTitle = "注册"
        
        registerV = RegisterView(frame: CGRect(0, 0, kScreenWidth, kScreenHeight - kTopHeight));
        
        // 正在tableView里面可以让界面滚动
        self.tableView.tableHeaderView = registerV;
        self.tableView.backgroundColor = kWhiteColor;
        
        
        // 点击登录
        registerV.registerBlock = { (phone, psw) in
            
     
            var param : [String:Any] = [:]
            param["principal"] = phone
            param["credentials"] = psw.MD5()
            param["tunnel"] = "1";
            
            self.view .showLoading()
            LoginProvider.request(.login(parameters: param)) { (result) in
                self.showSuccess(text: "登录成功") {
                    self.dismiss(animated: true) {

                    }
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
