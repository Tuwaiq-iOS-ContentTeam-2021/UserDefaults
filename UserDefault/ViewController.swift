//
//  ViewController.swift
//  UserDefault
//
//  Created by Lola M on 11/24/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaults.standard.integer(forKey: "Age"))
    }

    @IBAction func btn(_ sender: Any) {
        UserDefaults.standard.set(20, forKey: "Age")
    }
    
    @IBAction func btn2(_ sender: Any) {
        UserDefaults.standard.set(0, forKey: "Age")
    }
    
}

