//
//  MeSettingController.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/27.
//

import UIKit

class MeSettingController: PJBaseTableViewController {
    

    lazy var tableHeaderV: UIView = {
        let v = UIView(frame: CGRect(0, 0, kScreenWidth, 150))
        v.backgroundColor = kWhiteColor
        
        let imagV = UIImageView(image: UIImage(named: "me_head_boss"))
        v.addSubview(imagV)
        imagV.snp.makeConstraints { (make) in
            make.center.equalTo(v)
            make.width.height.equalTo(60)
        }
        
        return v
    }()
    
    lazy var tableFooterV: UIView = {
        let v = UIView(frame: CGRect(0, 0, kScreenWidth, 100))
        
        let btn = UIButton()
        btn.setTitle("退出登录", for: .normal)
        btn.setTitleColor(k33COLOR, for: .normal)
        btn.titleLabel?.font = k_RegularFont(size: 15)
        btn.backgroundColor = kWhiteColor
        v.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.bottom.left.right.equalTo(v)
            make.height.equalTo(44)
        }
        
        
        btn.addClickAction {[weak self](_) in
            self?.showAlert()
        }
        return v
    }()
    
    var datas:[(title: String, value: String,isEdit:Bool)] = []
    
    var userInfo:UserInfoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "设置"
        self.tableView.rowHeight = 44
        self.tableView.separatorStyle = .none
        self.tableView.tableHeaderView = self.tableHeaderV
        self.tableView.tableFooterView = self.tableFooterV
        self.updateDataWithModel(userInfo)
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        requstUserInfo()
    }
    
    func updateDataWithModel(_ model:UserInfoModel?) {
        guard let model = model else {
            return;
        }
        let tupel1 = (title:"用户ID", value:String("\(model.userId)"), isEdit:false)
        let tupel2 = (title:"昵称",   value:model.userName, isEdit:true)
        let tupel3 = (title:"手机号",  value:model.phone,isEdit:false)
        let tupel4 = (title:"所属店铺", value:model.storeName ?? "",isEdit:true)
        
        let infoDict = Bundle.main.infoDictionary
        let version =  infoDict?["CFBundleShortVersionString"] as! String
        let tupel5 = (title:"版本信息", value:version,isEdit:false)
    
        datas = [tupel1,tupel2,tupel3,tupel4,tupel5]
    }
    
    func requstUserInfo(){
        
        var param : [String:Any] = [:]
        param["id"] = UserManager.shared.user?.userId
        
        MeProvider.request(.getUserInfo(parameters: param)) { (result) in
            result.getRaw { (dict) in
                
                let user = UserInfoModel.deserialize(from: dict)
                self.updateDataWithModel(user)
                
                self.tableView.reloadData()
                
            } failed: { (error) in
                self.showError(text: error.localizedDescription)
            }
        }
    }
    
    
    
    func showAlert() {
        
        let alert = UIAlertController(title: "退出登录", message: "您确定要退出登录吗？", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (action) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "确定", style: .destructive, handler: { (action) in
            
            UserManager.shared.deleteUserInfo();
            let navi = PJNavigationController(rootViewController: LoginController())
            navi.modalPresentationStyle = .fullScreen
            self.present(navi, animated: true) {
                self.tabBarController?.selectedIndex = 0
                self.navigationController?.popToRootViewController(animated: true)
            }
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(anyClass: MeSettingCell.self)
        let tuple = datas[indexPath.row]
        cell.titleLabel.text = tuple.title
        cell.valueLabel.text = tuple.value
        cell.arrowImageV.isHidden = !tuple.isEdit
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 { //昵称
            let editVC = MeEditNameController()
            editVC.userName = self.userInfo?.userName
            self.navigationController?.pushViewController( editVC, animated: true)
        }else if indexPath.row == 3 { // 所属店铺
            
            let storeVC =  MeChangeStoreController()
            storeVC.storeId = self.userInfo?.defaultStoreId
            self.navigationController?.pushViewController( storeVC, animated: true)
        }
    }
    

    
    

}
