//
//  Alert.swift
//  NewPop
//
//  Created by Christopher Webb-Orenstein on 2/5/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

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
}
