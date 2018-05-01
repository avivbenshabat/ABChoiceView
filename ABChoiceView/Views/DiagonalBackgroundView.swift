//
//  DiagonalBackgroundView.swift
//  ABChoiceView
//
//  Created by Aviv Ben Shabat on 22/04/2018.
//  Copyright © 2018 Aviv Ben Shabat. All rights reserved.
//

import UIKit

public class DiagonalBackgroundView: UIView {
    
    public struct Data {
        
        var lineWidth: CGFloat
        var spacing: CGFloat
        var lineColor: UIColor
        var backgroundColor: UIColor
        
        public init(lineWidth: CGFloat, spacing: CGFloat, lineColor: UIColor, backgroundColor: UIColor) {
            self.backgroundColor = backgroundColor
            self.lineColor = lineColor
            self.lineWidth = lineWidth
            self.spacing = spacing
        }
    }

    var data: Data! {
        didSet {
            backgroundColor = data.backgroundColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    init(data: Data) {
        super.init(frame: .zero)
        setup(data)
    }

    private func setup(_ data: Data? = nil) {
        self.data = data
    }
    
    override public func draw(_ rect: CGRect) {
        guard data.lineWidth > 0 else { return }
        let linesCount = Int(ceil(rect.width / (data.lineWidth))) + 10
        for i in 0...linesCount {
            let aPath = UIBezierPath()
            let startPoint = CGPoint(x: CGFloat(i) * (data.lineWidth * data.spacing), y: 0)
            aPath.move(to: startPoint)
            let endPoint = CGPoint(x: 0, y: CGFloat(i) * (data.lineWidth * data.spacing))
            aPath.addLine(to: endPoint)
            aPath.close()
            data.lineColor.set()
            aPath.lineWidth = data.lineWidth
            aPath.stroke()
            aPath.fill()
        }
    }
}
