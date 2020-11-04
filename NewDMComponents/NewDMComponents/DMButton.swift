//
//  DMButton.swift
//  NewDMComponents
//
//  Created by Larissa Diniz on 04/11/20.
//

import UIKit

/// A default buttons with rounded corners and text size 16. Customize the colors to use.
@IBDesignable
public class DMButton: UIButton {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override public func prepareForInterfaceBuilder() {
        setup()
    }

    func setup() {
        layer.cornerRadius = 6
        layer.masksToBounds = true
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
}
