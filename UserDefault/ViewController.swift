//
//  ViewController.swift
//  UserDefault
//
//  Created by Nora on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    var mode = false

    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var switchMode: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if defaults.bool(forKey: "State") != false {
            updateMode(true)
        } else {
            print(defaults.bool(forKey: "State"))
            updateMode(false)
        }
    }

    @IBAction func switchModeDarkLight(_ sender: UISwitch) {
        updateMode(sender.isOn)
    }
    
    
    func updateMode(_ mode : Bool){
        
//        self.mode.toggle()
        
        if mode {
            defaults.set(true, forKey: "State")
            overrideUserInterfaceStyle = .dark
            switchMode.isOn = true
        } else {
            defaults.set(false, forKey: "State")
            overrideUserInterfaceStyle = .light
            switchMode.isOn = false
        }
        
    }
    
    
}

