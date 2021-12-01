//
//  ViewController.swift
//  userDefault
//
//  Created by Um Talal 2030 on 27/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    let userDF = UserDefaults.standard
    func userD() {
        userDF.set("Mona Lisa", forKey: "name")
        userDF.set(25, forKey: "age")
        userDF.set(true, forKey: "wifiON")
        userDF.set(Date(), forKey: "lastseen")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func saveUD(_ sender: Any) {
        let  inputValue = inputField.text
       if let valueExist = inputValue{
            userDF.set(inputValue, forKey: "city")
           print(userDF.dictionaryRepresentation())
       }else{
           print("The value does not exist")
       }
    }
    
    
    @IBAction func retrieveUD(_ sender: Any) {
        let retrieveData = userDF.object(forKey: "city")
        if let bringData = retrieveData as? String {
            myLabel.text = bringData
            return
        }
    }
    
    
    @IBAction func deleteUD(_ sender: Any) {
        userDF.removeObject(forKey: "city")
    }
    
}

