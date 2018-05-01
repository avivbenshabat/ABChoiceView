//
//  DashBorderView.swift
//  ABChoiceView
//
//  Created by Aviv on 18/04/2018.
//  Copyright © 2018 Aviv Ben Shabat. All rights reserved.
//

import UIKit

public class DashBorderView: UIView {
    
    var dashLength: CGFloat = 4
    var dashSpace: CGFloat = 2
    
    var dashColor: UIColor = .black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var continuous = false {
        didSet {
            if oldValue != continuous {
                setNeedsDisplay()
            }
        }
    }
    
    // MARK: Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = .white
    }
    
    // MARK: Base Overrides
    
    open override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(self.dashColor.cgColor)
        
        // top line
        var nextDashFrame = CGRect(x: 0, y: 0, width: dashLength, height: 1)
        while nextDashFrame.origin.x < rect.size.width {
            context.fill(nextDashFrame)
            nextDashFrame.origin.x += continuous ? dashLength : dashLength + dashSpace
        }
        
        // right line
        nextDashFrame = CGRect(x: rect.size.width - 1, y: 0, width: 1, height: dashLength)
        while nextDashFrame.origin.y < rect.size.height {
            context.fill(nextDashFrame)
            nextDashFrame.origin.y += continuous ? dashLength : dashLength + dashSpace
        }
        
        // bottom line
        nextDashFrame = CGRect(x: 0, y: rect.size.height - 1, width: dashLength, height: 1)
        while nextDashFrame.origin.x < rect.size.width {
            context.fill(nextDashFrame)
            nextDashFrame.origin.x += continuous ? dashLength : dashLength + dashSpace
        }
        
        // left line
        nextDashFrame = CGRect(x: 0, y: 0, width: 1, height: dashLength)
        while nextDashFrame.origin.y < rect.size.height {
            context.fill(nextDashFrame)
            nextDashFrame.origin.y += continuous ? dashLength : dashLength + dashSpace
        }
    }
}
