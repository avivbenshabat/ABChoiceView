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

extension ABChoiceView {
    
    func reset() {
        self.image = UIImage(named: "apple")
        self.text = "Apple"
        self.checked = false
        self.checkImage = nil
        self.maskWhenChecked = false
        self.borderPolicy = .dashedWhenUnchecked
        self.font = UIFont.systemFont(ofSize: 20.0, weight: .light)
    }
    
}

class ABChoiceExampleTests: QuickSpec {
    
    let record = false
    
    override func spec() {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "ExampleViewController") as! ExampleViewController
        
        var choiceView: ABChoiceView!
        
        beforeEach {
            _ = viewController.view  // calls viewDidLoad()
            choiceView = viewController.choiceView
            choiceView.reset()
        }
        
        describe("unchecked view") {
            
            context("initial state") {
                it("apple dashed border") {
                    expect(choiceView) == self.capture()
                }
            }
            
            context("image and text change") {
                it("shark dashed border") {
                    choiceView.image = #imageLiteral(resourceName: "shark")
                    choiceView.text = "Shark"
                    expect(choiceView) == self.capture()
                }
            }
            
            context("add mask and change check icon") {
                it("apple dashed border") { // Changes should not affect view because it's unchecked
                    choiceView.maskWhenChecked = true
                    choiceView.checkImage = #imageLiteral(resourceName: "check_x.png")
                    expect(choiceView) == self.capture()
                }
            }
            
            context("change border and change font") {
                it("no dashes large text") {
                    choiceView.borderPolicy = .noDashes
                    choiceView.font = UIFont(name: "Courier", size: 30.0)
                    expect(choiceView) == self.capture()
                }
            }
            
            context("remove image") {
                it("apple no image centered text") {
                    choiceView.image = nil
                    expect(choiceView) == self.capture()
                }
            }
            
            context("remove text") {
                it("apple no text large image") {
                    choiceView.text = nil
                    expect(choiceView) == self.capture()
                }
            }
            
            context("remove text and change image") {
                it("shark no text large image") {
                    choiceView.text = nil
                    choiceView.image = #imageLiteral(resourceName: "shark")
                    expect(choiceView) == self.capture()
                }
            }
            
        }
        
        describe("checked view apple") {
            
            beforeEach {
                choiceView.checked = true
            }
            
            context("initial state") {
                it("undashed check icon") {
                    expect(choiceView) == self.capture()
                }
            }
            
            context("add mask") {
                it("undashed with mask") {
                    choiceView.maskWhenChecked = true
                    expect(choiceView) == self.capture()
                }
            }
            
            context("change check icon") {
                it("undashed with x check icon") {
                    choiceView.checkImage = #imageLiteral(resourceName: "check_x")
                    expect(choiceView) == self.capture()
                }
            }
            
            context("change border") {
                it("dashed") {
                    choiceView.borderPolicy = .alwaysDashed
                    expect(choiceView) == self.capture()
                }
            }
            
            context("change mask data") {
                it("masked with purple-yellow") {
                    choiceView.maskWhenChecked = true
                    let lineColor = UIColor(hexString: "#7647A2", alpha: 0.8)
                    let backgroundColor = UIColor(hexString: "#FFF402", alpha: 0.4)
                    choiceView.maskData = DiagonalBackgroundView.Data(lineWidth: 8.0, spacing: 4.0, lineColor: lineColor, backgroundColor: backgroundColor)
                    expect(choiceView) == self.capture()
                }
            }
            
        }
    }
    
    func capture() -> Snapshot {
        if record {
            return recordSnapshot()
        }
        return snapshot()
    }
}

