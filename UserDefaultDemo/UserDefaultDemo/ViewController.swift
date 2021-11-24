//
//  ViewController.swift
//  UserDefaultDemo
//
//  Created by Ebtesam Alahmari on 22/11/2021.
//

import UIKit


class ViewController: UIViewController {
    
    var UserDef = UserDefaults.standard
    
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblMode: UILabel!
    @IBOutlet weak var language: UISwitch!
    @IBOutlet weak var mode: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        language.isOn = UserDef.bool(forKey: "Language")
        mode.isOn = UserDef.bool(forKey: "Mode")
        updateLanguage(value: language.isOn)
        updateMode(value: mode.isOn )
    }
    
    
    @IBAction func changeLanguage(_ sender: UISwitch) {
        updateLanguage(value: sender.isOn)
    }
    
    
    @IBAction func changeMode(_ sender: UISwitch) {
        updateMode(value: sender.isOn)
    }
    
    func updateLanguage (value : Bool) {
        if value {
            UserDef.set(value, forKey: "Language")
            lblLanguage.text =  "عربي"
        }else{
            UserDef.set(value, forKey: "Language")
            lblLanguage.text = "English"
        }
        textTranslate()
    }
    
    func updateMode (value : Bool) {
        if value {
            UserDef.set(value, forKey: "Mode")
            overrideUserInterfaceStyle = .dark
        }else{
            UserDef.set(value, forKey: "Mode")
            overrideUserInterfaceStyle = .light
        }
        textTranslate()
    }
    
    func textTranslate() {
        if mode.isOn && language.isOn {
            lblMode.text =  "الوضع الليلي"
        }else if mode.isOn && !language.isOn {
            lblMode.text = "Dark mode"
        }else if !mode.isOn && language.isOn {
            lblMode.text = "الوضع النهاري"
        }else{
            lblMode.text = "Light mode"
        }
    }
    
}

