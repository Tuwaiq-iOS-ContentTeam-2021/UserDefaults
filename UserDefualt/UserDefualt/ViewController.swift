//
//  ViewController.swift
//  UserDefualt
//
//  Created by Taraf Bin suhaim on 21/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        let value = UserDefaults.standard.string(forKey: "name")
        if value != nil {
            name.text = value
        } else {
            name.text = ""
        }
    }
    
    @IBAction func saveName(_ sender: Any) {
        name.text = nameText.text
        UserDefaults.standard.set(nameText.text, forKey: "name")
    }
}

