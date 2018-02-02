//
//  RecurrioUITests.swift
//  RecurrioUITests
//
//  Created by Denis Golub on 18/10/2017.
//  Copyright © 2017 Balancing Rock. All rights reserved.
//

import XCTest

class RecurrioUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testForTable() {

        let app = XCUIApplication()
        let table = app.tables.element(boundBy: 0)
        app.navigationBars["Connect to your Fridge"].buttons["Products"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Rude Health Almond Milk 100%"]/*[[".cells.staticTexts[\"Rude Health Almond Milk 100%\"]",".staticTexts[\"Rude Health Almond Milk 100%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Serial.ProductView"].buttons["Back"].tap()
        
        XCTAssertEqual(app.tables.count, 1)
        XCTAssertEqual(table.cells.count, 14)
    }
    
    func testForAmazonButton() {
        
        let app = XCUIApplication()
        app.navigationBars["Connect to your Fridge"].buttons["Products"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Rude Health Almond Milk 100%"]/*[[".cells.staticTexts[\"Rude Health Almond Milk 100%\"]",".staticTexts[\"Rude Health Almond Milk 100%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
     
        XCTAssertEqual(app.buttons.count, 2)
    }
    
    func testForPerecentage() {
        
        let app = XCUIApplication()
        app.navigationBars["Connect to your Fridge"].buttons["Products"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Cucumber 95%"]/*[[".cells.staticTexts[\"Cucumber 95%\"]",".staticTexts[\"Cucumber 95%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app.staticTexts["100%"].exists)
    }

    func testForImage() {
        let app = XCUIApplication()
        app.navigationBars["Connect to your Fridge"].buttons["Products"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Cucumber 95%"]/*[[".cells.staticTexts[\"Cucumber 95%\"]",".staticTexts[\"Cucumber 95%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let imageView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element

        let count = imageView.images.count
        XCTAssert(count != 0)

    }

    func testForCellTextInTable() {
        let app = XCUIApplication()
        app.navigationBars["Connect to your Fridge"].buttons["Products"].tap()
        XCTAssert(app.staticTexts["Tonic 24%"].exists)
    }

//    func testForCellPercentageToChange() {
//        let app = XCUIApplication()
//        app.navigationBars["Connect to your Fridge"].buttons["Products"].tap()
//        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Wine 100%"]/*[[".cells.staticTexts[\"Wine 100%\"]",".staticTexts[\"Wine 100%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.buttons["Button"].tap()
//        app.buttons["Back"].tap()
//        XCTAssert(app.staticTexts["Wine 92%"].exists)
//    }

    func testForPageToHaveADescription() {

        let app = XCUIApplication()
        app.navigationBars["Connect to your Fridge"].buttons["Products"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Cucumber 95%"]/*[[".cells.staticTexts[\"Cucumber 95%\"]",".staticTexts[\"Cucumber 95%\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.staticTexts["Alessio loves a bit of wine and pizza... dare you to find a more stereotypical Italian"].exists)
    }
    
}
