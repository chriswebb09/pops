//
//  BaseAlert.swift
//  NewPop
//
//  Created by Christopher Webb-Orenstein on 2/5/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit

protocol BaseAlertDelegate: class {
    func didTapSingleButton( _ sender:UIButton)
    func didTapLeftButton(_ sender:UIButton)
    func didTapRightButtonTwo(_ sender:UIButton)
}

extension BaseAlertDelegate {
    
    func didTapSingleButton(_ sender: UIButton) {
        print("not implemented")
    }
    
    func didTapRightButton(_ sender:UIButton) {
        print("not implemented")
    }
}

class BaseAlert: UIView {
    
    var baseAlert: Alert?
    
    weak var delegate: BaseAlertDelegate?
    
    private var banner: BannerView = {
        let titleView = BannerView()
        titleView.backgroundColor = UIColor.blue
        titleView.layoutSubviews()
        return titleView
    }()
    
    private var content: ContentView = {
        let contentView = ContentView()
        contentView.backgroundColor = UIColor.white
        contentView.layoutSubviews()
        return contentView
    }()
    
    private var actions: ActionsView = {
        let actionsView = ActionsView()
        actionsView.layoutSubviews()
        actionsView.backgroundColor = UIColor.lightGray
        return actionsView
    }()
    
    var views = [UIView]()
    
    override func layoutSubviews() {
        print("layoutSubviews()")
        views = [banner, content, actions]
        _setup()
        super.layoutSubviews()
    }
    
    private func _setup() {
        print("_setup()")
        
        _ = views.map { addSubview($0) }
        
        _ = views.map { $0.translatesAutoresizingMaskIntoConstraints = false }
        _ = views.map { $0.widthAnchor.constraint(equalTo: widthAnchor).isActive = true }
        _ = views.map { $0.centerXAnchor.constraint(equalTo: centerXAnchor).isActive  = true }
        
        setHeights(banners: [banner, actions])
        
        content.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        banner.topAnchor.constraint(equalTo: topAnchor).isActive = true
        content.topAnchor.constraint(equalTo: banner.bottomAnchor).isActive = true
        actions.topAnchor.constraint(equalTo: content.bottomAnchor).isActive = true
        
        backgroundColor = UIColor.white
    }

    func setupAlert(alert: Alert) {
        baseAlert = alert
        if let alertTemplate = baseAlert {
            setTitle(titleString: alertTemplate.alertTitle, font: alertTemplate.titleFont, fontColor: alertTemplate.titleFontColor, backgroundColor: alertTemplate.titleColor)
            setContent(contentString: alertTemplate.alertContent, font: alertTemplate.contentFont, fontColor: alertTemplate.contentFontColor, backgroundColor: alertTemplate.contentBackground)
        }
    }
    
    private func setHeights(banners: [UIView]) {
        _ = banners.map { $0.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true }
    }
    
    public func setTitle(titleString:String, font: UIFont, fontColor: UIColor, backgroundColor: UIColor) {
        banner.setContent(contentString: titleString)
        banner.setBannerColor(bannerColor: backgroundColor)
        banner.setFont(font: font)
        banner.setFontColor(fontColor: fontColor)
    }
    
    public func setContent(contentString: String, font: UIFont, fontColor: UIColor, backgroundColor: UIColor) {
        content.setContent(contentString: contentString)
        content.setContentBackground(color: backgroundColor)
        content.setContentFont(font: font)
        content.setFontColor(color: fontColor)
    }
    
    func addButtonsToAction(button:[UIButton], buttonColors:[UIColor]) {
        actions.buttons = button
        actions.setupButtons(buttonColors: buttonColors)
    }
    
    func didTapLeftButton(sender:UIButton) {
        print("tapped in view")
        delegate?.didTapLeftButton(sender)
    }
    
    func didTapRightButton(sender:UIButton) {
        delegate?.didTapRightButtonTwo(sender)
    }
}
