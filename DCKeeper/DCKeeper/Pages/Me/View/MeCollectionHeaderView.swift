//
//  MeCollectionHeaderView.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/25.
//

import UIKit

class MeCollectionHeaderView: UICollectionReusableView {
    
    
    lazy var userBGV: UIView = {
        let v = UIView()
        v.addTapAction { [weak self](v) in
            self?.viewController()?.navigationController?.pushViewController(MeSettingController(), animated: true)
        }
        return v
    }()
    
    lazy var avatarImagV: UIImageView = {
        let v = UIImageView(image: UIImage(named: "me_icon_avtar"))
        v.cornerRadius = 40
        return v
    }()
    
    lazy var nameLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "水电费啦", font: 17, fontWeight: .medium, textColor: k33COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var storenameLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "水电费啦", font: 13, fontWeight: .medium, textColor: k66COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var storelogoImagV: UIImageView = {
        let v = UIImageView(image: UIImage(named: "me_icon_store"))
        return v
    }()
    
    lazy var arrowImagV: UIImageView = {
        let v = UIImageView(image: UIImage(named: "me_arrow_user"))
        return v
    }()
    
    lazy var separatorV: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "eeeeee")
        return v
    }()
    
    lazy var saleLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "我的业绩", font: 16, fontWeight: .medium, textColor: k33COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var toolLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "我的工具", font: 16, fontWeight: .medium, textColor: k33COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var checkAllBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("查看全部", for: .normal)
        btn.setImage(UIImage(named: "me_arrow_checkAll"), for: .normal)
        btn.setTitleColor(k99COLOR, for: .normal)
        btn.titleLabel?.font = k_MediumFont(size: 14)
        btn.addClickAction { [weak self](btn) in
            self?.viewController()?.tabBarController?.selectedIndex = 0
        }
        return btn
    }()
    
    lazy var saleBGV: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(hex: "#FAFAFF")
        v.cornerRadius = 5
        return v
    }()
    
    lazy var todaySaleLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "今日销售(元)", font: 13, fontWeight: .medium, textColor: k66COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var monthSaleLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "本月销售(元)", font: 13, fontWeight: .medium, textColor: k66COLOR, textAlignment: .left)
        return lab
    }()

    lazy var todaySaleValueLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "824.00", font: 20, fontWeight: .medium, textColor: kRedColor, textAlignment: .center)
        return lab
    }()
    
    lazy var monthSaleValueLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "1540.0", font: 20, fontWeight: .medium, textColor: kRedColor, textAlignment: .center)
        return lab
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configUI() {
        
        self.addSubview(self.userBGV)
        self.userBGV.addSubview(self.avatarImagV)
        self.userBGV.addSubview(self.nameLabel)
        self.userBGV.addSubview(self.storenameLabel)
        self.userBGV.addSubview(self.storelogoImagV)
        self.userBGV.addSubview(self.arrowImagV)
        self.userBGV.addSubview(self.separatorV)
        
        self.addSubview(self.saleLabel)
        self.addSubview(self.checkAllBtn)
        self.addSubview(self.saleBGV)
        self.saleBGV.addSubview(self.todaySaleLabel)
        self.saleBGV.addSubview(self.todaySaleValueLabel)
        self.saleBGV.addSubview(self.monthSaleLabel)
        self.saleBGV.addSubview(self.monthSaleValueLabel)
        self.addSubview(self.toolLabel)
        
        self.userBGV.snp.makeConstraints { (make) in
            make.left.left.right.top.equalTo(self)
            make.height.equalTo(120)
        }
        
        self.avatarImagV.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalTo(self.userBGV.snp.centerY)
            make.width.height.equalTo(88)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImagV.snp.right).offset(23)
            make.top.equalTo(self.avatarImagV.snp.top).offset(16.5)
            make.right.equalTo(-80)
        }
        
        self.storelogoImagV.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImagV.snp.right).offset(23)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(13.5)
            make.width.height.equalTo(14.5)
        }
        
        self.storenameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.storelogoImagV.snp.right).offset(5)
            make.centerY.equalTo(self.storelogoImagV.snp.centerY)
            make.right.equalTo(-80)
        }
        
        self.arrowImagV.snp.makeConstraints { (make) in
            make.right.equalTo(-50)
            make.centerY.equalTo(self.userBGV)
            make.width.height.equalTo(22)
        }
        
        self.separatorV.snp.makeConstraints { (make) in
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(0.5)
            make.bottom.equalTo(self.userBGV.snp.bottom)
        }
        
        self.separatorV.snp.makeConstraints { (make) in
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(0.5)
            make.bottom.equalTo(self.userBGV.snp.bottom)
        }
        
        self.saleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.top.equalTo(self.userBGV.snp.bottom).offset(14)
        }
        
        self.checkAllBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.centerY.equalTo(self.saleLabel.snp.centerY)
            make.width.equalTo(84)
            make.height.equalTo(32)
        }
        
        self.saleBGV.snp.makeConstraints { (make) in
            make.top.equalTo(self.saleLabel.snp.bottom).offset(10)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(70)
        }
        

        self.todaySaleValueLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(self.saleBGV)
            make.right.equalTo(self.saleBGV.snp.centerX)
            make.height.equalTo(42)
        }
        
        self.todaySaleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.todaySaleValueLabel.snp.bottom).offset(0)
            make.centerX.equalTo(self.todaySaleValueLabel)
        }
        
        self.monthSaleValueLabel.snp.makeConstraints { (make) in
            make.top.right.equalTo(self.saleBGV)
            make.width.height.equalTo(self.todaySaleValueLabel)
        }
        self.monthSaleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.monthSaleValueLabel.snp.bottom).offset(0)
            make.centerX.equalTo(self.monthSaleValueLabel)
        }
        
        self.toolLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.saleBGV.snp.bottom).offset(24)
            make.left.equalTo(30)
        }
        
        self.checkAllBtn .positionTitleAndImage(style: .Right, imageTitleSpace: 0)
        
    }
    
        
}
