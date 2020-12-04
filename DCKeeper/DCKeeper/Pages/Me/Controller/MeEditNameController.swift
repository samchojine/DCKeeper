//
//  MeEditNameController.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/27.
//

import UIKit

class MeEditNameController: PJBaseTableViewController {
    
    lazy var nameTF: UITextField = {
        let tf = UITextField(frame: CGRect(0, 0, kScreenWidth, 44))
        tf.backgroundColor = kWhiteColor
        tf.placeholder = "请输入昵称"
        tf.font = k_RegularFont(size: 14)
        tf.textColor = k33COLOR
        tf.leftViewMode = .always
        tf.leftView = UIView(frame: CGRect(0, 0, 20, 20))
        tf.becomeFirstResponder()
        tf.clearButtonMode = .always
        tf.returnKeyType = .done
        tf.delegate = self
        return tf
    }()
    
    var userName:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviTitle = "修改昵称"
        self.naviBar.addRightItem(title: "确定", font: k_RegularFont(size: 14), titleColor: kRedColor) { [weak self](_) in
            self?.requstChangeNickName()
        }
        self.tableView.tableHeaderView = self.nameTF;
        self.nameTF.text = self.userName
    }
    
    func requstChangeNickName(){
        
        if self.nameTF.text!.isEmpty == true {
            self.showText(text: "昵称不能为空")
            return
        }
        
        if self.nameTF.text!.count > 12 {
            self.showText(text: "昵称不能超过12个字")
            return
        }
        
        self.showLoading()
        var param : [String:Any] = [:]
        param["userId"] = UserManager.shared.user?.userId
        param["userName"] = self.nameTF.text
        MeProvider.request(.modifyNikeName(parameters: param)) { (result) in
            self.dismissHud()
            result.getIsSuccess { (msg) in
                self.showSuccess(text: msg) {
                    self.navigationController?.popViewController(animated: true)
                }
            } failed: { (error) in
                self.showError(text: error.localizedDescription)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        IQKeyboardManager.shared.enable = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        IQKeyboardManager.shared.enable = true
    }

}

extension MeEditNameController :UITextFieldDelegate{
    
    // 点击键盘回车键
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.requstChangeNickName()
        return true
    }
    
}
