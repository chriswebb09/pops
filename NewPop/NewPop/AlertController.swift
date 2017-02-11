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
}

extension AlertController {
    
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
}

extension AlertController {
    
    dynamic func changeBackgroundColor() {
        view.backgroundColor = UIColor.green
    }
    
    func didMoveToParent() {
        delegate?.didMoveToParent()
    }
    
    func didRemoveFromParent() {
        delegate?.didRemoveFromParent()
    }
    
    func removeAlert(vc: UIViewController) {
        
        baseAlert.removeOverlay()
        baseAlert.removeView(viewController: vc)
        
        removeFromParentViewController()
    }
}
