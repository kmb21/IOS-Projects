//
//  ViewController.swift
//  Sales Tax Calculator
//
//  Created by Maxwell Kumbong on 6/4/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var afterTaxPrice: UITextField!
    var beforeTaxPrice: Float = 0.0
    var taxRate: Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }

    @IBAction func beforeTax(_ sender: UITextField) {
        if let amount = Float(sender.text!){
            beforeTaxPrice = amount
        }else{
            beforeTaxPrice = 0.0
        }
    }
    
    @IBAction func givenTaxRate(_ sender: UITextField) {
        if let rate = Float(sender.text!){
            taxRate = rate
        }else{
            taxRate = 0.0
        }
    }
    @IBAction func calculateTaxButtonPressed(_ sender: UIButton) {
        let finalprice = beforeTaxPrice + beforeTaxPrice*(taxRate/100)
        afterTaxPrice.text = "$" + String(finalprice)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

