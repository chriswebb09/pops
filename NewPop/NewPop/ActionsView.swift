//
//  ActionsView.swift
//  NewPop
//
//  Created by Christopher Webb-Orenstein on 2/5/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class ActionsView: UIView {
    
    var buttons: [UIButton]!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    internal func setupButtons(buttonColors: [UIColor]) {
        
        let zipped = zip(buttons, buttonColors)
        _ = zipped.flatMap { $0.0.backgroundColor = $0.1 }
        
        buttons.forEach { button in
            addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            button.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            button.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
            button.widthAnchor.constraint(equalTo: widthAnchor, multiplier: (CGFloat(1) / CGFloat(buttons.count))).isActive = true
        }
        if buttons.count > 1 {
            buttons[0].leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            buttons[1].rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        } else if buttons.count == 1 {
            buttons[0].centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        }
    }
}
