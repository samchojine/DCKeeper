//
//  LoginView.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/24.
//

import UIKit

class LoginView: UIView {
    
    typealias buttonClick = (String,String) -> Void
    
    var loginBlock: buttonClick?
    
    
    lazy var logoImagV: UIImageView = {
        let v = UIImageView(image: UIImage(named: "login_icon_logo"))
        return v
    }()
    
    lazy var phoneTF: UITextField = {
        let tf =  UITextField();
        tf.placeholder = "请输入手机号"
        tf.font = k_MediumFont(size: 16)
        tf.limitType = .phone;
        return tf
    }()
    
    lazy var pswTF: UITextField = {
        let tf =  UITextField();
        tf.placeholder = "请输入密码"
        tf.font = k_MediumFont(size: 16)
        tf.textColor = k33COLOR
        tf.limitType = .psw;
        tf.isSecureTextEntry = true;
        tf.clearButtonMode = .whileEditing
        return tf
    }()
    
    lazy var phoneLine: UIView = {
        let v = UIView();
        v.backgroundColor = UIColor(hex: "#EEEEEE");
        return v
    }()
    
    lazy var pswLine: UIView = {
        let v = UIView();
        v.backgroundColor = UIColor(hex: "#EEEEEE");
        return v
    }()
    
    lazy var eyesBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "login_icon_eye_n"), for: .normal)
        btn.setImage(UIImage(named: "login_icon_eye_s"), for: .selected)
        btn.addClickAction { [weak self](btn) in
            self?.pswTF.isSecureTextEntry = btn.isSelected
            btn.isSelected = !btn.isSelected;
           
        }
        return btn
    }()
    
    lazy var forgetBtn: UIButton = {
        let btn = UIButton()
        btn .setTitle("忘记密码", for: .normal)
        btn.setTitleColor(k66COLOR, for: .normal)
        btn.titleLabel?.font = k_MediumFont(size: 14)
        btn.addClickAction { [weak self](btn) in
       
        }
        return btn
    }()
    
    lazy var registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", for: .normal)
        btn.setTitleColor( kRedColor, for: .normal)
        btn.titleLabel?.font = k_MediumFont(size: 14)
        btn.addClickAction { [weak self](btn) in
            self?.viewController()?.navigationController?.pushViewController(RegisterController(), animated: true)
        }
        return btn
    }()
    
    lazy var confirmBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.backgroundColor = kRedColor.withAlphaComponent(0.5)
        btn.titleLabel?.font = k_MediumFont(size: 16)
        btn.cornerRadius = 49/2
        btn.addTarget(self, action: #selector(action_confirm), for: .touchUpInside)

        return btn
    }()
    
    @objc func action_confirm(){
        
        if self.phoneTF.text?.isEmpty == true {
            self.showText(text: "请输入手机号")
            return
        }
        
        if self.phoneTF.text?.count != 11 {
            self.showText(text: "手机号输入格式不正确!")
            return
        }
        
        if self.pswTF.text?.isEmpty == true {
            self.showText(text: "请输入密码")
            return
        }
        
        if self.pswTF.text!.count < 6 || self.pswTF.text!.count > 32 {
            self.showText(text: "请输入6-32位密码！")
            return
        }
        
        if !self.selectBtn.isSelected {
            self.showText(text: "请先同意用户协议和隐私协议！")
            return
        }
        
        self.loginBlock!(self.phoneTF.text!, self.pswTF.text!)
    }
    
    lazy var selectBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "login_icon_select_n"), for: .normal)
        btn.setImage(UIImage(named: "login_icon_select_s"), for: .selected)
        btn.addClickAction { [weak self](btn) in
            btn.isSelected = !btn.isSelected;
        }
        return btn
    }()
    
    
    lazy var wornLabel: UILabel = {
        let lab = UILabel()
        
        let a: AttributedString = .init("登录即表明您同意",
                                        .color(k66COLOR),
                                        .font(k_MediumFont(size: 12))
        )
        
        let b: AttributedString = .init("《隐私政策》",
                                        .color(UIColor(hex: "#549CEC")),
                                        .font(k_MediumFont(size: 12)),
                                        .action {
                                            print("点击了l链接")
            }
        )
        
        let c: AttributedString = .init("《用户协议》",
                                        .color(UIColor(hex: "#549CEC")),
                                        .font(k_MediumFont(size: 12)),
                                        .action {
                                            print("点击了l链接")
            }
        )
        
        lab.attributed.text = a + b + c
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
        
        addSubview(self.logoImagV)
        addSubview(self.phoneTF)
        addSubview(self.pswTF)
        addSubview(self.phoneLine)
        addSubview(self.pswLine)
        addSubview(self.forgetBtn)
        addSubview(self.registerBtn)
        addSubview(self.confirmBtn)
        addSubview(self.eyesBtn)
        addSubview(self.wornLabel)
        addSubview(self.selectBtn)
        
        
        self.logoImagV.snp.makeConstraints { (make) in
            make.top.equalTo(kStatusHeight + 50)
            make.centerX.equalTo(self)
            make.width.height.equalTo(100)
        }
        
        self.phoneTF.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoImagV.snp.bottom).offset(42)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(40)
        }
        
        self.pswTF.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneTF.snp.bottom).offset(30)
            make.left.equalTo(24)
            make.right.equalTo(-64)
            make.height.equalTo(40)
        }
        
        self.phoneLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.phoneTF)
            make.height.equalTo(0.5)
        }
        
        self.pswLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.pswTF.snp.bottom)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(0.5)
        }
        
        self.eyesBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.pswTF)
            make.right.equalTo(-24)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        self.forgetBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.pswLine.snp.bottom).offset(8)
            make.left.equalTo(self.pswLine.snp.left)
            make.height.equalTo(40)
        }
        
        self.registerBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.pswLine.snp.bottom).offset(8)
            make.right.equalTo(self.pswLine.snp.right)
            make.height.equalTo(40)
        }
        
        self.confirmBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.pswLine.snp.bottom).offset(70)
            make.left.equalTo(26)
            make.right.equalTo(-26)
            make.height.equalTo(49)
        }
        
        self.wornLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.confirmBtn.snp.bottom).offset(15)
            make.centerX.equalTo(self)
        }
        
        self.selectBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.wornLabel.snp.centerY)
            make.right.equalTo(self.wornLabel.snp.left)
            make.width.height.equalTo(30)
        }
        
    }

}
