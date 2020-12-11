//
//  DateInfoView.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/7.
//

import UIKit

class DateInfoView: UIView {
    
    // 0"大区",1"督导",2"门店"
    var  clickAtIndex: (( _ index :Int) -> Void)?
    
    lazy var progressV: DateInfoProgressView = {
        let pv = DateInfoProgressView()
        pv.configWithType(.day)
        return pv
    }()
    
    lazy var PriceV: DateInfoPriceView = {
        let v = DateInfoPriceView()
        return v
    }()
    
    lazy var dateInfoSelectV: DateInfoSelectView = {
        let selectV = DateInfoSelectView()
        selectV.datas = ["大区","督导","门店"]
        selectV.setCurrentSelectIndex(0)
        selectV.clickAtIndex = { [weak self] index in
            self?.clickAtIndex?(index)
            
        }
        return selectV
    }()
    
    lazy var separator1: UIView = {
        let v = UIView()
        v.backgroundColor = kScrollViewColor
        return v
    }()
    
    lazy var separator2: UIView = {
        let v = UIView()
        v.backgroundColor = kScrollViewColor
        return v
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configUI() {
        self.backgroundColor = kWhiteColor
        self.addSubview(self.separator1)
        self.addSubview(self.progressV)
        self.addSubview(self.PriceV)
        self.addSubview(self.dateInfoSelectV)
        self.addSubview(self.separator2)
        
        self.separator1.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self)
            make.height.equalTo(10)
        }
        
        self.progressV.snp.makeConstraints { (make) in
            make.top.equalTo(self.separator1.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(62)
        }
        
        self.PriceV.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.progressV.snp.bottom)
            make.height.equalTo(95)
        }
        
        self.separator2.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.PriceV.snp.bottom).offset(15)
            make.height.equalTo(10)
        }
        
        self.dateInfoSelectV.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.separator2.snp.bottom)
            make.height.equalTo(45)
        }
        
    }
    
    
    // 大区，督导的时候赋值
    func configModel(_ model: OperationNormalModel) {
        
        let todayvalue:String = String(format:"%.2f",model.lastTotalSalesAmount/10000)
        let tagetvalue:String = String(format:"%.2f",model.totalSaleTarget/10000)
        
        let a: AttributedString = .init( "\(todayvalue)",
                                        .color(kWhiteColor),
                                        .font(k_BoldFont(size: 22))
        )
        
        let b: AttributedString = .init("万",
                                        .color(kWhiteColor),
                                        .font(k_MediumFont(size: 12))
        )

        let c: AttributedString = .init( "\(tagetvalue)",
                                        .color(kWhiteColor),
                                        .font(k_BoldFont(size: 16))
        )
        
        let d: AttributedString = .init("万",
                                        .color(kWhiteColor),
                                        .font(k_MediumFont(size: 14))
        )
       
        self.PriceV.todayValueLabel.attributed.text = a + b
        self.PriceV.tagetValueLabel.attributed.text = c + d
        self.PriceV.reachValueLabel.text =  String(format:"%d%%",  Int(model.totalAchievementRate * 100) )
        
    }
    



}




// MARK: -进度条
class DateInfoProgressView: UIView {
    
    enum DateProgressType:Int {
        case day    = 0
        case week   = 1
        case month  = 2
    }
    

