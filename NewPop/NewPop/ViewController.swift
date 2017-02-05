//
//  ViewController.swift
//  NewPop
//
//  Created by Christopher Webb-Orenstein on 2/5/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alertController = AlertController()
    
    var alert: Alert!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupAlert()
        alertController.setAlert(alert: self.alert, viewController: self)
        alertController.baseAlert.singleButton.addTarget(self, action: #selector(didTapSingleButton(_:)), for: .touchUpInside)
        addControllerAsChild(viewController: alertController)
    }
}

extension ViewController: AlertViewDelegate {
    
    func setupAlert() {
        self.alert =
            Alert(alertType: .oneButton,
                  alertStyle: .boxedBordered,
                  alertTitle: "New Alert",
                  alertContent: "Alert Content",
                  buttonTitles: ["Button"],
                  buttonColors: [UIColor.red],
                  buttonFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                  titleFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                  titleColor: UIColor.purple,
                  titleFontColor: UIColor.white,
                  contentBackground: UIColor.green,
                  contentFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                  contentFontColor: UIColor.black)
    }
    
    
    func addControllerAsChild(viewController: UIViewController) {
        alertController.delegate = self
        alertController.baseAlert.delegate = self
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.didMove(toParentViewController: self)
        didMoveToParent()
    }
    
    dynamic func didTapLeftButton(_ sender: UIButton) {
        print("left tap")
        alertController.baseAlert.removeOverlay()
        alertController.baseAlert.removeView(viewController: self)
        alertController.removeFromParentViewController()
        addGestureToView(view: view)
    }
    
    dynamic func didTapRightButton(_ sender: UIButton) {
        alertController.addOverlay(added: true)
        alertController.baseAlert.rightButton.addTarget(self, action: #selector(handleTap(sender:)), for: .touchUpInside)
        print("right tap")
    }
    
    dynamic func didTapSingleButton(_ sender: UIButton) {
        print("singleTap")
        alertController.removeFromParentViewController()
        alertController.baseAlert.removeView(viewController: self)
        self.alert = Alert(alertType: .twoButton,
                           alertStyle: .roundedBordered,
                           alertTitle: "New Alert",
                           alertContent: "Alert Content",
                           buttonTitles: ["Left Button", "Right Button"],
                           buttonColors: [UIColor.red, UIColor.blue],
                           buttonFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           titleFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           titleColor: UIColor.purple,
                           titleFontColor: UIColor.white,
                           contentBackground: UIColor.white,
                           contentFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           contentFontColor: UIColor.black)
        alertController.addOverlay(added: true)
        alertController.setAlert(alert: self.alert, viewController: self)
        addControllerAsChild(viewController: alertController)
        alertController.baseAlert.leftButton.addTarget(self, action: #selector(didTapLeftButton(_:)), for: .touchUpInside)
        alertController.baseAlert.rightButton.addTarget(self, action: #selector(didTapRightButton(_:)), for: .touchUpInside)
    }
    
    dynamic func handleTap(sender: UITapGestureRecognizer? = nil) {
        self.alert = Alert(alertType: .twoButton,
                           alertStyle: .roundedBordered,
                           alertTitle: "Next Alert",
                           alertContent: "Next Alert",
                           buttonTitles: ["Left Button", "Right Button"],
                           buttonColors: [UIColor.red, UIColor.blue],
                           buttonFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           titleFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           titleColor: UIColor.purple,
                           titleFontColor: UIColor.white,
                           contentBackground: UIColor.lightGray,
                           contentFont: UIFont(name: "HelveticaNeue", size: 17)!,
                           contentFontColor: UIColor.black)
        alertController.setAlert(alert: self.alert, viewController: self)
    }
}


extension ViewController: AlertControllerDelegate {
    
    func addAlertControllerDelegate() {
        alertController.delegate = self
    }
    
    dynamic func didRemoveFromParent() {
        print("removed")
    }
    
    dynamic func didMoveToParent() {
        print("moved")
    }
}

extension ViewController: UIGestureRecognizerDelegate {
    
    func addGestureToView(view: UIView) {
        let tap = UIGestureRecognizer(target: self, action: #selector(didRemoveFromParent))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
}
