//
//  ViewController.swift
//  UserDefaultTest
//
//  Created by dev on 22/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var arrQuotes: [String] = ["Do all the good you can, for all the people you can, in all the ways you can, as long as you can","Don’t limit yourself. Many people limit themselves to what they think they can do. You can go as far as your mind lets you. What you believe, remember, you can achieve","Keep smiling, because life is a beautiful thing and there’s so much to smile about","Your time is limited, so don’t waste it living someone else’s life. Don’t be trapped by dogma – which is living with the results of other people’s thinking", "Many of life’s failures are people who did not realize how close they were to success when they gave up", "In three words I can sum up everything I've learned about life: it goes on"]
    let defaults = UserDefaults.standard
    var flag = false
    
    @IBOutlet weak var changeThemeOutlet: UIButton!
    @IBOutlet weak var reloadOutlet: UIButton!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeThemeOutlet.layer.cornerRadius = 25
        reloadOutlet.layer.cornerRadius = 25
        //flag
        flag = UserDefaults.standard.bool(forKey: "colorStyle")
        if flag {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light

        }
        textView.text = UserDefaults.standard.string(forKey: "quotes")
        //1. check the dafult
        //2. present it
        
    }
    func linkedList() {
        var firstElemnt = ""
        firstElemnt = arrQuotes.first!
        arrQuotes.remove(at: 0)
        arrQuotes.append(firstElemnt)
    }
    
    
    @IBAction func reloadAction(_ sender: Any) {
        flag.toggle()
        UserDefaults.standard.set(flag,forKey: "colorStyle")
        if flag {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
 
        
//        UserDefaults.standard.set(textView.text,forKey: "quotes")
        
    }
    
    @IBAction func action(_ sender: Any) {
        

        textView.text = arrQuotes.first
        
        linkedList()
        
        //1. clicked
        //2. toggle (Value)
        
        //3. save
        //4. change background
        
    }

}
