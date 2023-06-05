//
//  ViewController.swift
//  Controls
//
//  Created by Maxwell Kumbong on 6/4/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dummyField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        dummyField.delegate = self
        // Do any additional setup after loading the view.
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = dummyField.text{
            print(text)
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        print("Button was clicked")
    }

    @IBAction func brightness(_ sender: UISlider) {
        print(sender.value)
    }
    @IBAction func keyboardTypedText(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
        
    }
    @IBAction func lightSwitch(_ sender: UISwitch) {
        if sender.isOn{
            view.backgroundColor = .white
        }else{
            view.backgroundColor = .black
        }

    }
}


