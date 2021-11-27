//
//  ViewController.swift
//  UserDefult
//
//  Created by Najla Talal on 11/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var save: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        save.addTarget(self, action: #selector(tabForSave), for: .touchUpInside)
        retriveInf()
    }
    @objc private func tabForSave() {
        //        UserDefaults.standard.set(name.text!, forKey: "Name" )
        //        UserDefaults.standard.set(userName.text!, forKey: "Username" )
        //        UserDefaults.standard.set(password.text!, forKey: "Password" )
        
        let model = User()
        model.id = "1"
        model.name = name.text!
        model.username = userName.text
        model.password = password.text
        UserDefaults.standard.set(try? PropertyListEncoder().encode(model), forKey: "User")
    }
    private func retriveInf() {
        //        let name =   UserDefaults.standard.string(forKey: "Name")
        //        let username = UserDefaults.standard.string(forKey: "Username")
        //        let password = UserDefaults.standard.string(forKey: "Password")
        //        print("Name = \(name!), Username = \(username!), Password = \(password!)")
        if let userData = UserDefaults.standard.value(forKey: "User")as? Data {
            let user = try? PropertyListDecoder().decode(User.self, from: userData)
            print("Name = \(user!.name!), Username = \(user!.username!), Password = \(user!.password!)")
        }
        
    }
}
class User: Codable {
    var id : String?
    var name : String?
    var username : String?
    var password : String?
}

