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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setAlert(alert: Alert, viewController: UIViewController) {
        self.alert = alert
        baseAlert.setupAlert(alert: alert)
        baseAlert.showAlert(viewController: self)
    }
    
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
