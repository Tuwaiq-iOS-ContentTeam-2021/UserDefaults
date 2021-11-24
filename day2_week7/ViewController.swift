//
//  ViewController.swift
//  day2_week7
//
//  Created by AlDanah Aldohayan on 22/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    

    @IBOutlet weak var darkModes: UISwitch!
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        appearenceFunction(value: sender.isOn)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if defaults.bool(forKey: "state") != false {
            appearenceFunction(value: defaults.bool(forKey: "state") )
            
        } else {
            appearenceFunction(value: false)
            print(defaults.bool(forKey: "state"))
        }
        
    }

    func appearenceFunction(value: Bool){
        if value {
            defaults.set(true, forKey: "state")
            overrideUserInterfaceStyle = .dark
            darkModes.isOn = true
        } else {
            defaults.set(false, forKey: "state")
            overrideUserInterfaceStyle = .light
            darkModes.isOn = false
        }
    }
    
    
}

