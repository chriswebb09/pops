//
//  AlertController.swift
//  NewPop
//
//  Created by Christopher Webb-Orenstein on 2/5/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

protocol AlertControllerDelegate: class {
    func didMoveToParent()
    func didRemoveFromParent()
}

class AlertController: UIViewController {
    
    var baseAlert: AlertView = AlertView()
    var alert: Alert!
    weak var delegate: AlertControllerDelegate?
    var overlayIsEnabled: Bool?
    
    deinit {
        baseAlert.removeView(viewController: self)
        removeFromParentViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addOverlay(added: Bool) {
        overlayIsEnabled = added
        baseAlert.addContainerOverlay(isSet: overlayIsEnabled!)
    }
    
    func setAlert(alert: Alert, viewController: UIViewController) {
        self.alert = alert
        baseAlert.setupAlert(alert: alert)
        baseAlert.showAlert(viewController: self)
    }
    
    func showView() {
        baseAlert.showAlert(viewController: self)
    }
    
    func hideView() {
        baseAlert.hideAlert(viewController: self)
    }
    
//    func addControllerAsChild(viewController: UIViewController) {
//        alertController.delegate = self
//        alertController.baseAlert.delegate = self
//        addChildViewController(viewController)
//        view.addSubview(viewController.view)
//        viewController.view.frame = view.bounds
//        viewController.didMove(toParentViewController: self)
//        didMoveToParent()
//    }
    
    dynamic func changeBackgroundColor() {
        view.backgroundColor = UIColor.green
    }
    
    func didMoveToParent() {
        print("didMoveToParent()")
        delegate?.didMoveToParent()
    }
    
    func didRemoveFromParent() {
        print("didRemoveFromParent()")
        delegate?.didRemoveFromParent()
    }
}
