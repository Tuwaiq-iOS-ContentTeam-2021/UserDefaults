//
//  ViewController.swift
//  UserDefaults
//
//  Created by Sahab Alharbi on 24/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
        @IBOutlet weak var text: UITextField!
        @IBOutlet weak var textLabel: UILabel!
        @IBOutlet weak var show: UIButton!
        let defaults = UserDefaults.standard
        
        override func viewDidLoad() {
            super.viewDidLoad()
            let myValue = UserDefaults.standard.string(forKey: "myTextData")
         
            // Do any additional setup after loading the view.
            if myValue != nil {
                textLabel.text = myValue
            } else {
                textLabel.text = "Your Text here"
            }
            
            
        }

        
        @IBAction func j(_ sender: Any) {
            textLabel.text = text.text
            UserDefaults.standard.set(text.text, forKey: "myTextData")
        }
        

    }



