//
//  ViewController.swift
//  NewDMComponents
//
//  Created by Larissa Diniz on 04/11/20.
//

import UIKit

class ViewController: UIViewController, DMRadioOptionDelegate {
    @IBOutlet weak var radioButton: DMRadioOption!
    @IBOutlet weak var radioButton2: DMRadioOption!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioButton.delegate = self
        radioButton2.delegate = self
    }

    func onClick(_ sender: DMButton) {
        guard let currentRadioButton = sender as? DMRadioOption else {
            return
        }
        [radioButton, radioButton2].forEach { $0.isChecked = false }
        currentRadioButton.isChecked = !currentRadioButton.isChecked
    }
}

