//
//  MeSettingCell.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/27.
//

import UIKit

class MeSettingCell: UITableViewCell {
    
    
    lazy var titleLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "", font: 14, fontWeight: .regular, textColor: k33COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var valueLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "", font: 14, fontWeight: .regular, textColor: k99COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var arrowImageV: UIImageView = {
        let imageV = UIImageView()
        imageV.image = UIImage(named: "me_arrow_user")
        return imageV
    }()
    
    lazy var separator: UIView = {
        let v = UIView()
        v.backgroundColor = kEECOLOR
        return v
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        
        addSubview(self.titleLabel)
        addSubview(self.valueLabel)
        addSubview(self.arrowImageV)
        addSubview(self.separator)
        self.selectionStyle = .none
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(15)
        }
        
        self.arrowImageV.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(-15)
            make.width.height.equalTo(12)
        }
        
        self.valueLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self.arrowImageV.snp.right).offset(-10)
        }
        
        self.separator.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(self)
            make.height.equalTo(0.5)
        }
        
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