    lazy var startLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "09:00", font: 10, fontWeight: .regular, textColor: k99COLOR, textAlignment: .left)
        return lab
    }()

    lazy var endLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "21:00", font: 10, fontWeight: .regular, textColor: k99COLOR, textAlignment: .left)
        return lab
    }()
    
    lazy var progressStack: UIStackView = {
        let stackV = UIStackView()
        stackV.spacing = 1
        stackV.distribution = .fillEqually
        return stackV
    }()
    
    lazy var monthProgress: UIProgressView = {
        let progress = UIProgressView()
        progress.trackTintColor = kEECOLOR
        progress.progressTintColor = kRedColor
        progress.subviews.forEach { (v) in
            v.cornerRadius = 3
        }
        progress.isHidden = true
        return progress
    }()
    
    lazy var indicateBtn: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = k_RegularFont(size: 11)
        btn.setTitleColor(kWhiteColor, for: .normal)
        btn.setTitle("11", for: .normal)
        btn.contentEdgeInsets = UIEdgeInsets(top: 6, left: 0, bottom: 0, right: 0)
        btn.setBackgroundImage(UIImage(named: "operration_icon_indicate"), for: .normal)
        return btn
    }()
    
    lazy var indicateLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "", font: 10, fontWeight: .regular, textColor: k99COLOR, textAlignment: .left)
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
        self.backgroundColor = .white
        addSubview(self.progressStack)
        addSubview(self.startLabel)
        addSubview(self.endLabel)
        addSubview(self.indicateBtn)
        addSubview(self.indicateLabel)
        addSubview(self.monthProgress)
        self.progressStack.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(6)
        }
        
        self.monthProgress.snp.makeConstraints { (make) in
            make.edges.equalTo(progressStack)
        }
        
        self.startLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.progressStack)
            make.bottom.equalTo(self.progressStack.snp.top).offset(-2)
        }
        
        self.endLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.progressStack)
            make.bottom.equalTo(self.progressStack.snp.top).offset(-2)
        }
        
        self.indicateBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(-100)
            make.top.equalTo(progressStack.snp.bottom)
            make.width.equalTo(28)
            make.height.equalTo(23)
        }
        
        self.indicateLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(-100)
            make.bottom.equalTo(progressStack.snp.top).offset(-5)
        }
        
    }
    
    
    // 赋值
    func configWithType( _ type:DateProgressType) {
        
        let date = Date()
        if type == .day {
            
            let startHour = "09"
            let endHour = "21"
            let times = Int(endHour)! - Int(startHour)! // 总小时数
            let index = date.hour + 1 - Int(startHour)! // 当前的小时所在的区间
            updateUI(type, times,index)
            startLabel.text = "\(startHour):00"
            endLabel.text = "\(endHour):00"
            indicateLabel.text = ""
            indicateBtn.setTitle("\(date.hour)时", for: .normal)
            
        }else if type == .week {
            
            let weekDays = 7  // 一周有7天
            updateUI(type, weekDays,date.week - 1 )
            startLabel.text = ""
            endLabel.text = ""
            indicateLabel.text = "\(date.month)月\(date.day)日"
            let weekArr = ["周日","周-","周二","周三","周四","周五","周六",]
            indicateBtn.setTitle(weekArr[date.week - 1], for: .normal)
    
            
        }else if type == .month {
            
            updateUI(type, date.totalDaysInCurrentMonth,date.day)
            startLabel.text = "\(date.month)月1日"
            endLabel.text = "\(date.month)月\(date.totalDaysInCurrentMonth)日"
            indicateLabel.text = ""
            indicateBtn.setTitle("\(date.month)月\(date.day)日", for: .normal)
        }
        
    }
    
    
    // 更新UI
    private func updateUI(_ type:DateProgressType, _ count:Int, _ currentIndex:Int){
        
        if type == .month {
            self.monthProgress.isHidden = false
            self.progressStack.isHidden = true
            self.monthProgress.progress = Float(currentIndex)/Float(count)
            
        }else {
            self.monthProgress.isHidden = true
            self.progressStack.isHidden = false
            
            self.progressStack.arrangedSubviews.forEach { (v) in
                self.progressStack.removeArrangedSubview(v)
            }
            
            for idx in 0 ..< count {
                let view = UIView()
                view.backgroundColor = kEECOLOR
                self.progressStack.addArrangedSubview(view)
                if idx < currentIndex  {
                    view.backgroundColor = kRedColor
                }
            }
        }
        

        // 更新当前指示器的宽度
        let indicateWidth = type == .month ? 55:30
        self.indicateBtn.snp.updateConstraints { (make) in
            make.width.equalTo(indicateWidth)
        }
        
        // 更新当前指示器的位置
        // 一个item的宽度
        let itemW = (kScreenWidth - 15 * 2) / CGFloat(self.progressStack.arrangedSubviews.count)
        var itemCenter = 15 + itemW*( CGFloat(currentIndex ) - 0.5)
        if type == .month {
            itemCenter = (kScreenWidth - 15 * 2) * CGFloat(currentIndex)/CGFloat(count) + 15
            // 超出屏幕的时候,贴紧屏幕
            if itemCenter > kScreenWidth - CGFloat(indicateWidth/2) {
                itemCenter = kScreenWidth - CGFloat(indicateWidth/2)
            }
            
        }

         self.indicateBtn.snp.updateConstraints { (make) in
             make.centerX.equalTo(itemCenter)
         }
         
         self.indicateLabel.snp.updateConstraints { (make) in
             make.centerX.equalTo(itemCenter)
         }

    }
    
    

    
}


// MARK: -金额，目标 view
class DateInfoPriceView: UIView {
    
    
    lazy var imageBG: UIImageView = {
        let imageV = UIImageView(image: UIImage(named: "operration_bg_info"))
        return imageV
    }()
    
