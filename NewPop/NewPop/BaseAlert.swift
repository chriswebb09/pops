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
    
    private var _banner: BannerView = {
        let titleView = BannerView()
        titleView.backgroundColor = UIColor.blue
        titleView.layoutSubviews()
        return titleView
    }()
    
    private var _content: ContentView = {
        let contentView = ContentView()
        contentView.backgroundColor = UIColor.white
        contentView.layoutSubviews()
        return contentView
    }()
    
    private var _actions: ActionsView = {
        let actionsView = ActionsView()
        actionsView.layoutSubviews()
        actionsView.backgroundColor = UIColor.lightGray
        return actionsView
    }()
    
    var views = [UIView]()
    
    override func layoutSubviews() {
        print("layoutSubviews()")
        views = [_banner, _content, _actions]
        _setup()
        super.layoutSubviews()
    }
    
    private func _setup() {
        print("_setup()")
        
        _ = views.map { addSubview($0) }
        
        _ = views.map { $0.translatesAutoresizingMaskIntoConstraints = false }
        _ = views.map { $0.widthAnchor.constraint(equalTo: widthAnchor).isActive = true }
        _ = views.map { $0.centerXAnchor.constraint(equalTo: centerXAnchor).isActive  = true }
        
        setHeights(banners: [_banner, _actions])
        
        _content.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        _banner.topAnchor.constraint(equalTo: topAnchor).isActive = true
        _content.topAnchor.constraint(equalTo: _banner.bottomAnchor).isActive = true
        _actions.topAnchor.constraint(equalTo: _content.bottomAnchor).isActive = true
        
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
        print("here")
        _banner.setTitle(contentString: titleString)
        _banner.setBannerColor(bannerColor: backgroundColor)
        _banner.setFont(font: font)
        _banner.setFontColor(fontColor: fontColor)
        print("\(titleString)")
    }
    
    public func setContent(contentString: String, font: UIFont, fontColor: UIColor, backgroundColor: UIColor) {
        _content.setContent(contentString: contentString)
        _content.setContentBackground(color: backgroundColor)
        _content.setContentFont(font: font)
        _content.setFontColor(color: fontColor)
    }
    
    func addButtonsToAction(button: [UIButton], buttonColors: [UIColor]) {
        _actions.buttons = button
        _actions.setupButtons(buttonColors: buttonColors)
    }
    
    func didTapLeftButton(sender: UIButton) {
        print("tapped in view")
        delegate?.didTapLeftButton(sender)
    }
    
    func didTapRightButton(sender: UIButton) {
        delegate?.didTapRightButtonTwo(sender)
    }
}
