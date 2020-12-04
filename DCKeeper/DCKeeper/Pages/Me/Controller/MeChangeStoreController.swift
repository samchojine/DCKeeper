//
//  MeChangeStoreController.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/1.
//

import UIKit

class MeChangeStoreController: PJBaseTableViewController {
    
    var storeId:String?
    
    private var index = -1
    
    private var datas = [MeStoreListModel?]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitle = "切换店铺"
        self.naviBar.addRightItemWithTitle(title: "确定", titleColor: kRedColor) { [weak self](btn) in
            self?.requstChangeStore()
        }
        
        self.tableView.mj_header = PJRefreshNormalHeader(refreshingBlock: {[weak self] in
            self?.requstUserInfo()
        })
        
        self.tableView.mj_header?.beginRefreshing()
       
    }
    
    
    func requstUserInfo(){
        
        var param : [String:Any] = [:]
        param["userId"] = UserManager.shared.user?.userId
        MeProvider.request(.getStoreList(parameters: param)) { (result) in
            self.tableView.mj_header?.endRefreshing()
            result.getRaw { (dict) in
                
                if let arr = dict["result"] as? [Any] {
                    
                    self.datas = [MeStoreListModel].deserialize(from: arr) ?? []
                    
                    for (idx,model) in self.datas.enumerated() {
                        if model?.storeId == self.storeId {
                            self.index = idx
                        }
                    }
                    
                    self.tableView.reloadData()
                }
                
            } failed: { (error) in
                self.showError(text: error.localizedDescription)
            }
        }
    }
    
    func requstChangeStore() {
        
        if index < 0 {
            return
        }
        self.showLoading()
        var param : [String:Any] = [:]
        param["userId"] = UserManager.shared.user?.userId
        param["defaultStoreId"] = self.datas[self.index]?.storeId
        MeProvider.request(.changeDefaultStore(parameters: param)) { (result) in
            self.dismissHud()
            
            result.getRaw { (dic) in
                self.showSuccess(text: "切换成功")
            } failed: { (error) in
                self.showError(text: error.localizedDescription)
            }

        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(anyClass: MeChangeStoreCell.self)
        cell.selectBtn.isSelected =  self.index == indexPath.row
        
        let model = datas[indexPath.row]
        cell.titleLabel.text = model?.storeName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        self.tableView.reloadData()
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
