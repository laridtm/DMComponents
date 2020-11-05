//
//  ViewController.swift
//  NewDMComponents
//
//  Created by Larissa Diniz on 04/11/20.
//

import UIKit

class ViewController: UIViewController, DMRadioOptionDelegate, DMCheckBoxDelegate, DMSelectCounterDelegate {
    @IBOutlet weak var radioButton1: DMRadioOption!
    @IBOutlet weak var radioButton2: DMRadioOption!
    @IBOutlet weak var checkBox1: DMCheckBox!
    @IBOutlet weak var checkBox2: DMCheckBox!
    @IBOutlet weak var checkBox3: DMCheckBox!
    @IBOutlet weak var checkBox4: DMCheckBox!
    @IBOutlet weak var selectCounter1: DMSelectCounter!
    @IBOutlet weak var selectCounter2: DMSelectCounter!
    @IBOutlet weak var selectCounter3: DMSelectCounter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioButton1.delegate = self
        radioButton2.delegate = self
        checkBox1.delegate = self
        checkBox2.delegate = self
        checkBox3.delegate = self
        checkBox4.delegate = self
        selectCounter1.delegate = self
        selectCounter2.delegate = self
        selectCounter3.delegate = self
    }

    func onClickRadio(_ sender: DMButton) {
        guard let currentRadioButton = sender as? DMRadioOption else {
            return
        }
        [radioButton1, radioButton2].forEach { $0.isChecked = false }
        currentRadioButton.isChecked = !currentRadioButton.isChecked
    }
    
    func onClickCheck(_ sender: DMButton) {
        guard let currentCheckBox = sender as? DMCheckBox else {
            return
        }
        currentCheckBox.isChecked = !currentCheckBox.isChecked
    }
    
    func onClickAdd(_ sender: DMSelectCounter) {
        sender.value += 1
    }
    
    func onClickRemove(_ sender: DMSelectCounter) {
        if sender.value > 0 {
            sender.value -= 1
        }
    }
}

