//
//  UI10DMComponentsTests.swift
//  NewDMComponents
//
//  Created by Larissa Diniz on 06/11/20.
//

import XCTest

class UI10DMComponentsTests: XCTestCase {
    let app = XCUIApplication()
    let defaultTimeout = 20
    
    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    override func tearDown() {
        
    }
    
    func test01OnlyOneRadioOptionIsSelected() {
        XCTAssertEqual(app.buttons["radio1"].label, "icRadio")
        XCTAssertEqual(app.buttons["radio2"].label, "icRadio")
        
        app.buttons["radio1"].tap()
        XCTAssertEqual(app.buttons["radio1"].label, "icRadioSelected")
        XCTAssertEqual(app.buttons["radio2"].label, "icRadio")
        
        app.buttons["radio2"].tap()
        XCTAssertEqual(app.buttons["radio1"].label, "icRadio")
        XCTAssertEqual(app.buttons["radio2"].label, "icRadioSelected")
    }
    
    func test02CheckBoxActions() {
        XCTAssertEqual(app.buttons["check1"].label, "icCheckbox")
        XCTAssertEqual(app.buttons["check2"].label, "icCheckbox")
        
        app.buttons["check1"].tap()
        XCTAssertEqual(app.buttons["check1"].label, "icCheckboxSelected")
        XCTAssertEqual(app.buttons["check2"].label, "icCheckbox")
        
        app.buttons["check2"].tap()
        XCTAssertEqual(app.buttons["check1"].label, "icCheckboxSelected")
        XCTAssertEqual(app.buttons["check2"].label, "icCheckboxSelected")
        
        app.buttons["check1"].tap()
        app.buttons["check2"].tap()
        XCTAssertEqual(app.buttons["check1"].label, "icCheckbox")
        XCTAssertEqual(app.buttons["check2"].label, "icCheckbox")
    }
    
    func test03SelectCounterActions() {
        
    }
}
