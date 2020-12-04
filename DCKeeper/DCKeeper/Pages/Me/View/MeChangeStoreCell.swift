//
//  MeChangeStoreCell.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/1.
//

import UIKit

class MeChangeStoreCell: UITableViewCell {
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.pj_normalLabel(text: "标题", font: 14, fontWeight: .regular, textColor: k33COLOR, textAlignment: .left)
        return label
    }()

    
    lazy var selectBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "me_icon_select_n"), for: .normal)
        btn.setImage(UIImage(named: "me_icon_select_s"), for: .selected)
        btn.isSelected = false
        return btn
    }()
    
    lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = kEECOLOR
        return separator
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }
    
    func configUI() {
        addSubview(self.titleLabel)
        addSubview(self.selectBtn)
        addSubview(self.separator)
        self.selectionStyle = .none
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalTo(self)
        }
        
        self.selectBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.centerY.equalTo(self)
        }
        
        self.separator.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(0.5)
            make.bottom.equalTo(self)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    
    

}
