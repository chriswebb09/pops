//
//  BannerView.swift
//  NewPop
//
//  Created by Christopher Webb-Orenstein on 2/5/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

class BannerView: UIView {
    
    private var _contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.textAlignment = .center
        return contentLabel
    }()
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        _setupConstraints()
    }
    
    private func _setupConstraints() {
        addSubview(_contentLabel)
        _contentLabel.translatesAutoresizingMaskIntoConstraints = false
        _contentLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        _contentLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        _contentLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75).isActive = true
        _contentLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    }
    
    internal func setTitle(contentString: String) {
        _contentLabel.text = contentString
    }
    
    internal func setBannerColor(bannerColor: UIColor) {
        backgroundColor = bannerColor
    }
    
    internal func setFont(font: UIFont) {
        _contentLabel.font = font
    }
    
    internal func setFontColor(fontColor: UIColor) {
        _contentLabel.textColor = fontColor
    }
}



