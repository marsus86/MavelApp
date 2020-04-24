//
//  MarvelAppUITests.swift
//  MarvelAppUITests
//
//  Created by m.murillo.bermejo on 23/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import XCTest

class MarvelAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
//      sleep(1)
//      let button = app.buttons.element(matching: .button, identifier: "buttonStart")
//      button.tap()
//      sleep(1)
//      XCTAssertTrue(app.otherElements["ListCharacter"].exists)
//      XCTAssertEqual(app.staticTexts["Personajes Marvel"].value as! String, "Personajes Marvel")
//      app.tables["3-D Man, A-Bomb (HAS), A.I.M., Aaron Stack, Abomination (Emil Blonsky), Abomination (Ultimate), Absorbing Man"].staticTexts["A.I.M."].tap()
//      sleep(1)
//      XCTAssertTrue(app.otherElements["DetailCharacter"].exists)
//      XCTAssertEqual(app.staticTexts["Historias en las que aparece"].value as! String, "Historias en las que aparece")
//      let buttonBack = app.buttons.element(matching: .button, identifier: "buttonBack")
//      buttonBack.tap()
//        sleep(1)
//      XCTAssertTrue(app.otherElements["ListCharacter"].exists)
//      XCTAssertEqual(app.staticTexts["Personajes Marvel"].value as! String, "Personajes Marvel")
        
//      XCTAssert(true)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
                        // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
