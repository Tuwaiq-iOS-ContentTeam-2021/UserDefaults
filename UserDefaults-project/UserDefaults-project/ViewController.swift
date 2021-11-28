//
//  ViewController.swift
//  UserDefaults-project
//
//  Created by Badreah Saad on 28/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = defaults.string(forKey: "name")
        
        if value != nil {
            nameLabel.text = " اهلاً \(value!) شكرًا لتسجيلك معنا "
        } else {
            nameLabel.text = "الرجاء اكمال معلومات التسجيل"
        }
        
        
        if defaults.bool(forKey: "Switch") != false {
            changeSwitch(value: defaults.bool(forKey: "Switch") )
            
        } else {
            changeSwitch(value: false)
            print(defaults.bool(forKey: "Switch"))
        }
    }
    
    
    
    @IBAction func button(_ sender: Any) {
        
        let name = nameField.text
        nameLabel.text = " اهلاً \(name!) شكرًا لتسجيلك معنا "
        defaults.set(name, forKey: "name")
        
    }
    
    
    func changeSwitch(value : Bool) {
        
        if value {
            defaults.set(true, forKey: "Switch")
            overrideUserInterfaceStyle = .dark
            mySwitch.isOn = true
        } else {
            defaults.set(false, forKey: "Switch")
            overrideUserInterfaceStyle = .light
            mySwitch.isOn = false
        }
        
    }
    
    
    
    @IBAction func change(_ sender: UISwitch) {
        changeSwitch(value: sender.isOn)
    }
    
    
    
}

