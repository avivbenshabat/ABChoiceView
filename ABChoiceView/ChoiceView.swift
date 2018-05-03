//
//  ABChoiceView.swift
//  ABChoiceView
//
//  Created by Aviv Ben Shabat on 22/04/2018.
//  Copyright © 2018 Aviv Ben Shabat. All rights reserved.
//

import UIKit

@IBDesignable
open class ChoiceView: UIView {

    let defaultCoverBackgroundData = DiagonalBackgroundView.Data(lineWidth: 2.0, spacing: 4.0, lineColor: UIColor(hexString: "9b9ea0", alpha: 0.4), backgroundColor: UIColor(hexString: "eaeae6", alpha: 0.6))

    // MARK: Views
    
    @IBOutlet var contentView: DashBorderView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var checkImageView: UIImageView!
    @IBOutlet var labelToImageConstraint: NSLayoutConstraint!
    @IBOutlet var labelHeightConstraint: NSLayoutConstraint!
    
    var diagonalMaskView: DiagonalBackgroundView?
    
    // MARK: Inspectable properties
    
    @IBInspectable open var image: UIImage? {
        didSet {
            self.imageView.image = image
            setNeedsUpdateConstraints()
        }
    }
    
    @IBInspectable open var checkImage: UIImage? {
        willSet {
            if let newImage = newValue {
                self.checkImageView.image = newImage
            } else {
                let bundle = Bundle(for: ChoiceView.self)
                self.checkImageView.image = UIImage(named: "check", in: bundle, compatibleWith: nil)
            }
        }
    }
    
    @IBInspectable open var text: String? {
        set {
            self.label.text = newValue
            setNeedsUpdateConstraints()
        }
        get {
            return self.label.text
        }
    }
    
    @IBInspectable open var maskWhenChecked: Bool = false {
        didSet {
            if maskData == nil {
                maskData = defaultCoverBackgroundData
            }
            setNeedsLayout()
        }
    }
    
    @IBInspectable open var checked: Bool = false {
        didSet {
            if borderPolicy == .dashedWhenUnchecked {
                self.contentView.continuous = checked
            }
            self.checkImageView.isHidden = !checked
            setNeedsLayout()
        }
    }
    
    // MARK: Properties
    
    open var font: UIFont? {
        set {
            self.label.font = newValue
        }
        get {
            return self.label.font
        }
    }
    
    open var borderPolicy: BorderPolicy = .dashedWhenUnchecked {
        willSet {
            self.contentView.continuous = newValue == .noDashes || newValue == .dashedWhenUnchecked && self.checked
        }
    }
    
    open var maskData: DiagonalBackgroundView.Data? {
        set {
            guard let data = newValue else { return }
            if let maskView = diagonalMaskView {
                maskView.data = data
            } else {
                diagonalMaskView = DiagonalBackgroundView(data: data)
            }
        }
        get {
            return diagonalMaskView?.data
        }
    }
    
    // MARK: Init & Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let nibName = String(describing: type(of: self))
        contentView = loadView(fromNib: nibName) as! DashBorderView
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    open override func updateConstraints() {
        let hasText = text != nil && text!.isNotEmpty
        let hasImage = image != nil
        labelToImageConstraint.isActive = hasText && hasImage
        labelHeightConstraint.isActive = hasImage
        super.updateConstraints()
    }
    
    open override func layoutSubviews() {
        if let maskView = diagonalMaskView {
            if maskWhenChecked && checked {
                maskView.frame = contentView.bounds
                contentView.insertSubview(maskView, belowSubview: label)
            } else {
                maskView.removeFromSuperview()
            }
        }
        super.layoutSubviews()
    }
    
    @IBAction func onClick() {
        self.checked = !self.checked
    }
}