//
//  ViewController.swift
//  DefuletUser
//
//  Created by Abrahim MOHAMMED on 26/11/2021.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    
    @IBOutlet weak var butonOut: UIButton!
    
    @IBOutlet weak var langugesOutlet: UILabel!
    
    @IBOutlet weak var loginLable: UILabel!
    
    @IBOutlet weak var SwitchOutlet: UISwitch!
    
    @IBOutlet weak var NameOutlet: UILabel!
    
    @IBOutlet weak var TextFiledOne: UITextField!
    
    @IBOutlet weak var pasworedOutlet: UILabel!
    
    @IBOutlet weak var TextFiledTwo: UITextField!
    
    @IBOutlet weak var lableForget: UILabel!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()



        if defaults.bool(forKey: "SwitchState") != false {
            defaults.bool(forKey: "SwitchState")
            
        } else {
            updateSwitch(value: false)
            print(defaults.bool(forKey: "SwitchState"))
        }




    }
    
    @IBAction func ccccc(_ sender: Any) {
        
        if applicationLanguage() == "ar"  {
                            setApplicationLanguage(languageCode: "en-US")
            
            NameOutlet.text = "الاسم"
            NameOutlet.textAlignment = .right
            TextFiledOne.placeholder = "ادخل الاسم"

            
            
            TextFiledOne.textAlignment = .right
            
            pasworedOutlet.text = "الرقم السري"
            
            pasworedOutlet.textAlignment = .right
            TextFiledTwo.placeholder = " ادخل الرقم السري"
            TextFiledTwo.textAlignment = .right
            lableForget.text = "نسيت اسم المستخدم او كلمه المرور؟"
            lableForget.textAlignment = .right
             
            butonOut.setTitle("الدخول", for: .normal)
            
            langugesOutlet.text = "English"
            langugesOutlet.textAlignment = .right
          
            
        
        }
        else if applicationLanguage() == "en"  {
                        setApplicationLanguage(languageCode: "ar")
            
            NameOutlet.text = "Name"
            NameOutlet.textAlignment = .left
            

            TextFiledOne.placeholder = "Enter Name"
            

            TextFiledOne.textAlignment = .left

            
            pasworedOutlet.text = "paswored"
            pasworedOutlet.textAlignment = .left

            TextFiledTwo.placeholder = "Enter paswored"
            TextFiledTwo.textAlignment = .left
            
            lableForget.text = "Forgot user name or passwored?"
            lableForget.textAlignment = .left
            
            
            langugesOutlet.text = "العربية"
            langugesOutlet.textAlignment = .left
            
            butonOut.setTitle("Login", for: .normal)

        
        }

        
        
    }
    
    
    @IBAction func isOnSwitch(_ sender: Any) {
       
        
        updateSwitch(value:SwitchOutlet.isOn)
      
    }
    
    
    
    
    
    

    func updateSwitch(value : Bool){
        if value {
            defaults.set(true, forKey: "SwitchState")
            overrideUserInterfaceStyle = .dark
            SwitchOutlet.isOn = true
        } else {
            defaults.set(false, forKey: "SwitchState")
            overrideUserInterfaceStyle = .light
            SwitchOutlet.isOn = false
        }
        
    }


   
    func applicationLanguage() -> String
        {
            let languages : NSArray = UserDefaults.standard.object(forKey: "AppleLanguages") as! NSArray
            let selectedLanguage : String = languages[0] as! String
            return selectedLanguage.components(separatedBy: "-").first!
        }

    func setApplicationLanguage(languageCode : String)
        {
            // Show Alert to restart the application. Present it in your view controller.



            UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

