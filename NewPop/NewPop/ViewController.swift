//
//  ViewController.swift
//  NewPop
//
//  Created by Christopher Webb-Orenstein on 2/5/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AlertControllerDelegate, AlertViewDelegate, UIGestureRecognizerDelegate {
    
    var alertController = AlertController()
    
    var alert: Alert!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.alert = Alert(alertType: .oneButton, alertStyle: .boxedBordered, alertTitle: "New Alert", alertContent: "Alert Content", buttonTitles: ["Button"], buttonColors: [UIColor.red], buttonFont: UIFont(name: "Avenir-Heavy", size: 17)!, titleFont: UIFont(name: "Avenir-Heavy", size: 17)!, titleColor: UIColor.purple, titleFontColor: UIColor.white, contentBackground: UIColor.lightGray, contentFont: UIFont(name: "Avenir-Heavy", size: 17)!, contentFontColor: UIColor.black)
        alertController.delegate = self
        alertController.baseAlert.delegate = self
        alertController.setAlert(alert:self.alert, viewController: self)
        alertController.baseAlert.singleButton.addTarget(self, action: #selector(didTapSingleButton(_:)), for: .touchUpInside)
        addControllerAsChild(viewController: alertController)
    }
    
    func addControllerAsChild(viewController: UIViewController) {
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.didMove(toParentViewController: self)
        didMoveToParent()
    }
    
    dynamic func didTapLeftButton(_ sender: UIButton) {
        print("left tap")
        alertController.baseAlert.removeOverlay()
    }
    
    dynamic func didTapRightButton(_ sender: UIButton) {
        alertController.baseAlert.addContainerOverlay()
        print("right tap")
    }
    
    dynamic func didTapSingleButton(_ sender: UIButton) {
        print("singleTap")
        alertController.removeFromParentViewController()
        self.alert = Alert(alertType: .twoButton, alertStyle: .roundedBordered, alertTitle: "New Alert", alertContent: "Alert Content", buttonTitles: ["Left Button", "Right Button"], buttonColors: [UIColor.red, UIColor.blue], buttonFont: UIFont(name: "Avenir-Heavy", size: 17)!, titleFont: UIFont(name: "Avenir-Heavy", size: 17)!, titleColor: UIColor.purple, titleFontColor: UIColor.white, contentBackground: UIColor.lightGray, contentFont: UIFont(name: "Avenir-Heavy", size: 17)!, contentFontColor: UIColor.black)
        alertController.setAlert(alert: self.alert, viewController: self)
        addControllerAsChild(viewController: alertController)
        alertController.baseAlert.addContainerOverlay()
        alertController.baseAlert.leftButton.addTarget(self, action: #selector(didTapLeftButton(_:)), for: .touchUpInside)
        alertController.baseAlert.rightButton.addTarget(self, action: #selector(didTapRightButton(_:)), for: .touchUpInside)
    }
    
    dynamic func handleTap(sender: UITapGestureRecognizer? = nil) {
        alertController.baseAlert.showAlert(viewController: self)
    }
    
    dynamic func handleTapTwo(sender: UITapGestureRecognizer? = nil) {
        alertController.baseAlert.containerView.backgroundColor = UIColor.green
        alertController.baseAlert.containerView.alpha = 1
        alertController.baseAlert.showAlert(viewController: self)
    }
     
    func didRemoveFromParent() {
        print("removed")
    }
    
    func didMoveToParent() {
        print("moved")
    }
}

