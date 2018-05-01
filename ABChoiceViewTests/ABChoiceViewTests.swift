//
//  ABChoiceViewTests.swift
//  ABChoiceViewTests
//
//  Created by Aviv on 28/04/2018.
//  Copyright © 2018 Aviv Ben Shabat. All rights reserved.
//

import Quick
import Nimble
@testable import ABChoiceView

class ABChoiceViewTests: QuickSpec {
    
    override func spec() {
        describe("ABChoiceView") {
            it("works") {
                let view = ChoiceView(frame: .zero)
                expect(true).to(beTrue())
            }
        }
    }
    
    
}
