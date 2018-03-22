//
//  HUCollectionTagsFlowLayout.swift
//  HYCollectionKit
//
//  Created by hu on 2018/3/10.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

class HUCollectionTagsFlowLayout: UICollectionViewFlowLayout {
   
    override init() {
        super.init()
        self.scrollDirection = .vertical
        self.minimumLineSpacing = 5
        self.minimumInteritemSpacing = 5
        self.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}


