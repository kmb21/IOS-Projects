//
//  ViewController.swift
//  Light
//
//  Created by Maxwell Kumbong on 5/20/23.
//

import UIKit

class ViewController: UIViewController {
    var lightOn: Bool = true
    @IBOutlet weak var lightSwitch: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        if lightOn{
            view.backgroundColor = .white

        }else{
            view.backgroundColor = .black

        }
    }
    
    @IBAction func switchPressed(_ sender: Any) {
        lightOn.toggle()
        
        updateUI()
    }
    
}

