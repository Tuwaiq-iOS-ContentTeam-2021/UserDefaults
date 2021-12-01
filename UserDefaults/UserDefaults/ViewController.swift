//
//  ViewController.swift
//  UserDefaults
//
//  Created by Abdullah AlRashoudi on 11/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var fontSize: Int!
    
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var quoteslabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.integer(forKey: "fontSize") > 0 {
            updateSize(size: defaults.integer(forKey: "fontSize"))
        } else {
            fontSize = 20
            defaults.set(fontSize, forKey: "fontSize")
        }
        if defaults.bool(forKey: "state") == true {
            switchState(bool: true)
        } else {
            switchState(bool: false)
        }
    }
    
    func updateSize(size: Int) {
       fontSize = size
        quoteslabel.font = quoteslabel.font.withSize(CGFloat(fontSize))
        defaults.set(fontSize, forKey: "fontSize")
    }
    func switchState(bool: Bool) {
        if bool {
            defaults.set(true, forKey: "state")
            overrideUserInterfaceStyle = .dark
            switchOutlet.isOn = true
        } else {
            defaults.set(false, forKey: "state")
            overrideUserInterfaceStyle = .light
            switchOutlet.isOn = false
        }
        
    }
    @IBAction func bigSize(_ sender: Any) {
        updateSize(size: defaults.integer(forKey: "fontSize") + 3)
    }
    @IBAction func smallSize(_ sender: Any) {
        updateSize(size: defaults.integer(forKey: "fontSize") - 3)
    }
    @IBAction func switchAction(_ sender: UISwitch) {
        switchState(bool: sender.isOn)
    }
}

