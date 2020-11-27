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
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviTitle = "修改昵称"
        self.naviBar.addRightItem(title: "确定", font: k_RegularFont(size: 14), titleColor: kRedColor) { (btn) in
            
        }
        self.tableView.tableHeaderView = self.nameTF;
        
    
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
