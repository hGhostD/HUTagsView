//
//  HUPresentController.swift
//  HUPresentController
//
//  Created by hu on 2018/3/8.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

protocol PresentProtocol {
    var controllerHeight: CGFloat { get }
}
extension PresentProtocol where Self: UIViewController {}

extension UIViewController: UIViewControllerTransitioningDelegate  {
    func presentBottom(_ vc: UIViewController) {
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let present = HUPresentController(presentedViewController: presented, presenting: presenting)
        return present
    }
}

class HUPresentController: UIPresentationController {

    var controllerHeight: CGFloat = 0
    //决定了弹出框的frame
    override var frameOfPresentedViewInContainerView: CGRect {
        return CGRect(x: 0, y: UIScreen.main.bounds.height - controllerHeight , width: UIScreen.main.bounds.width, height: controllerHeight)
    }
    //重写此方法可以在弹框即将显示时执行所需要的操作
    override func presentationTransitionWillBegin() {
        blackView.alpha = 0
        containerView?.addSubview(blackView)
        UIView.animate(withDuration: 0.3) { self.blackView.alpha = 1 }
    }
    //重写此方法可以在弹框显示完毕时执行所需要的操作
    override func presentationTransitionDidEnd(_ completed: Bool) {
    }
    //重写此方法可以在弹框即将消失时执行所需要的操作
    override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.5) { self.blackView.alpha = 0 }
    }
    //重写此方法可以在弹框消失之后执行所需要的操作
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed { blackView.removeFromSuperview() }
    }
    //遮挡阴影
    lazy var blackView: UIView = {
        let view = UIView()
        if let frame = self.containerView?.bounds {
            view.frame = frame
        }
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        if let vc = presentedViewController as? PresentProtocol {
            controllerHeight = vc.controllerHeight
        }
    super.init(presentedViewController:presentedViewController,presenting: presentingViewController)
    }
}
