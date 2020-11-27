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
        return v
    }()
    
    
    var datas:[(title: String, value: String,isEdit:Bool)] = [
        (title:"用户ID", value:"", isEdit:false ),
        (title:"昵称",   value:"", isEdit:true),
        (title:"手机号",  value:"",isEdit:false),
        (title:"所属店铺", value:"",isEdit:true),
        (title:"基本信息", value:"",isEdit:false),
        (title:"用户ID",  value:"",isEdit:false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "设置"
        self.tableView.rowHeight = 44
        self.tableView.separatorStyle = .none
        self.tableView.tableHeaderView = self.tableHeaderV
        self.tableView.tableFooterView = self.tableFooterV
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
            self.navigationController?.pushViewController(MeEditNameController(), animated: true)
        }else if indexPath.row == 3 { // 所属店铺
            
        }
    }
    

    
    

}
