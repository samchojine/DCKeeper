//
//  MeCollectionViewCell.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/25.
//

import UIKit

class MeCollectionViewCell: UICollectionViewCell {
    
    lazy var imageV: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "me_icon_setting")
        return imageV
    }()
    
    lazy var titleLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "设置", font: 13, fontWeight: .medium , textColor: k33COLOR, textAlignment: .center)
        return lab
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI(){
        
        addSubview(imageV)
        addSubview(titleLabel)
        
        self.imageV.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(0)
            make.width.height.equalTo(49)
        }
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.imageV.snp.centerX)
            make.top.equalTo(self.imageV.snp.bottom).offset(0)
        }
    }
    
}
