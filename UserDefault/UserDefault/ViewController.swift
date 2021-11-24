//
//  ViewController.swift
//  UserDefault
//
//  Created by Ahmad MacBook on 22/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.bool(forKey: "mode") == true {
            overrideUserInterfaceStyle = .dark

        }else{
            overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func switchMode(_ sender: Any) {
        
        
        if switchOutlet.isOn  == true {
            
            overrideUserInterfaceStyle = .dark
            defaults.setValue(true, forKey: "mode")
            
        }else{
            
            overrideUserInterfaceStyle = .light
            defaults.setValue(false, forKey: "mode")
            
        }
    }
}


