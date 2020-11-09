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
        for counter in 0...10 {
            XCTAssertTrue(app.otherElements["counter1"].staticTexts["\(counter)"].exists)
            app.otherElements["counter1"].buttons["addButton"].forceTap()
        }
        
        for counter in (0...11).reversed() {
            XCTAssertTrue(app.otherElements["counter1"].staticTexts["\(counter)"].exists)
            app.otherElements["counter1"].buttons["removeButton"].forceTap()
        }
        
        app.otherElements["counter1"].buttons["removeButton"].forceTap()
        XCTAssertFalse(app.otherElements["counter1"].staticTexts["-1"].exists)
    }
}

extension XCUIElement {
    func forceTap() {
        if self.isHittable {
            self.tap()
        } else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
            coordinate.tap()
        }
    }
}
