//
//  OperationMainController.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/23.
//

import UIKit

class OperationMainController: PJBaseViewController {
    
    //  0：日，1：周，2：月
    var dateType = 0
    
    //  0：大区，1：督导，2：门店
    var roleType = 0;
    
    //  当前页
    var page = 0;
    
    // 当选择 大区，督导 用的数据源
    var areaArr:[OperationNormalListModel] = []
    
    // 当选择 门店 用的数据源
    var storeArr:[OperationNormalModel] = []
    
    lazy var dateView: DateSelectView = {
        let dateV = DateSelectView()
        // 切换 日，周，月
        dateV.clickedAtIndexBlock = { [weak self](index) in
            self?.dateType = index
            self?.dataInfoV.progressV.configWithType(DateInfoProgressView.DateProgressType(rawValue: index)!)
            self?.tableView.mj_header?.beginRefreshing()
        }
        return dateV
    }()
    
    lazy var dataInfoV: DateInfoView = {
        let infoV = DateInfoView(frame: CGRect(0, 0, kScreenWidth, 237))
        infoV.clickAtIndex = { [weak self](index) in
            self?.roleType = index
            self?.tableView.mj_header?.beginRefreshing()
        }
        return infoV
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.backgroundColor = kScrollViewColor
        tv.tableHeaderView = self.dataInfoV
        tv.delegate = self
        tv.dataSource = self
        tv.rowHeight = 90
        tv.tableFooterView = UIView()
        tv.mj_header = PJRefreshNormalHeader(refreshingBlock: { [weak self] in
            self?.page = 1
            self?.requstInfo()
        })
        tv.mj_footer = PJRefreshAutoNormalFooter(refreshingBlock: { [weak self] in
            self?.page += 1
            self?.requstInfo()
        })
        return tv
    }()
    
    var operationModel = OperationNormalModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "总部";
        
        self.view.backgroundColor = kScrollViewColor
        view.addSubview(dateView)
        dateView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.height.equalTo(49 )
            make.top.equalTo(kTopHeight)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(dateView.snp.bottom)
            
        }
        
        self.tableView.mj_header?.beginRefreshing()
        
    }
    
    
    func requstInfo(){
        
        var param : [String:Any] = [:]
       
        param["userId"] = UserManager.shared.user?.userId
        param["dayType"] = self.dateType
        param["current"] = self.page
        param["size"] = 10
        // 如果选的的不是门店，要加上参数
        if roleType < 2 {
            param["channel"] = "\(self.roleType)"
        }
        
        OperrationProvider.request(.getPerfanmanceList(parameters: param)) { (result) in
            
            result.getDataDictionary { (dict) in
                
                if self.page == 1 {
                    self.areaArr.removeAll()
                    self.storeArr.removeAll()
                }
                
                if self.roleType == 2 {
                    
                }else {
                    self.operationModel = OperationNormalModel.deserialize(from: dict) ?? OperationNormalModel()
                    self.areaArr += self.operationModel.operationDtos
                    self.dataInfoV.configModel(self.operationModel)
                }
                self.tableView.reloadData()
                let islastPage = self.operationModel.current >= self.operationModel.total ? true:false
                self.tableView.endRefresh(isLastPage: islastPage)
                
            } failed: { (error) in
                self.showError(text: error.localizedDescription)
                self.tableView.endRefresh()
            }

        }
        

    }
    
}

extension OperationMainController:UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.roleType == 2 { // 选择门店
            return self.storeArr.count
        }
        return self.areaArr.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(anyClass: OperationCell.self)
    
        if self.roleType == 2 { // 选择门店
           
        }else {
            let model = self.areaArr[indexPath.row]
            cell.configModel(model: model, index: indexPath.row)
        }
        
        return cell
    }
    
    
    
}
