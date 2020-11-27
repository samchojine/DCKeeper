//
//  PJBaseTableViewController.swift
//  SwiftDemoProject
//
//  Created by champ on 2020/4/30.
//  Copyright © 2020 champ. All rights reserved.
//

import UIKit

class PJBaseTableViewController: PJBaseViewController {
     
    // MARK:-顶部距离
    var contenTopSpace :CGFloat = 0.0 {
        didSet{
            self.tableView.contentInset = UIEdgeInsets(top: contenTopSpace, left: 0, bottom:  contenBottomSpace, right: 0)
        }
    }
    
    // MARK:-底部距离
    var contenBottomSpace :CGFloat = 0.0 {
        
        didSet{
            self.tableView.contentInset = UIEdgeInsets(top: contenTopSpace, left: 0, bottom:  contenBottomSpace + kBottomSafeInset, right: 0)
        }
    }
    
    // MARK:-style  这个属性在子控制器 loadview 中设置
    var style :UITableView.Style = .grouped
    
    // MARK:-调用此方法可以使tableView从屏幕0开始算起，现在默认从导航栏算起
    func resetTableViewZero() {
        self.tableView.snp.remakeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(0)
        }
    }

    // MARK:-如果隐藏了导航栏，tableView会向下偏移22，调用此方法修复
//    func fixTableViewOffsetWhenNaviHide() {
//
//        if #available(iOS 11.0, *) {
//               tableView.contentInsetAdjustmentBehavior = .never
//           } else {
//               self.automaticallyAdjustsScrollViewInsets = false
//           }
//    }

    // tableview
    lazy var tableView: UITableView = {
        let t = UITableView(frame:CGRect.zero, style: style)
        t.separatorStyle = .none;
        t.rowHeight = 48
        t.delegate = self
        t.dataSource = self
        t.tableFooterView = UIView()
        t.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .groupTableViewBackground
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(kTopHeight)
        }
        
       // 如果隐藏了系统导航栏，tableView会向下偏移22，调用此方法修复，现在是默认全局隐藏系统导航栏，使用自定义导航栏
        if #available(iOS 11.0, *) {
               tableView.contentInsetAdjustmentBehavior = .never
           } else {
               self.automaticallyAdjustsScrollViewInsets = false
           }
    }

}


extension PJBaseTableViewController :UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        return nil
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if self.tableView.sectionHeaderHeight > 0 {
            return self.tableView.sectionHeaderHeight
        }
        return 0.001
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        if self.tableView.sectionFooterHeight > 0 {
            return self.tableView.sectionFooterHeight
        }
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}




