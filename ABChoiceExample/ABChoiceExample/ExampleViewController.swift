//
//  ViewController.swift
//  ABChoiceExample
//
//  Created by Aviv Ben Shabat on 29/04/2018.
//  Copyright © 2018 Aviv Ben Shabat. All rights reserved.
//

import UIKit
import ABChoiceView

class ExampleViewController: UIViewController {

    @IBOutlet var choiceView: ABChoiceView!
    
    var currentState: State = .apple
    
    enum State: String {
        case apple = "apple", shark = "shark"
    }
    
    @IBAction func toggleMask(_ sender: UIButton) {
        choiceView.maskWhenChecked = !choiceView.maskWhenChecked
    }
    
    @IBAction func switchImageAndText(_ sender: UIButton) {
        if currentState == .apple {
            choiceView.image = UIImage(named: "shark")
            choiceView.text = "Shark"
            currentState = .shark
        } else {
            choiceView.image = UIImage(named: "apple")
            choiceView.text = "Apple"
            currentState = .apple
        }
    }
    
    @IBAction func changeFont(_ sender: UIButton) {
        let systemFont = sender.tag == 0
        choiceView.font = systemFont ? UIFont(name: "Courier", size: 30.0) : UIFont.systemFont(ofSize: 20.0, weight: .light)
        sender.tag = systemFont ? 1 : 0
    }
    
    @IBAction func changeCheckIcon(_ sender: UIButton) {
        let defaultIcon = sender.tag == 0
        choiceView.checkImage = defaultIcon ? UIImage(named: "check_x") : nil
        sender.tag = defaultIcon ? 1 : 0
    }
    
    @IBAction func removeImage(_ sender: UIButton) {
        choiceView.image = nil
    }
    
    @IBAction func removeText(_ sender: UIButton) {
        choiceView.text = nil
    }
    
    @IBAction func changeBorder(_ sender: UIButton) {
        switch choiceView.borderPolicy {
        case .alwaysDashed:
            choiceView.borderPolicy = .dashedWhenUnchecked
        case .dashedWhenUnchecked:
            choiceView.borderPolicy = .noDashes
        case .noDashes:
            choiceView.borderPolicy = .alwaysDashed
        }
        sender.setTitle("Change Border (Now - \(choiceView.borderPolicy.rawValue))", for: .normal)
    }
    
    @IBAction func changeMaskData(_ sender: UIButton) {
        let defaultMask = sender.tag == 0
        choiceView.maskWhenChecked = true
        if defaultMask {
            choiceView.maskData = DiagonalBackgroundView.Data(lineWidth: 8.0, spacing: 4.0, lineColor: UIColor(hexString: "#868686", alpha: 0.7), backgroundColor: UIColor(hexString: "#C8C8C8", alpha: 0.5))
        } else {
            choiceView.maskData = ABChoiceView.defaultCoverBackgroundData
        }
        sender.tag = defaultMask ? 1 : 0
    }
}

