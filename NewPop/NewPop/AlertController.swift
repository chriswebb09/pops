import UIKit

protocol AlertControllerDelegate: class {
    func didMoveToParent()
    func didRemoveFromParent()
}

public class AlertController: UIViewController {
    
    var baseAlert: AlertView = AlertView()
    var alert: Alert!
    weak var delegate: AlertControllerDelegate?
    var overlayIsEnabled: Bool?
    
    deinit {
        baseAlert.removeView(viewController: self)
        removeFromParentViewController()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func addOverlay(added: Bool) {
        overlayIsEnabled = added
        baseAlert.addContainerOverlay(isSet: overlayIsEnabled!)
    }
    
    func setAlert(alert: Alert, viewController: UIViewController) {
        self.alert = alert
        
        baseAlert.setupAlert(alert: alert)
        baseAlert.showAlert(viewController: self)
    }
    
    public func showView() {
        baseAlert.showAlert(viewController: self)
    }
    
    public func hideView() {
        baseAlert.hideAlert(viewController: self)
    }
    
    dynamic func changeBackgroundColor() {
        view.backgroundColor = .green
    }
    
    func didMoveToParent() {
        delegate?.didMoveToParent()
    }
    
    func didRemoveFromParent() {
        delegate?.didRemoveFromParent()
    }
    
    public func removeAlert(vc: UIViewController) {
        baseAlert.removeOverlay()
        baseAlert.removeView(viewController: vc)
        
        removeFromParentViewController()
    }
}
