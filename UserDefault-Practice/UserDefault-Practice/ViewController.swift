//
//  ViewController.swift
//  UserDefault-Practice
//
//  Created by Wejdan Alkhaldi on 20/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var onoffswitch: UISwitch!
    @IBOutlet weak var onofflabel: UILabel!
    @IBOutlet weak var themesegment: UISegmentedControl!
    let userDefaults = UserDefaults.standard
    let ON_OFF_KEY = "onOffKey"
    let THEME_KEY = "themeKey"
    let Dark_THEME = "darkTheme"
    let Light_THEME = "lightTheme"
    let Blue_THEME = "blueTheme"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSwitchState()
        updateTheme()
        
    }
    func checkSwitchState()
    {
        if(userDefaults.bool(forKey: ON_OFF_KEY))
        {
            onoffswitch.setOn(true, animated: false)
            onofflabel.text = "ON"
        }
        else
        {
            onoffswitch.setOn(true, animated: false)
            onofflabel.text = "OFF"
        }
    }
    
    func updateTheme()
    {
        let theme = userDefaults.string(forKey: THEME_KEY)
        
        if(theme == Light_THEME)
        {
            themesegment.selectedSegmentIndex = 0
            view.backgroundColor = UIColor.white
        }
        else if(theme == Dark_THEME)
        {
            themesegment.selectedSegmentIndex = 1
            view.backgroundColor = UIColor.gray
        }
        
        else if(theme == Blue_THEME)
        {
            themesegment.selectedSegmentIndex = 2
            view.backgroundColor = UIColor.systemBlue
        }
        
        
    }
    
    @IBAction func switchchanged(_ sender: Any)
    {
        if(onoffswitch.isOn){
            userDefaults.set(true, forKey: ON_OFF_KEY)
            onofflabel.text = "ON"
        }
        else {
            userDefaults.set(true, forKey: ON_OFF_KEY)
            onofflabel.text = "OFF"
        }
    }
    @IBAction func onoffsegment(_ sender: Any)
    {
        switch themesegment.selectedSegmentIndex
        {
        case 0:
            userDefaults.set(Light_THEME, forKey: THEME_KEY)
        case 1:
            userDefaults.set(Dark_THEME, forKey: THEME_KEY)
        case 2:
            userDefaults.set(Blue_THEME, forKey: THEME_KEY)
        default:
            userDefaults.set(Light_THEME, forKey: THEME_KEY)
        }
        updateTheme()
    }
    
    
}


