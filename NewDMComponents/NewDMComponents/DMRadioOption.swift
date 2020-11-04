//
//  DMRadioOption.swift
//  NewDMComponents
//
//  Created by Larissa Diniz on 04/11/20.
//

import Foundation
import UIKit

protocol DMRadioOptionDelegate {
    func onClick(_ sender: DMButton)
}

class DMRadioOption: DMButton {
    var checkedView: UIView?
    var uncheckedView: UIView?
    var delegate: DMRadioOptionDelegate?
    
    var isChecked: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func setup() {
        super.setup()
        self.addTarget(self, action: #selector(onClick), for: UIControl.Event.touchUpInside)
        self.checkedView = UIImageView(image: UIImage(named: "icRadioSelected"))
        self.uncheckedView = UIImageView(image: UIImage(named: "icRadio"))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        checkedView?.removeFromSuperview()
        uncheckedView?.removeFromSuperview()
        removeConstraints(self.constraints)
        
        let view = isChecked == true ? checkedView : uncheckedView
        if let view = view {
            addSubview(view)
        }
    }

    @objc func onClick(sender: DMButton) {
        if sender == self {
            delegate?.onClick(self)
        }
    }
}
