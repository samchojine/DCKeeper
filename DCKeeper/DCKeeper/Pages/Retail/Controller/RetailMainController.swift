//
//  RetailMainController.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/23.
//

import UIKit
import WebKit

class RetailMainController: PJBaseViewController {
    
    var sv:UIScrollView?
    
    lazy var webView: WKWebView = {
        let webV = WKWebView.pj_normalWKWebView()
        webV.uiDelegate = self
        webV.navigationDelegate = self
        return webV
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.naviTitle = "新零售";
        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(kTopHeight)
            make.bottom.equalTo(-kTabebarHeight)
        }
        
        self.webView.scrollView.mj_header = PJRefreshNormalHeader(refreshingBlock: { [weak self] in
            self?.requstUrl()
        })
        self.requstUrl()
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addRefrash()
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
   
    @objc func applicationDidBecomeActive() {
        self.webView.scrollView.mj_header?.beginRefreshing()
        
    }
    
    func addRefrash() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            var subscrollV:UIScrollView?
            
            for view in self.webView.scrollView.allSubViews  {
                
                if view .isKind(of: UIScrollView.self) {
                    subscrollV = view as? UIScrollView ?? nil
                    break
                }
            }
            
            if let sv = subscrollV {
                sv.mj_header = PJRefreshNormalHeader(refreshingBlock: { [weak self] in
                    self?.requstUrl()
                })
                self.sv = sv
            }
        }
        
    }
    
    
    
    func requstUrl(){
        
        self.showLoading()
      
        MeProvider.request(.getProjectConfig) { (result) in
            
            result.getDataDictionary { (dict) in
            
                if let urlStr = dict["biReportUrl"] as?String {
                    let request = URLRequest(url: URL(string: urlStr)!)
                    self.webView.load(request)
                }
            
            } failed: { (error) in
                self.view.showError(text: error.localizedDescription)
            }

        }
    }
    

}

extension RetailMainController:WKNavigationDelegate,WKUIDelegate {
    
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.dismissHud()
        self.webView.scrollView.endRefresh()
        self.addRefrash()
    
        
    }
}
