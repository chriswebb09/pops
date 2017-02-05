//
//  AlertView.swift
//  NewPop
//
//  Created by Christopher Webb-Orenstein on 2/5/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

protocol AlertViewDelegate: class {
    func didTapSingleButton( _ sender:UIButton)
    func didTapLeftButton(_ sender:UIButton)
    func didTapRightButton(_ sender:UIButton)
}

extension AlertViewDelegate {
    func didTapSingleButton(_ sender: UIButton) {
        print("not implemented")
    }
    
    func didTapRightButton(_ sender:UIButton) {
        print("not implemented")
    }
}

public final class AlertView: UIView {
    
    var leftButton: UIButton!
    var rightButton: UIButton!
    var singleButton: UIButton!
    
    
    deinit {
        loadingView.removeFromSuperview()
    }
    
    weak var delegate: AlertViewDelegate?
    
   private var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.clear
        return containerView
    }()
    
    var overlay = UIView()
    
    var loadingView: BaseAlert = {
        let loadingView = BaseAlert()
        loadingView.layoutSubviews()
        loadingView.layer.cornerRadius = 6
        loadingView.backgroundColor = UIColor.white
        return loadingView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setAlertStyle(style: AlertStyle) {
        switch style {
        case .boxed:
            loadingView.layer.cornerRadius = 0
        case .rounded:
            loadingView.layer.cornerRadius = 5
        case .boxedBordered:
            loadingView.layer.borderWidth = 1
            loadingView.layer.borderColor = UIColor.black.cgColor
            loadingView.layer.cornerRadius = 0
        case .roundedBordered:
            loadingView.layer.borderWidth = 1
            loadingView.layer.borderColor = UIColor.black.cgColor
            loadingView.layer.cornerRadius = 5
        }
    }
    
    func addContainerOverlay(isSet: Bool) {
        if isSet {
            overlay.alpha = 0.2
            overlay.frame = containerView.frame
            overlay.backgroundColor = UIColor.black
            containerView.addSubview(overlay)
            containerView.bringSubview(toFront: overlay)
            containerView.bringSubview(toFront: loadingView)
        }
    }
    
    func removeOverlay() {
        overlay.removeFromSuperview()
    }
    
    func setupAlert(alert: Alert) {
        setAlertStyle(style: alert.alertStyle)
        switch alert.alertType {
        case .oneButton:
            singleButton = UIButton()
            singleButton.setTitle(alert.buttonTitles[0], for: .normal)
            loadingView = OneButtonAlert()
            loadingView.setTitle(titleString: alert.alertTitle,
                                 font: alert.titleFont,
                                 fontColor: alert.titleFontColor,
                                 backgroundColor: alert.titleColor)
            loadingView.setContent(contentString: alert.alertContent,
                                   font: alert.contentFont,
                                   fontColor: alert.contentFontColor,
                                   backgroundColor: alert.contentBackground)
            setAlertStyle(style: alert.alertStyle)
            loadingView.addButtonsToAction(button: [singleButton], buttonColors: alert.buttonColors)
        case .twoButton:
            leftButton = UIButton()
            rightButton = UIButton()
            leftButton.setTitle(alert.buttonTitles[0], for: .normal)
            rightButton.setTitle(alert.buttonTitles[1], for: .normal)
            loadingView = TwoButtonAlert()
            loadingView.setTitle(titleString: alert.alertTitle,
                                 font: alert.titleFont,
                                 fontColor: alert.titleFontColor,
                                 backgroundColor: alert.titleColor)
            loadingView.setContent(contentString: alert.alertContent,
                                   font: alert.contentFont,
                                   fontColor: alert.contentFontColor,
                                   backgroundColor: alert.contentBackground)
            setAlertStyle(style: alert.alertStyle)
            loadingView.addButtonsToAction(button: [leftButton, rightButton], buttonColors:  [UIColor.red, UIColor.blue])
        }
    }
    
    public func showAlert(viewController: UIViewController) {
        containerView.isHidden = false
        containerView.frame = UIScreen.main.bounds
        containerView.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        _addLoadingView()
        _addSubviews(viewController: viewController)
        viewController.view.bringSubview(toFront: containerView)
    }
    
    public func hideAlert(viewController: UIViewController) {
        viewController.view.sendSubview(toBack: containerView)
        containerView.isHidden = true
    }
    
    private func _addLoadingView() {
        print("_addLoadingView")
        loadingView.frame = CGRect(x:0, y:0, width: UIScreen.main.bounds.width * 0.9, height:UIScreen.main.bounds.height * 0.35)
        loadingView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        loadingView.clipsToBounds = true
    }
    
    private func _addSubviews(viewController: UIViewController) {
        print("_addSubviews")
        _addLoadingView()
        containerView.addSubview(loadingView)
        viewController.view.addSubview(containerView)
    }
    
    func didTapSingleButton(sender: UIButton) {
        print("single button")
        delegate?.didTapSingleButton(sender)
    }
    
    func removeView(viewController: UIViewController) {
        loadingView.removeFromSuperview()
        removeFromSuperview()
    }
    
    func didTapLeftButton(sender:UIButton) {
        print("tapped in view")
        delegate?.didTapLeftButton(sender)
    }
    
    func didTapRightButton(sender:UIButton) {
        delegate?.didTapRightButton(sender)
    }
}
