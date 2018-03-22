//
//  HUTestVC.swift
//  HUPresentController
//
//  Created by hu on 2018/3/8.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height

class HUTestVC: UIViewController, PresentProtocol {
    let controllerHeight: CGFloat = 300 
    /// sureButton to hide bottom vc
    lazy var sureButton:UIButton = {
        let button = UIButton(frame: CGRect(x: kScreenWidth-60, y: 0, width: 40, height: 40))
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(sureButtonClicked), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    /// conntainer view of bottom vc
    lazy var containerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 75, width: kScreenWidth, height: kScreenHeight-75))
        view.backgroundColor = UIColor.white
        return view
    }()
    /// titleLabel
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame:CGRect(x: (kScreenWidth-150)/2, y: 20, width: 150, height: 30))
        label.textAlignment = .center
        label.text = "Select"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    override public func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    private func config() {
        self.view.frame = CGRect(x: 0, y: 200, width: 300, height: 200)
        view.backgroundColor = UIColor.clear
        let roundView = RoundView(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 20, height: 150))
        view.addSubview(roundView)
        roundView.addSubview(titleLabel)
        view.addSubview(containerView)
        view.addSubview(sureButton)
        let segment1 = UISegmentedControl(items: ["Girl","Boy","Unsure"])
        segment1.frame = CGRect(x: 20, y: 20, width: kScreenWidth-40, height: 35)
        segment1.selectedSegmentIndex = 0
        segment1.tintColor = UIColor(red: 190/255, green: 31/255, blue: 109/255, alpha: 1)
        containerView.addSubview(segment1)
        let segment2 = UISegmentedControl(items: ["🍎","🍋","🍊"])
        segment2.frame = CGRect(x: 20, y: 75, width: kScreenWidth-40, height: 35)
        segment2.selectedSegmentIndex = 1
        segment2.tintColor = UIColor(red: 190/255, green: 31/255, blue: 109/255, alpha: 1)
        containerView.addSubview(segment2)
        let segment3 = UISegmentedControl(items: ["Home","Company","Parking Lot"])
        segment3.frame = CGRect(x: 20, y: 130, width: kScreenWidth-40, height: 35)
        segment3.selectedSegmentIndex = 2
        segment3.tintColor = UIColor(red: 190/255, green: 31/255, blue: 109/255, alpha: 1)
        containerView.addSubview(segment3)
    }
    @objc func sureButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}
/// create a bezier path view
public class RoundView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public override func draw(_ rect: CGRect) {
        let color = UIColor.white
        color.set()
        let path = UIBezierPath(ovalIn: rect)
        path.fill()
    }
}
