//
//  DateSelectView.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/7.
//

import UIKit

class DateSelectView: UIView {
    
    
    private var selectBtn:UIButton?
    
    // index: 0:日 1：周 2：月
    var clickedAtIndexBlock:((_ index:Int) -> Void)?
    
    private var stackV:UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        configUI()
    }
    
    func configUI() {
        
        self.backgroundColor = kWhiteColor
        
        let bordView = UIView()
        bordView.layer.borderColor = UIColor(hex: "#ECEEF8").cgColor
        bordView.backgroundColor = kWhiteColor
        bordView.layer.borderWidth = 0.5
        bordView.cornerRadius = 5
        
        self.addSubview(bordView)
        
        let stackV = UIStackView()
        stackV.distribution = .fillEqually
        self.stackV = stackV
        bordView.addSubview(stackV)
        
        bordView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.centerY.equalTo(self)
            make.height.equalTo(30)
        }
        
        stackV.snp.makeConstraints { (make) in
            make.edges.equalTo(bordView)
        }
        
        let dateArr = ["日","周","月"]
        
        for (index, str) in dateArr.enumerated() {
            
            let btn = UIButton()
            btn.setTitle(str, for: .normal)
            btn.titleLabel?.font = k_RegularFont(size: 14)
            btn.setTitleColor(k66COLOR, for: .normal)
            stackV.addArrangedSubview(btn)
            btn.tag = index + 10
            btn.addClickAction { [weak self](btn) in
                self?.selectBtn?.backgroundColor = kWhiteColor
                self?.selectBtn?.setTitleColor(k66COLOR, for: .normal)
                btn.backgroundColor = kRedColor
                btn.setTitleColor(kWhiteColor, for: .normal)
                self?.selectBtn = btn
                self?.clickedAtIndexBlock?(btn.tag - 10)
            }
            
            // 添加分割线
            if index < 2 {
                let line = UIView()
                line.backgroundColor = UIColor(hex: "#ECEEF8")
                btn.addSubview(line)
                line.snp.makeConstraints { (make) in
                    make.top.bottom.right.equalTo(btn)
                    make.width.equalTo(0.5)
                }
            }
        }
        
        // 设置默认
        self.setCurrentIndex(0)
    }
    
    // 日：0 周：1 月：2
    func setCurrentIndex(_ index:Int) {
        
        let btn = self.stackV.arrangedSubviews[index]as?UIButton
        btn?.backgroundColor = kRedColor
        btn?.setTitleColor(.white, for: .normal)
        self.selectBtn = btn
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
