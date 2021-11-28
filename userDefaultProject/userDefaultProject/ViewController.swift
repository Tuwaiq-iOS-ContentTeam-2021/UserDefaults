//
//  ViewController.swift
//  userDefaultProject
//
//  Created by Areej on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var onoffLable: UILabel!
    @IBOutlet weak var onoffswitch: UISwitch!
    
    
    let userDefault = UserDefaults.standard
    let OnOffKey = "ONOFF"
    let themKey = "themKey"
    let lightThem = "lightThem"
    let darkThem = "darkThem"
    let blueThem = "blueThem"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkSwitch()
        ubdateThem()
        
    }
    func checkSwitch(){
        if userDefault.bool(forKey: OnOffKey){
            onoffswitch.setOn(true, animated: false)
            onoffLable.text = "ON"
        }
        else{
            
            onoffswitch.setOn(false, animated: false)
            onoffLable.text = "OFF"
        }
        
    }
    func ubdateThem(){
        let theme = userDefault.string(forKey: themKey)
        if theme == lightThem{
            segmentOutlet.selectedSegmentIndex = 0
            view.backgroundColor = #colorLiteral(red: 0.9991679788, green: 1, blue: 0.8606068492, alpha: 1)
        }
       else if theme == darkThem{
            segmentOutlet.selectedSegmentIndex = 1
            view.backgroundColor = #colorLiteral(red: 0.7987757325, green: 0.7987757325, blue: 0.7987757325, alpha: 1)
        }
      else  if theme == blueThem{
            segmentOutlet.selectedSegmentIndex = 2
            view.backgroundColor =  #colorLiteral(red: 0.6714983582, green: 0.9016216397, blue: 0.9282807708, alpha: 1)
        }
    }
    
    @IBAction func minusAction(_ sender: Any) {
    }
    
    @IBAction func plusAction(_ sender: Any) {
    }
    
    @IBAction func onoffSwitchAction(_ sender: Any) {
        if onoffswitch.isOn{
            
             userDefault.set(true, forKey: OnOffKey)
                onoffLable.text = "ON"
        }
            else {
                userDefault.set(false, forKey: OnOffKey)
                onoffLable.text = "OFF"
            }
        }
    
    
    @IBAction func segment(_ sender: Any) {
        switch segmentOutlet.selectedSegmentIndex {
        case 0:
            userDefault.set(lightThem, forKey: themKey)
        case 1:
            userDefault.set(darkThem, forKey: themKey)
        case 2:
            userDefault.set(blueThem, forKey: themKey)
        default:
            userDefault.set(blueThem, forKey: themKey)
        }
        ubdateThem()
    }
    
}

