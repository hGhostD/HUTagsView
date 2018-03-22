//
//  HUCollectionTagsView.swift
//  HYCollectionKit
//
//  Created by hu on 2018/3/10.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

protocol HUCollectionTagsViewDelegate {
    func collectionTagsView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}
let cellIdentifier = "cellIdentifier"
let cellHeaderIdentifier = "cellHeaderIdentifier"

class HUCollectionTagsView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var dataArr: [[String]] = [[]]
    var hu_delegate: HUCollectionTagsViewDelegate?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = .white
        
        self.register(HUCollectViewCell.self, forCellWithReuseIdentifier: cellIdentifier)

        self.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeaderIdentifier)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dataArr.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.dataArr[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        let arr = self.dataArr[indexPath.section]
        let text = arr[indexPath.row]
        if let tagCell = cell as? HUCollectViewCell {
            tagCell.setText(text, section: indexPath.section)
            return tagCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = self.dataArr[indexPath.section][indexPath.row].textWidth
        return CGSize(width: text, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        self.hu_delegate?.collectionTagsView(collectionView: self, didSelectItemAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.frame.width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let title = UILabel(frame: CGRect(x: 20, y: 0, width: 120, height: 40))
        if indexPath.section == 0 {
            title.text = "我的标签"
        }else {
            title.text = "更多标签"
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellHeaderIdentifier, for: indexPath)
        headerView.addSubview(title)
        return headerView
    }
}
