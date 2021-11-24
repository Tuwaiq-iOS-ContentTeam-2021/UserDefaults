//
//  ViewController.swift
//  test 6
//
//  Created by Abdullah AlRashoudi on 11/22/21.
//

import UIKit

class ViewController: UIViewController {
    var defaults = UserDefaults.standard
    @IBOutlet weak var switchMode: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let displayMode = defaults.bool(forKey: "displayMode")
        
        if displayMode {
            overrideUserInterfaceStyle = .dark
            switchMode.setOn(true, animated: true)
            
            
        }
        else {
            overrideUserInterfaceStyle = .light
            switchMode.setOn(false, animated: true)
            
        }
    }


    @IBAction func darkButton(_ sender: Any) {
        
        overrideUserInterfaceStyle = .dark
        
    }
    
    @IBAction func switchStyle(_ sender: Any) {
    
        if switchMode.isOn {
            defaults.set(true, forKey: "displayMode")
            overrideUserInterfaceStyle = .dark
        } else {
            defaults.set(false, forKey: "displayMode")
            overrideUserInterfaceStyle = .light
    }
}
}

