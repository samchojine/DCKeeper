//
//  MeMainController.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/23.
//

import UIKit

class MeMainController: PJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.naviTitle = "大仓管家";
        self.naviBar.leftItemImage = UIImage(named: "navi_icon_logo")
        view.addSubview(self.collectionV);
        self.collectionV.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(kTopHeight)
        }
    }
    
    lazy var collectionV: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout.init()
        let width = (kScreenWidth - 40*5)/4
        layout.itemSize = CGSize.init(width: width, height: width)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 40
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 40, bottom: 10, right: 40)
        layout.headerReferenceSize = CGSize(kScreenWidth, 293)
        
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.alwaysBounceVertical = true
        cv.backgroundColor = kWhiteColor
        cv .registerHeader(anyClass: MeCollectionHeaderView.self)
        cv.registerCell(anyClass: MeCollectionViewCell.self)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    


}

extension MeMainController :UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.cell(anyClass: MeCollectionViewCell.self, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerV =  collectionView.header(anyClass: MeCollectionHeaderView.self, for: indexPath)
        return headerV
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(MeSettingController(), animated: true)
        
    }
    
    
    
    
    
    
    
    
}
