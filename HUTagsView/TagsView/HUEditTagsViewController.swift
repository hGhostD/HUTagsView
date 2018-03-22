//
//  HUEditTagsViewController.swift
//  HYCollectionKit
//
//  Created by hu on 2018/3/10.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

class HUEditTagsViewController: UIViewController,HUCollectionTagsViewDelegate,PresentProtocol {
    let  controllerHeight: CGFloat = UIScreen.main.bounds.size.height
    
    var myTagsArr: [String] = []
    var moreTagsArr: [String] = []
    private var dataArr: [[String]] {
        return [self.myTagsArr, self.moreTagsArr]
    }
    typealias tagsBlock = ([String], [String]) -> Void
    var saveBlock: tagsBlock?
    
    var tagsView : HUCollectionTagsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    func setupUI() {
        let backView = UIView(frame: self.view.frame)
        backView.backgroundColor = .clear
        let dissmisTap = UITapGestureRecognizer(target: self, action: #selector(dismissAlert))
        backView.addGestureRecognizer(dissmisTap)
        self.view.addSubview(backView)
        let flowLayout = HUCollectionTagsFlowLayout()
        tagsView = HUCollectionTagsView(frame: CGRect(x: 40, y: 80, width: self.view.frame.width - 80, height: self.view.frame.height - 260), collectionViewLayout: flowLayout)
        tagsView?.hu_delegate = self
        self.view.addSubview(tagsView!)
    }
    
    func setupData() {
        self.tagsView?.dataArr = self.dataArr
        self.tagsView?.reloadData()
    }
    
    func collectionTagsView(collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let text = self.myTagsArr[indexPath.row]
            self.myTagsArr.remove(at: indexPath.row)
            self.moreTagsArr.insert(text, at: 0)
            self.tagsView?.dataArr = self.dataArr
            self.tagsView?.moveItem(at: indexPath, to: IndexPath(row: 0, section: 1))
            self.tagsView?.reloadItems(at: [IndexPath(row: 0, section: 1)])
        }
        
        if indexPath.section == 1 {
            let text = self.moreTagsArr[indexPath.row]
            self.moreTagsArr.remove(at: indexPath.row)
            self.myTagsArr.insert(text, at: 0)
            self.tagsView?.dataArr = self.dataArr
            self.tagsView?.moveItem(at: indexPath, to: IndexPath(row: 0, section: 0))
            self.tagsView?.reloadItems(at: [IndexPath(row: 0, section: 0)])

        }
    }
    @objc func dismissAlert() {
        self.saveBlock?(self.myTagsArr, self.moreTagsArr)
        self.dismiss(animated: true)
    }
}
