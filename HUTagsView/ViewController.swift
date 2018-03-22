//
//  ViewController.swift
//  HUTagsView
//
//  Created by hu on 2018/3/20.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let edit = HUEditTagsViewController()
    var selectArr = ["swift", "Objective-C", "C++"]
    var moreArr   = ["哈哈哈哈哈", "123456" ,"AB"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        edit.saveBlock = { (first, second) in
            self.selectArr = first
            self.moreArr = second
        }
    }

    @IBAction func buttonClick(_ sender: Any) {
        edit.myTagsArr = selectArr
        edit.moreTagsArr = moreArr
        self.presentBottom(edit)
    }
}

