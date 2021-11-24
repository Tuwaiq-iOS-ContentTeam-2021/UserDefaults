//
//  ViewController.swift
//  Day22
//
//  Created by nouf on 22/11/2021.
// user Defalt

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitchOutlet: UISwitch!
    let defaults = UserDefaults.standard
     
//

    //       var darkMode = false

       @IBAction func darkModeSwitch(_ sender: UISwitch) {
//           defaults.set( sender.isOn , forKey: "darkModeSwitchAct")
           updetMode(value: sender.isOn)
     
       }


    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     let darkModeSwitchIsOn = defaults.bool(forKey: "darkModeSwitchAct")
      
        updetMode(value: darkModeSwitchIsOn)
   


    
}

    func updetMode(value:Bool){
        if value {
            defaults.set( value , forKey: "darkModeSwitchAct")
            darkModeSwitchOutlet.isOn = true
            overrideUserInterfaceStyle = .dark
            darkModeLabel.text = "Dark Mode"
            darkModeLabel.textColor = .white
        } else {
            defaults.set( value , forKey: "darkModeSwitchAct")
            darkModeSwitchOutlet.isOn = false
            overrideUserInterfaceStyle = .light
            darkModeLabel.text = "Light Mode"
            darkModeLabel.textColor = .black
        }
    }
    
    

}
