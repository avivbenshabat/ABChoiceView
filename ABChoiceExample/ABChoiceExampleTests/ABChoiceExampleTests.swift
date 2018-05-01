//
//  ABChoiceExampleTests.swift
//  ABChoiceExampleTests
//
//  Created by Aviv Ben Shabat on 29/04/2018.
//  Copyright © 2018 Aviv Ben Shabat. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
@testable import ABChoiceView
@testable import ABChoiceExample

class ABChoiceExampleTests: QuickSpec {
    
    override func spec() {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ExampleViewController") as! ExampleViewController
        
        var choiceView: ChoiceView!
        
        describe("check basic functionality") {
            beforeEach {
                _ = viewController.view
                choiceView = viewController.choiceView
                choiceView.checked = false
                choiceView.maskWhenChecked = false
            }
            it("initial snapshot to be valid") {
                expect(choiceView) == snapshot("initial state")
            }
            
            testTap(choiceView, expectedCaption: "checked, no mask")
            
            it("view to add mask dynamically") {
                choiceView.maskWhenChecked = true
                expect(choiceView) == snapshot("checked, masked")
            }
            
            testTap(choiceView, expectedCaption: "initial state")
            
        }
    }
    
    func testTap(_ choiceView: ChoiceView, expectedCaption: String) {
        it("snapshot to be valid after tap") {
            beforeEach {
                choiceView.onClick()
            }
            if choiceView.checked {
                expect(choiceView) == snapshot(expectedCaption)
            }
            
        }
    }
    
}
