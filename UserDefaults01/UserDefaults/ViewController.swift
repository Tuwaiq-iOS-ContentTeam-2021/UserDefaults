//
//  ViewController.swift
//  UserDefaults
//
//  Created by Abdullah Alnutayfi on 26/11/2021.
//

import UIKit

class ViewController: UIViewController {
    var userDefault = UserDefaults.standard
    var toBeSaved = 0
    var darkmood = false
    
    var landscape : [NSLayoutConstraint]?
    var portrait : [NSLayoutConstraint]?
    var isPortrait = false

    lazy var lable : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textAlignment = .left
        $0.text = "Enter the temperature in rankine"
        return $0
    }(UILabel())
    lazy var unitsSegment : UISegmentedControl = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(segmentedValue), for: .valueChanged)
        $0.selectedSegmentIndex = toBeSaved
        return $0
    }(UISegmentedControl(items: ["Fahrenheit","Celsius","Kelvin"]))
    
    lazy var temperature : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.borderStyle = .roundedRect
        $0.keyboardType = .decimalPad
        $0.placeholder = "Enter the temperature"
        return $0
    }(UITextField())
    
    lazy var convert : UIButton = {
        $0.setBackgroundImage(UIImage(named: "convert-3217"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(convertBtnClick), for: .touchDown)
        $0.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    return $0
    }(UIButton(type: .system))
    
    lazy var result : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        $0.textAlignment = .center
        $0.text = "0.0"
        return $0
    }(UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchedIndex = UserDefaults.standard.integer(forKey: "c")
        unitsSegment.selectedSegmentIndex = fetchedIndex
        print(fetchedIndex)
        view.backgroundColor = UIColor.systemGray5
        uiSettings()
      
    }

    func uiSettings(){
        [lable,unitsSegment, temperature,convert,result].forEach{view.addSubview($0)}
    
        portrait = [
            lable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            lable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            lable.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            
            unitsSegment.topAnchor.constraint(equalTo: lable.bottomAnchor,constant: 20),
            unitsSegment.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            unitsSegment.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            temperature.topAnchor.constraint(equalTo: unitsSegment.bottomAnchor,constant: 20),
            temperature.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            temperature.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
           
            convert.topAnchor.constraint(equalTo: temperature.bottomAnchor,constant: 50),
            convert.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 100),
            convert.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100),
            
            result.topAnchor.constraint(equalTo: convert.bottomAnchor,constant: 50),
            result.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            result.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
        ]
     
        landscape = [
            lable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            lable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            lable.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            
            unitsSegment.topAnchor.constraint(equalTo: lable.bottomAnchor,constant: 20),
            unitsSegment.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            unitsSegment.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            temperature.topAnchor.constraint(equalTo: unitsSegment.bottomAnchor,constant: 20),
            temperature.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            temperature.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
           
            convert.topAnchor.constraint(equalTo: temperature.bottomAnchor,constant: 20),
            convert.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            convert.widthAnchor.constraint(equalToConstant: 200),
            
            
            result.leadingAnchor.constraint(equalTo: convert.trailingAnchor,constant: 10),
            result.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            result.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20)
           
        ]
        
      
    }
    override func viewDidLayoutSubviews() {
        isPortrait = UIDevice.current.orientation.isPortrait
        if isPortrait{
            NSLayoutConstraint.deactivate(landscape!)
            NSLayoutConstraint.activate(portrait!)
        }else{
            NSLayoutConstraint.deactivate(portrait!)
            NSLayoutConstraint.activate(landscape!)
        }
    }
    @objc func segmentedValue(_ sender:UISegmentedControl!)
     {
         if sender.selectedSegmentIndex == 0 {
             UserDefaults.standard.set(0, forKey: "c")
         }
         if sender.selectedSegmentIndex == 1 {
             UserDefaults.standard.set(1, forKey: "c")
         }
         if sender.selectedSegmentIndex == 2 {
             UserDefaults.standard.set(2, forKey: "c")
         }
        toBeSaved = sender.selectedSegmentIndex
        print("index \(UserDefaults.standard.integer(forKey: "c")) has saved")
     }
    
    @objc func convertBtnClick(_ sender : UIButton){
        guard  let inputText = Double(temperature.text!) else{return}
       
        var calculation = 0.0
       
        if toBeSaved == 0 {
            calculation = inputText + 459.67
            print(calculation.rounded())
            result.text = String(calculation.rounded())
           
        }else if toBeSaved == 1{
            calculation = (inputText - 491.67) * 5/9
            print(calculation)
            result.text = String(calculation.rounded())

        }
        else if toBeSaved == 2{
            calculation = inputText * 1.8
            print(calculation)
            result.text = String(calculation.rounded())

        }
        
    }
 
}
