import UIKit

struct Alert {
    var alertType: AlertType
    var alertStyle: AlertStyle
    var alertTitle: String
    var alertContent: String
    var buttonTitles: [String]
    var buttonColors: [UIColor]
    var buttonFont: UIFont
    var titleFont: UIFont
    var titleColor: UIColor
    var titleFontColor: UIColor
    var contentBackground: UIColor
    var contentFont: UIFont
    var contentFontColor: UIColor
    
    init() {
        self.alertType = .oneButton
        self.alertStyle = .boxed
        self.alertTitle = "Default"
        self.alertContent = "Default Content"
        self.buttonTitles = ["Button"]
        self.buttonColors = [UIColor.blue]
        self.buttonFont = UIFont(name: "HelveticaNeue", size: 17)!
        self.titleFont = UIFont(name: "HelveticaNeue", size: 17)!
        self.titleColor = UIColor.blue
        self.titleFontColor = UIColor.white
        self.contentBackground = UIColor.lightGray
        self.contentFont = UIFont(name: "HelveticaNeue", size: 17)!
        self.contentFontColor = UIColor.black
    }
    
    init(title: String, content: String, buttonTitles: [String]) {
        self.alertType = .oneButton
        self.alertStyle = .boxed
        self.alertTitle = title
        self.alertContent = content
        self.buttonTitles = buttonTitles
        self.buttonColors = [UIColor.blue]
        self.buttonFont = UIFont(name: "HelveticaNeue", size: 17)!
        self.titleFont = UIFont(name: "HelveticaNeue", size: 17)!
        self.titleColor = UIColor.blue
        self.titleFontColor = UIColor.white
        self.contentBackground = UIColor.lightGray
        self.contentFont = UIFont(name: "HelveticaNeue", size: 17)!
        self.contentFontColor = UIColor.black
    }
    
    init(type: AlertType, style: AlertStyle, title: String, content: String, buttonTitles: [String], buttonColors: [UIColor], buttonFont: UIFont, titleFont: UIFont, titleColor: UIColor, titleFontColor: UIColor, contentBackground: UIColor, contentFont: UIFont, contentFontColor: UIColor) {
        self.alertType = type
        self.alertStyle = style
        self.alertTitle = title
        self.alertContent = content
        self.buttonTitles = buttonTitles
        self.buttonColors = buttonColors
        self.buttonFont = buttonFont
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.titleFontColor = titleFontColor
        self.contentBackground = contentBackground
        self.contentFont = contentFont
        self.contentFontColor = contentFontColor
    }
}
