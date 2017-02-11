import UIKit

class ViewController: UIViewController {
    
    var alertController = AlertController()
    
    var alert: Alert!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupAlert()
        
        alertController.setAlert(alert: self.alert, viewController: self)
        alertController.baseAlert.singleButton.addTarget(self, action: #selector(didTapSingleButton(_:)), for: .touchUpInside)
        
        addControllerAsChild(viewController: alertController)
    }
}

extension ViewController: AlertViewDelegate {
    
    func setupAlert() {
        self.alert =
            Alert(type: .oneButton,
                  style: .boxedBordered,
                  title: "New Alert",
                  content: "Alert Content",
                  buttonTitles: ["Button"],
                  buttonColors: [.red],
                  buttonFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                  titleFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                  titleColor: .purple,
                  titleFontColor: .white,
                  contentBackground: .green,
                  contentFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                  contentFontColor: .black)
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
}

extension ViewController {

    dynamic func didTapLeftButton(_ sender: UIButton) {
        alertController.removeAlert(vc: self)
    }
    
    dynamic func didTapRightButton(_ sender: UIButton) {
        alertController.addOverlay(added: true)
        alertController.baseAlert.rightButton.addTarget(self, action: #selector(handleTap(sender:)), for: .touchUpInside)
    }
    
    dynamic func didTapSingleButton(_ sender: UIButton) {
        
        alertController.removeFromParentViewController()
        alertController.baseAlert.removeView(viewController: self)

        self.alert = Alert(type: .twoButton,
                           style: .roundedBordered,
                           title: "New Alert",
                           content: "Alert Content",
                           buttonTitles: ["Left Button", "Right Button"],
                           buttonColors: [.red, .blue],
                           buttonFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           titleFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           titleColor: .purple,
                           titleFontColor: .white,
                           contentBackground: .white,
                           contentFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           contentFontColor: .white)
        
        alertController.addOverlay(added: true)
        alertController.setAlert(alert: self.alert, viewController: self)
        
        alertController.baseAlert.leftButton.addTarget(self, action: #selector(didTapLeftButton(_:)), for: .touchUpInside)
        alertController.baseAlert.rightButton.addTarget(self, action: #selector(didTapRightButton(_:)), for: .touchUpInside)

        addControllerAsChild(viewController: alertController)
    }
    
    dynamic func handleTap(sender: UITapGestureRecognizer? = nil) {
        
        self.alert = Alert(type: .twoButton,
                           style: .roundedBordered,
                           title: "Next Alert",
                           content: "Next Alert",
                           buttonTitles: ["Left Button", "Right Button"],
                           buttonColors: [.red, .blue],
                           buttonFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           titleFont: UIFont(name: "Avenir-Heavy", size: 17)!,
                           titleColor: .purple,
                           titleFontColor: .white,
                           contentBackground: .lightGray,
                           contentFont: UIFont(name: "HelveticaNeue", size: 17)!,
                           contentFontColor: .black)
        
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
