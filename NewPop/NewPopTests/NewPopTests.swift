//
//  NewPopTests.swift
//  NewPopTests
//
//  Created by Christopher Webb-Orenstein on 2/5/17.
//  Copyright © 2017 Christopher Webb-Orenstein. All rights reserved.
//

import XCTest
@testable import NewPop

class NewPopTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testController() {
        var viewController = ViewController()
        viewController.viewDidLoad()
        XCTAssert(viewController.alertController != nil)
        XCTAssert(viewController.alertController.delegate != nil)
    }
    
    func testAlertController() {
        let viewController = ViewController()
        viewController.viewDidLoad()
        let alertController = AlertController()
        alertController.delegate = viewController
        let alert =  Alert(alertType: .twoButton, alertStyle: .roundedBordered, alertTitle: "Next Alert", alertContent: "Next Alert", buttonTitles: ["Left Button", "Right Button"], buttonColors: [UIColor.red, UIColor.blue], buttonFont: UIFont(name: "Avenir-Heavy", size: 17)!, titleFont: UIFont(name: "Avenir-Heavy", size: 17)!, titleColor: UIColor.purple, titleFontColor: UIColor.white, contentBackground: UIColor.lightGray, contentFont: UIFont(name: "HelveticaNeue", size: 17)!, contentFontColor: UIColor.black)
        alertController.setAlert(alert: alert, viewController: viewController)
        XCTAssert(alertController.baseAlert != nil, "BaseAlert is not nil")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
