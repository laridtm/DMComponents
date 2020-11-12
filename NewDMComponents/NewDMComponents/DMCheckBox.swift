//
//  DMCheckBox.swift
//  NewDMComponents
//
//  Created by Larissa Diniz on 05/11/20.
//

import Foundation
import UIKit

protocol DMCheckBoxDelegate {
    func dmCheckBox(_ checkBox: DMCheckBox, didCheck isChecked: Bool)
}

class DMCheckBox: DMButton {
    var checkedView: UIImage?
    var uncheckedView: UIImage?
    var delegate: DMCheckBoxDelegate?
    
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
        self.checkedView = UIImage(named: "icCheckboxSelected2")
        self.uncheckedView = UIImage(named: "icCheckbox2")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonImage = isChecked == true ? checkedView : uncheckedView
        self.setImage(buttonImage, for: .normal)
    }

    @objc func onClick(sender: DMButton) {
        if sender == self {
            delegate?.dmCheckBox(self, didCheck: isChecked)
        }
    }
}
