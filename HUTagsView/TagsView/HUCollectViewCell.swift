//
//  HUCollectViewCell.swift
//  HYCollectionKit
//
//  Created by hu on 2018/3/10.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

class HUCollectViewCell: UICollectionViewCell {
    let title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    private func setupUI() {
        title.font = UIFont.systemFont(ofSize: 16)
        title.layer.cornerRadius = 5
        title.layer.masksToBounds = true
        title.layer.borderWidth = 1
        title.textAlignment = .center
        
        self.contentView.addSubview(title)
    }
    
    func setText(_ text: String, section: Int) {
        self.title.text = text
        self.title.frame = CGRect(x: 0, y: 0, width: text.textWidth, height: 30)
        if section == 0 {
            self.title.layer.borderColor = UIColor.red.cgColor
            self.title.textColor = .red
        }else {
            self.title.layer.borderColor = UIColor.black.cgColor
            self.title.textColor = .black
        }
    }
}

extension String {
    var textWidth: CGFloat {
        let new = self as NSString
        let size = CGSize(width: 1000, height: 1000)
        
        let rect = new.boundingRect(with: size, options: .usesFontLeading, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return rect.width + 20
    }
}
