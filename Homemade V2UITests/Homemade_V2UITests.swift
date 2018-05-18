//
//  Homemade_V2UITests.swift
//  Homemade V2UITests
//
//  Created by Joshua Jon on 14/8/17.
//  Copyright © 2017 JoshuaJon. All rights reserved.
//

import XCTest

class Homemade_V2UITests: XCTestCase {
        
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
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testfirstScene() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.swipeUp()
        element.tap()
        element.swipeRight()
        element.swipeUp()
        app.navigationBars["Homemade_V2.RecipeView"].buttons["backButton"].tap()
        
        let backbuttonButton = app.navigationBars["Homemade_V2.MealScene"].buttons["backButton"]
        backbuttonButton.tap()
        element.swipeDown()
        element.swipeUp()
        
    }
    func testSecondScene() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.tabBars.buttons["Cook Time"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        
        let backbuttonButton = app.navigationBars["Homemade_V2.TimeTable"].buttons["backButton"]
        backbuttonButton.tap()
        element.tap()
        element.tap()
        element.swipeUp()
        element.swipeUp()
        element.tap()
        app.navigationBars["Homemade_V2.RecipeView"].buttons["backButton"].tap()
        app.navigationBars["Homemade_V2.MealScene"].buttons["backButton"].tap()
        backbuttonButton.tap()
        
        
    }
    func testThirdScene() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.tabBars.buttons["Favorites"].tap()
        
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element
        element.tap()
        element.swipeUp()
        element.swipeUp()
        element.swipeDown()
        
        let backbuttonButton = app.navigationBars["Homemade_V2.RecipeView"].buttons["backButton"]
        backbuttonButton.tap()
        
        let backbuttonButton2 = app.navigationBars["Homemade_V2.MealScene"].buttons["backButton"]
        backbuttonButton2.tap()
        backbuttonButton2.tap()
        element.tap()
        element.swipeDown()
        element.swipeUp()
        
    }
    func testFourthScene() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        let shoppingButton = tabBarsQuery.buttons["Shopping"]
        shoppingButton.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        element.tap()
        element.swipeUp()
        element.swipeUp()
        element.swipeUp()
        tabBarsQuery.buttons["Featured"].tap()
        
        let element2 = element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element2.tap()
        element2.swipeUp()
        element2.tap()
        shoppingButton.tap()
        element.swipeUp()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        element.tap()
        
    }
}
