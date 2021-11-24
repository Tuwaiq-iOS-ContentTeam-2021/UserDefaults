//
//  ViewController.swift
//  UserDefaults
//
//  Created by loujain on 24/11/2021.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    var fontSize: Int!
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.integer(forKey: "fontSize") > 0 {
            updateFonSize(newSize: defaults.integer(forKey: "fontSize"))
        }else{
            fontSize = 30
            defaults.set(fontSize, forKey: "fontSize")
        }
        if defaults.bool(forKey: "switchState") == true {
            updateSwitch(value: defaults.bool(forKey: "switchState"))
        }else{
            updateSwitch(value: false)
        }
    }
    func updateFonSize(newSize:Int){
        fontSize = newSize
        labelText.font = labelText.font.withSize(CGFloat(fontSize))
        defaults.set(fontSize, forKey: "fontSize")
    }
    
    func updateSwitch(value: Bool){
        
        if value {
            defaults.set(true, forKey: "switchState")
            overrideUserInterfaceStyle = .dark
            darkModeSwitch.isOn = true
        }else{
            defaults.set(false, forKey: "switchState")
            overrideUserInterfaceStyle = .light
            darkModeSwitch.isOn = false
        }
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        updateSwitch(value: sender.isOn)
    }
    
    
    @IBAction func smallFontt(_ sender: Any) {
        updateFonSize(newSize: defaults.integer(forKey: "fontSize") - 5)
    }
   
    
    @IBAction func bigFontt(_ sender: Any) {
        updateFonSize(newSize: defaults.integer(forKey: "fontSize") + 5)

    }
   
}

