//
//  ViewController.swift
//  UserDefaults
//
//  Created by mac on 22/11/2021.
//

import UIKit

class ViewController: UIViewController {
    let userd  = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
      
        print(userd.value(forKey: "darkModeEnabled"))
    }

    var check = 0
    @IBAction func buttonClicked(_ sender: Any) {
        
        if check == 0 {
            userd.set(true, forKey: "darkModeEnabled")
            overrideUserInterfaceStyle = .dark
            check = 1
        }else{
            userd.set(false, forKey: "darkModeEnabled")
            overrideUserInterfaceStyle = .light
            check = 0
        }
    }
    }
    


