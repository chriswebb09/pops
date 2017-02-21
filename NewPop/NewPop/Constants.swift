import UIKit

struct Constants {
    struct Font {
        struct Thin {
            static let thinFontLarge = UIFont(name: "HelveticaNeue-Thin", size: 18)
            static let thinFontMedium = UIFont(name: "HelveticaNeue-Thin", size: 16)
            static let thinFontSmall = UIFont(name: "HelveticaNeue-Thin", size: 14)
        }
        
        struct Bolder {
            static let bolderFontSmall = UIFont(name: "HelveticaNeue", size: 12)
            static let bolderFontMedium = UIFont(name: "HelveticaNeue", size: 16)
            static let bolderFontMediumLarge = UIFont(name: "HelveticaNeue", size: 18)
            static let bolderFontLarge = UIFont(name: "HelveticaNeue", size: 22)
            static let bolderFontNormal = UIFont(name: "HelveticaNeue", size: 18)
        }
        
        struct Standard {
            static let fontNormal = UIFont(name: "HelveticaNeue-Light", size: 18)
            static let fontExtraSmall = UIFont(name: "HelveticaNeue-Light", size: 12)
            static let fontSmall = UIFont(name: "HelveticaNeue-Light", size: 14)
            static let fontMedium = UIFont(name: "HelveticaNeue-Light", size: 16)
            static let fontLarge = UIFont(name: "HelveticaNeue-Thin", size: 22)
        }
    }
    struct Color {
        static let buttonColorBlue = UIColor(red:0.41, green:0.72, blue:0.90, alpha:1.0)
    }
    struct Misc {
        static let signupFieldFont = UIFont(name: "HelveticaNeue-Thin" , size: 18)
        static let borderWidth:CGFloat = 1
        static let searchFieldButtonRadius: CGFloat = 3
        static let signupFieldColor = UIColor.lightGray.cgColor
        static let mainOffset:CGFloat = 30
        static let centerYOffset:CGFloat = 0.12
        static let searchFieldWidth:CGFloat = 0.86
        static let buttonColor = UIColor(red:0.10, green:0.71, blue:1.00, alpha:1.0)
        static let headerLabelHeight:CGFloat = 0.85
        static let buttonWidth:CGFloat = 0.25
        static let headerLabelTopOffset:CGFloat = 0.13
        static let buttonHeight = CGFloat(0.07)
        
    }
}
