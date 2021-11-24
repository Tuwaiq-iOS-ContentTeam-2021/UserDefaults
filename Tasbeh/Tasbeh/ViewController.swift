//
//  ViewController.swift
//  Tasbeh
//
//  Created by Rayan Taj on 24/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var minusButon: UIButton!
    
    @IBOutlet weak var tasbehaCounter: UILabel!
    let deafults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let count = deafults.integer(forKey: "count")
        
        tasbehaCounter.text = String(count)
        
        mainView.layer.cornerRadius = 100
        plusButton.layer.cornerRadius = 100
        minusButon.layer.cornerRadius = 100
        
        
    }

    @IBAction func addAction(_ sender: Any) {
        
        
        let tasbeha = Int(tasbehaCounter.text!)!
        
        deafults.set(tasbeha+1, forKey: "count")
        
        tasbehaCounter.text = String(tasbeha+1)
        
    }
    
    @IBAction func minusAction(_ sender: Any) {
        
        let tasbeha = Int(tasbehaCounter.text!)!
        
        deafults.set(tasbeha-1, forKey: "count")
        
        tasbehaCounter.text = String(tasbeha-1)
        
        
    }
}

