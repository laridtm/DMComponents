//
//  DMRadioOption.swift
//  NewDMComponents
//
//  Created by Larissa Diniz on 04/11/20.
//

import Foundation
import UIKit

protocol DMRadioOptionDelegate {
    func dmRadioOption(_ radioOption: DMRadioOption, didCheck isChecked: Bool)
}

class DMRadioOption: DMButton {
    var checkedView: UIImage?
    var uncheckedView: UIImage?
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
        self.checkedView = UIImage(named: "icRadioSelected")
        self.uncheckedView = UIImage(named: "icRadio")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonImage = isChecked == true ? checkedView : uncheckedView
        self.setImage(buttonImage, for: .normal)
    }

    @objc func onClick(sender: DMButton) {
        if sender == self {
            delegate?.dmRadioOption(self, didCheck: isChecked)
        }
    }
}
