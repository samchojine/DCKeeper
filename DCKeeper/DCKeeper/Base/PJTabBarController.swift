//
//  PJTabBarController.swift
//  SwiftDemoProject
//
//  Created by champ on 2020/4/30.
//  Copyright © 2020 champ. All rights reserved.
//

import UIKit

class PJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configSubControllers()
    }
    

    func configSubControllers(){
        
        // 首页
        let homeVC = HomeMainController();
        // 营运
        let operationVC = OperationMainController();
        // 新零售
        let retailVC = RetailMainController();
        //我的
        let mineVC = MeMainController();

        let controllers = [homeVC,operationVC,retailVC,mineVC];

        let titles = ["首页","营运","新零售","我的"];

        let selectedImageNames = ["tabbar_icon_home_show",
                                  "tabbar_icon_operating_show",
                                  "tabbar_icon_retail_show",
                                  "tabbar_icon_mine_show"];

        let normalImageNames = ["tabbar_icon_home_nor",
                                "tabbar_icon_operating_nor",
                                "tabbar_icon_retail_nor",
                                "tabbar_icon_mine_nor"];
        
        var naviContainer : [PJNavigationController] = [];
        
        for i in 0..<titles.count{
            let controller = controllers[i];
            let baseNavi = PJNavigationController(rootViewController: controller);
            baseNavi.tabBarItem = self.createTabItem(title: titles[i], normalImgName:normalImageNames[i] , selectedImgName: selectedImageNames[i]);
            naviContainer.append(baseNavi);
        }
        
        self.setViewControllers(naviContainer, animated: false)
    }
    
    
    
    func createTabItem(title:String?,
                       normalImgName:String?,
                       selectedImgName:String?,
                       unselectTitleColor:UIColor = UIColor.lightGray,
                       selectedTitleColor:UIColor = kRedColor) -> UITabBarItem {
    
        let normalImg = UIImage(named: normalImgName!)?.withRenderingMode(.alwaysOriginal)
        let selectImg = UIImage(named: selectedImgName!)?.withRenderingMode(.alwaysOriginal)
        let tabbar =  UITabBarItem(title: title, image:normalImg, selectedImage: selectImg);
        let normalAttri = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10),
                           NSAttributedString.Key.foregroundColor:unselectTitleColor]
        tabbar.setTitleTextAttributes(normalAttri, for: .normal)
        
        let selectedAttri = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10),
                             NSAttributedString.Key.foregroundColor:selectedTitleColor]
        tabbar.setTitleTextAttributes(selectedAttri, for: .selected)
        
        
        //iOS 13 badge value font 会变成17号字体
        tabbar.setBadgeTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10)], for: .normal)
        tabbar.setBadgeTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 10)], for: .selected)
        
        //iOS 13 选中的颜色 需要调用如下
        tabBar.tintColor = UIColor.black
        
        return tabbar;
    }
    

    
}



