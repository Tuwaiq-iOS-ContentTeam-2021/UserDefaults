//
//  ViewController.swift
//  UserDefault
//
//  Created by Ghada Fahad on 21/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    var fontSize : Int = 0
    
    @IBOutlet weak var darMood: UISwitch!
    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if defaults.integer(forKey: "fontSize") > 0 {
            updateTextSize(newsize: defaults.integer(forKey: "fontSize"))
        } else {
            fontSize = 30
            defaults.set(fontSize, forKey: "fontSize")
        }
        if defaults.bool(forKey: "switchState") == true {
            updateSwitch(value: defaults.bool(forKey: "switchState"))
        } else {
            updateSwitch(value: false)
        }

    }
    func updateTextSize(newsize: Int){
        fontSize = newsize
        labelText.font = labelText.font.withSize(CGFloat(fontSize))
        defaults.set(fontSize, forKey: "fontSize")
    }
    func updateSwitch(value : Bool){
        if value {
            defaults.set(true, forKey: "switchState")
            overrideUserInterfaceStyle = .dark
            darMood.isOn = true
        }else {
            defaults.set(false, forKey: "switchState")
            overrideUserInterfaceStyle = .light
            darMood.isOn = false

        }
    }
    @IBAction func bigFont(_ sender: Any) {
        updateTextSize(newsize: defaults.integer(forKey: "fontSize") + 5)
    }
    
    @IBAction func smallFont(_ sender: Any) {
        updateTextSize(newsize: defaults.integer(forKey: "fontSize") - 5)

    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        updateSwitch(value: sender.isOn)

    }
    
}

