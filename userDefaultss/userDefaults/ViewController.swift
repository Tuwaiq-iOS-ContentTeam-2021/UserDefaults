//
//  ViewController.swift
//  userDefaults
//
//  Created by TAGHREED on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var theme: UISegmentedControl!
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var onOfLable: UILabel!
    @IBOutlet weak var textArea: UITextView!
    
    @IBOutlet weak var imagee: UIImageView!
    let onOfKey = "onOfKey"
    let userDefaults = UserDefaults.standard
    let themeKey = "themeKey"
    let darkk = "dark"
    let lightt = "light"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkSwitch()
        updateTheme()
    }

    func checkSwitch(){
        if (userDefaults.bool(forKey: onOfKey)){
            onOffSwitch.setOn(true, animated: false)
            onOfLable.text = "ON"
        }else{
            onOffSwitch.setOn(false, animated: false)
            onOfLable.text = "OFF"
        }
    }
    func updateTheme(){
        let themee = userDefaults.string(forKey: themeKey)
        if (themee == lightt){
            theme.selectedSegmentIndex = 0
            view.backgroundColor = UIColor.gray
            textArea.backgroundColor = UIColor.gray
            textArea.textColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        }
        else if  (themee == darkk){
            theme.selectedSegmentIndex = 1
            view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            textArea.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
            textArea.textColor = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
        
        }
        
    }
    
    
    @IBAction func themeAction(_ sender: Any) {
        
        if theme.selectedSegmentIndex == 1 {
            userDefaults.set(darkk, forKey: themeKey)
        }else{
            userDefaults.set(lightt, forKey: themeKey)
        }
        updateTheme()
        
    }
    @IBAction func switchAction(_ sender: Any) {
        
        
        if (onOffSwitch.isOn){
            userDefaults.set(true, forKey: onOfKey)
            onOfLable.text = "ON"
        }else{
            userDefaults.set(false, forKey: onOfKey)
            onOfLable.text = "OFF"
        }
        
        
    }
    
    
}

