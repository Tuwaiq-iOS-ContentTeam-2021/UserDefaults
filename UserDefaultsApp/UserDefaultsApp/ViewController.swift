//
//  ViewController.swift
//  UserDefaultsApp
//
//  Created by Mola on 24/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var number = 0
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "\(UserDefaults.standard.integer(forKey: "plus"))"
    }
    
    @IBAction func plusButton(_ sender: Any) {
        if Int(counterLabel.text!)! > number{
            number = Int(counterLabel.text!)!
            number += 1
            UserDefaults.standard.set(number, forKey: "plus")
            counterLabel.text = "\(UserDefaults.standard.integer(forKey: "plus"))"
        } else{
            number += 1
            UserDefaults.standard.set(number, forKey: "plus")
            counterLabel.text = "\(UserDefaults.standard.integer(forKey: "plus"))"
        }
    }
    
@IBAction func resetButton(_ sender: Any) {
        number = 0
        UserDefaults.standard.removeObject(forKey: "plus")
        counterLabel.text = "0"
    }
    
}

