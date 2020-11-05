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

    func dmRadioOption(_ radioOption: DMRadioOption, didCheck isChecked: Bool) {
        [radioButton1, radioButton2].forEach { $0.isChecked = false }
        radioOption.isChecked = !isChecked
    }
    
    func dmCheckBox(_ checkBox: DMCheckBox, didCheck isChecked: Bool) {
        checkBox.isChecked = !isChecked
    }
    
    func dmSelectAdd(_ selectCounter: DMSelectCounter) {
        selectCounter.value += 1
    }
    
    func dmSelectRemove(_ selectCounter: DMSelectCounter) {
        if selectCounter.value > 0 {
            selectCounter.value -= 1
        }
    }
}

