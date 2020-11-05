//
//  DMSelectCounter.swift
//  NewDMComponents
//
//  Created by Larissa Diniz on 05/11/20.
//

import Foundation
import UIKit

protocol DMSelectCounterDelegate {
    func onClickAdd(_ sender: DMSelectCounter)
    func onClickRemove(_ sender: DMSelectCounter)
}

class DMSelectCounter: UIView {
    var addButton: UIButton?
    var removeButton: UIButton?
    var labelQuantity: UILabel?
    var delegate: DMSelectCounterDelegate?
    
    var value: Int = 0 {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        labelQuantity?.text = "\(value)"
    }
    
    @objc func onClickAdd(sender: UIButton) {
        if sender == self.addButton {
            delegate?.onClickAdd(self)
        }
    }
    
    @objc func onClickRemove(sender: UIButton) {
        if sender == self.removeButton {
            delegate?.onClickRemove(self)
        }
    }
    
    func setup() {
        self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: 76, height: 36)
        
        removeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 8, height: 16))
        if let removeButton = removeButton {
            self.addSubview(removeButton)
            removeButton.translatesAutoresizingMaskIntoConstraints = false
            removeButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
            removeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60).isActive = true
            removeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            removeButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
            removeButton.setTitle("-", for: .normal)
            removeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            removeButton.setTitleColor(.red, for: .normal)
            self.removeButton?.addTarget(self, action: #selector(onClickRemove), for: UIControl.Event.touchUpInside)
        }
        
        addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 8, height: 16))
        if let addButton = addButton {
            self.addSubview(addButton)
            addButton.translatesAutoresizingMaskIntoConstraints = false
            addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
            addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60).isActive = true
            addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            addButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
            addButton.setTitle("+", for: .normal)
            addButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            addButton.setTitleColor(.red, for: .normal)
            self.addButton?.addTarget(self, action: #selector(onClickAdd), for: UIControl.Event.touchUpInside)
        }
        
        labelQuantity = UILabel(frame: CGRect(x: 0, y: 0, width: 8, height: 16))
        if let labelQuantity = labelQuantity {
            self.addSubview(labelQuantity)
            labelQuantity.translatesAutoresizingMaskIntoConstraints = false
            labelQuantity.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 34).isActive = true
            labelQuantity.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 34).isActive = true
            labelQuantity.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
            labelQuantity.heightAnchor.constraint(equalToConstant: 16).isActive = true
            labelQuantity.text = "0"
            labelQuantity.font = UIFont.systemFont(ofSize: 14)
            labelQuantity.textColor = .black
        }
    }
}
