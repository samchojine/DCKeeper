//
//  RegisterView.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/24.
//

import UIKit

class RegisterView: UIView {
    
    typealias buttonClick = (String,String) -> Void
    
    var registerBlock: buttonClick?
    
    lazy var phoneTF: UITextField = {
        let tf =  UITextField();
        tf.placeholder = "手机号码"
        tf.font = k_MediumFont(size: 16)
        tf.limitType = .phone;
        return tf
    }()
    
    lazy var codeTF: UITextField = {
        let tf =  UITextField();
        tf.placeholder = "验证码"
        tf.font = k_MediumFont(size: 16)
        tf.textColor = k33COLOR
        tf.limitType = .psw;
        tf.isSecureTextEntry = true;
        tf.clearButtonMode = .whileEditing
        return tf
    }()
    
    lazy var inviteCodeTF: UITextField = {
        let tf =  UITextField();
        tf.placeholder = "邀请码"
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
    
    lazy var inviteLine: UIView = {
        let v = UIView();
        v.backgroundColor = UIColor(hex: "#EEEEEE");
        return v
    }()
    

    lazy var confirmBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", for: .normal)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.backgroundColor = kRedColor.withAlphaComponent(0.5)
        btn.titleLabel?.font = k_MediumFont(size: 16)
        btn.cornerRadius = 49/2
        btn.addTarget(self, action: #selector(action_confirm), for: .touchUpInside)

        return btn
    }()
    
    lazy var codeBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("获取验证码", for: .normal)
        btn.setTitleColor(kRedColor, for: .normal)
        btn.backgroundColor = kRedColor.withAlphaComponent(0.3)
        btn.titleLabel?.font = k_MediumFont(size: 13)
        btn.cornerRadius = 15
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
        
        if self.codeTF.text?.isEmpty == true {
            self.showText(text: "请输入密码")
            return
        }
        
        if self.codeTF.text!.count < 6 || self.codeTF.text!.count > 32 {
            self.showText(text: "请输入6-32位密码！")
            return
        }
        
        self.registerBlock!(self.phoneTF.text!, self.codeTF.text!)
    }
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        
        addSubview(self.phoneTF)
        addSubview(self.codeTF)
        addSubview(self.inviteCodeTF)
        addSubview(self.phoneLine)
        addSubview(self.pswLine)
        addSubview(self.confirmBtn)
        addSubview(self.inviteLine)
        addSubview(self.codeBtn)

        
        self.phoneTF.snp.makeConstraints { (make) in
            make.top.equalTo(20 + kTopHeight)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(40)
        }
        
        self.codeTF.snp.makeConstraints { (make) in
            make.top.equalTo(self.phoneTF.snp.bottom).offset(10)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(40)
        }
        
        self.inviteCodeTF.snp.makeConstraints { (make) in
            make.top.equalTo(self.codeTF.snp.bottom).offset(10)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(40)
        }
        
        self.phoneLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.phoneTF)
            make.height.equalTo(0.5)
        }
        
        self.pswLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.codeTF.snp.bottom)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(0.5)
        }
        
        self.inviteLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.inviteCodeTF.snp.bottom)
            make.left.equalTo(24)
            make.right.equalTo(-24)
            make.height.equalTo(0.5)
        }
        
        self.confirmBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.inviteLine.snp.bottom).offset(70)
            make.left.equalTo(26)
            make.right.equalTo(-26)
            make.height.equalTo(49)
        }
        
        self.codeBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.codeTF.snp.bottom).offset(-10)
            make.right.equalTo(-24)
            make.height.equalTo(30)
            make.width.equalTo(84)
        }
    }

}

