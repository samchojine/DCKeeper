//
//  PJBaseViewController.swift
//  SwiftDemoProject
//
//  Created by champ on 2020/4/30.
//  Copyright © 2020 champ. All rights reserved.
//

import UIKit

class PJBaseViewController: UIViewController {
    
    var naviBar: PJCustomNaviBar!
    
    // 标题
    var naviTitle:String? {
        didSet{
            self.naviBar.title = naviTitle
        }
    }
    
    var naviHide:Bool = false {
        didSet {
            self.naviBar.isHidden = true
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 默认白色背景
        view.backgroundColor = UIColor.white
        
        // 隐藏系统导航栏
        self.navigationController?.setNavigationBarHidden(true, animated: false);
        
        // 添加自定义导航栏
        naviBar = PJCustomNaviBar()
        self.view.addSubview(naviBar)
        
        // 设置标题
        if (self.navigationController?.children.count != 1) {
            naviBar.leftItemImage = UIImage(named:"nav_btn_back_black")
        }
        
       
       
    }
    
     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewWillLayoutSubviews() {
        self.view.bringSubviewToFront(naviBar);
    }
    

    
    @objc func action_back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        
        print("----\(self.classForCoder)----已释放")
    }
    
    
}
