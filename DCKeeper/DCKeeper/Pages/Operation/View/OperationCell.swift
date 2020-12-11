//
//  OperationCell.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/9.
//

import UIKit

class OperationCell: UITableViewCell {
    
    // 大区，督导 赋值
    func configModel( model: OperationNormalListModel, index: Int) {
        
        if index < 3 {
            self.numberBtn.setBackgroundImage(UIImage(named: "opera_icon_row_\(index+1)"), for: .normal)
            self.numberBtn.setTitle("", for: .normal)
        }else {
            self.numberBtn.setBackgroundImage(UIImage(color: kEECOLOR), for: .normal)
            self.numberBtn.setTitle("\(index + 1)", for: .normal)
        }
            
        
        self.nameLabel.text = model.name
        self.saleLabel.text = "销售额  \(model.salesAmount.millionStr())"
        self.tagetLabel.text = "目标数  \(model.saleTarget.millionStr())"
        self.reachLabel.text = "达成率  \(Int(model.achievementRate * 100))%"
        self.tbBtn.setTitle("\(Int(model.salesAmountTb * 100))%", for: .normal)
        self.tbBtn.setTitleColor(model.salesAmountTb > 0 ? kRedColor:UIColor(hex: "#23B023"), for: .normal)
        self.tbBtn.setImage(UIImage(named: model.salesAmountTb > 0 ? "opera_icon_up" :"opera_icon_down"), for: .normal)
        self.hbBtn.setTitle("\(Int(model.salesAmountHb * 100))%", for: .normal)
        self.hbBtn.setTitleColor(model.salesAmountHb > 0 ? kRedColor:UIColor(hex: "#23B023"), for: .normal)
        self.hbBtn.setImage(UIImage(named: model.salesAmountHb > 0 ? "opera_icon_up" :"opera_icon_down"), for: .normal)
    }
    
    
    lazy var numberBtn: UIButton = {
        let btn = UIButton()
        btn.cornerRadius = 11
        btn.isUserInteractionEnabled = false
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.titleLabel?.font = k_BoldFont(size: 12)
        return btn
    }()
    
    lazy var nameLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "", font: 14, fontWeight: .regular, textColor: k66COLOR, textAlignment: .center)
        return lab
    }()
    
    lazy var typeImageV: UIImageView = {
        let imgV = UIImageView()
        return imgV
    }()
    
    lazy var arrowImageV: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "me_arrow_user")
        return imgV
    }()
    
    lazy var saleLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "", font: 12, fontWeight: .regular, textColor: k66COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var reachLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "", font: 12, fontWeight: .regular, textColor: k66COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var tagetLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "", font: 12, fontWeight: .regular, textColor: k66COLOR, textAlignment: .left)
        return lab
    }()
    
    // 同比
    lazy var tbLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "同比", font: 10, fontWeight: .regular, textColor: k66COLOR, textAlignment: .left)
        return lab
    }()
    
    // 环比
    lazy var hbLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "环比", font: 10, fontWeight: .regular, textColor: k66COLOR, textAlignment: .left)
        return lab
    }()
    
    // 环比
    lazy var line: UIView = {
        let v = UIView()
        v.backgroundColor = k99COLOR
        return v
    }()
    
    lazy var tbBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("6%", for: .normal)
        btn.titleLabel?.font = k_RegularFont(size: 10)
        return btn
    }()
    
    lazy var hbBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("6%", for: .normal)
        btn.titleLabel?.font = k_RegularFont(size: 10)
        return btn
    }()
    
    func configUI() {
        
        addSubview(numberBtn)
        addSubview(nameLabel)
        addSubview(typeImageV)
        addSubview(saleLabel)
        addSubview(reachLabel)
        addSubview(tagetLabel)
        addSubview(tbLabel)
        addSubview(tbBtn)
        addSubview(line)
        addSubview(hbLabel)
        addSubview(hbBtn)
        addSubview(arrowImageV)
        
        numberBtn.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(11)
            make.width.height.equalTo(22)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(numberBtn.snp.right).offset(10)
            make.centerY.equalTo(numberBtn)
        }
        
        arrowImageV.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.width.height.equalTo(15)
            make.centerY.equalTo(nameLabel)
        }
        
        typeImageV.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.right).offset(10)
            make.centerY.equalTo(numberBtn)
            make.height.equalTo(22)
            make.width.equalTo(42)
        }
        
        saleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel.snp.left)
            make.top.equalTo(nameLabel.snp.bottom).offset(14)
            make.height.equalTo(13)
        }
        
        reachLabel.snp.makeConstraints { (make) in
            make.left.equalTo(196)
            make.centerY.equalTo(saleLabel.snp.centerY)
        }
        
        tbLabel.snp.makeConstraints { (make) in
            make.left.equalTo(saleLabel)
            make.top.equalTo(saleLabel.snp.bottom).offset(11)
        }
        
        tbBtn.snp.makeConstraints { (make) in
            make.left.equalTo(tbLabel.snp.right)
            make.centerY.equalTo(tbLabel.snp.centerY)
        }
        
        line.snp.makeConstraints { (make) in
            make.left.equalTo(tbBtn.snp.right).offset(4)
            make.centerY.equalTo(tbLabel)
            make.width.equalTo(1)
            make.height.equalTo(8)
        }
        
        hbLabel.snp.makeConstraints { (make) in
            make.left.equalTo(line.snp.right).offset(4)
            make.centerY.equalTo(tbLabel.snp.centerY)
        }
        
        hbBtn.snp.makeConstraints { (make) in
            make.left.equalTo(hbLabel.snp.right)
            make.centerY.equalTo(tbLabel.snp.centerY)
        }
        
        tagetLabel.snp.makeConstraints { (make) in
            make.left.equalTo(reachLabel.snp.left)
            make.centerY.equalTo(tbLabel.snp.centerY)
        }
        
    }
    
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
