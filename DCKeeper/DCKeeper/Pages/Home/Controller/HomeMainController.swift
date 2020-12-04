//
//  HomeMainController.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/23.
//

import UIKit

class HomeMainController: PJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviTitle = "总部";
        
        
        if UserManager.shared.isLogin == false {
            let navi = PJNavigationController(rootViewController: LoginController())
            navi.modalPresentationStyle = .fullScreen
            self.present(navi, animated: false) {
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