    lazy var todayLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "今日销售额", font: 12, fontWeight: .regular, textColor: kWhiteColor, textAlignment: .left)
        return lab
    }()
    
    lazy var tagetLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "目标销售额", font: 12, fontWeight: .regular, textColor: kWhiteColor, textAlignment: .left)
        return lab
    }()
    
    lazy var reachLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "达成率", font: 12, fontWeight: .regular, textColor: kWhiteColor, textAlignment: .left)
        return lab
    }()
    
    lazy var todayValueLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "今日销售额", font: 12, fontWeight: .regular, textColor: kWhiteColor, textAlignment: .center)
        return lab
    }()
    
    lazy var tagetValueLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "今日销售额", font: 12, fontWeight: .regular, textColor: kWhiteColor, textAlignment: .center)
        return lab
    }()
    
    lazy var reachValueLabel: UILabel = {
        let lab = UILabel.pj_normalLabel(text: "12%", font: 16, fontWeight: .regular, textColor: UIColor(hex: "#FFDEDE"), textAlignment: .center)
        return lab
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI(){
        
        self.addSubview(imageBG)
        self.imageBG.addSubview(todayLabel)
        self.imageBG.addSubview(todayValueLabel)
        self.imageBG.addSubview(tagetLabel)
        self.imageBG.addSubview(tagetValueLabel)
        self.imageBG.addSubview(reachLabel)
        self.imageBG.addSubview(reachValueLabel)
        
        imageBG.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        tagetValueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageBG.snp.centerY)
            make.centerX.equalTo(self.imageBG)
            make.width.equalTo((kScreenWidth - 15*2)/3)
        }
        
        todayValueLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.tagetValueLabel.snp.bottom)
            make.left.equalTo(self.imageBG)
            make.right.equalTo( tagetValueLabel.snp.left)
        }
        
        reachValueLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.tagetValueLabel.snp.bottom)
            make.left.equalTo(tagetValueLabel.snp.right)
            make.right.equalTo(self.imageBG)
        }
        
        todayLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.todayValueLabel)
            make.bottom.equalTo(self.todayValueLabel.snp.top).offset(-17)
        }
        
        tagetLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.tagetValueLabel)
            make.centerY.equalTo(self.todayLabel.snp.centerY)
        }
        
        reachLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.reachValueLabel)
            make.centerY.equalTo(self.todayLabel.snp.centerY)
        }
        
    }
    
}


// MARK: - 大区，督导，选择
class DateInfoSelectView: UIView {
    
    var  clickAtIndex: (( _ index :Int) -> Void)?
    
    lazy var stackV: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        return sv
    }()
    
    lazy var sepator: UIView = {
        let v = UIView()
        v.backgroundColor = kEECOLOR
        return v
    }()
    
    lazy var indicteV: UIView = {
        let v = UIView()
        v.backgroundColor = kRedColor
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(stackV)
        self.addSubview(sepator)
        self.addSubview(indicteV)
        
        stackV.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        sepator.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(1)
        }
        
        indicteV.snp.makeConstraints { (make) in
            make.bottom.equalTo(self)
            make.centerX.equalTo(20)
            make.width.equalTo(50)
            make.height.equalTo(2)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var selectBtn:UIButton?
    
    var datas:[String] = [] {
        
        didSet {
            
            for (index,str) in datas.enumerated() {
                
                let btn = UIButton()
                btn.setTitle(str, for: .normal)
                btn.titleLabel?.font = k_RegularFont(size: 15)
                btn.setTitleColor(k66COLOR, for: .normal)
                self.stackV.addArrangedSubview(btn)
                btn.tag = 10 + index
                btn.addClickAction { [weak self](btn) in
                    self?.setCurrentSelectIndex(btn.tag - 10)
                    self?.clickAtIndex?(btn.tag - 10)
                }
                
            }
        }
        
    }
    
    
    func setCurrentSelectIndex(_ index:Int) {
        
        if index >= datas.count {
            return
        }
        
        let btn = self.stackV.arrangedSubviews[index]as?UIButton
        self.selectBtn?.setTitleColor(k66COLOR, for: .normal)
        btn?.setTitleColor(k33COLOR, for: .normal)
        self.selectBtn = btn
        
        // 选中的item中心
        let itemcenter  = kScreenWidth / CGFloat(self.datas.count) * (CGFloat(index)  + 0.5)
        
        layoutIfNeeded()
        UIView.animate(withDuration: 0.15) {
            self.indicteV.snp.updateConstraints { (make) in
                make.centerX.equalTo(itemcenter)
            }
            self.layoutIfNeeded()
        }
   
        
    }
    
}
