
import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    var conter : Int!

    var switchState = "switchState"
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.integer(forKey: "conter") >= 0{
            updateCounter(defaults.integer(forKey: "conter"))
        } else {
            print(defaults.integer(forKey: "conter"))
            conter = 1
            defaults.set(conter, forKey: "conter")
        }
        
        
        
        if defaults.bool(forKey: switchState) != false {
            updateSwitch(value: defaults.bool(forKey: switchState) )
            
        } else {
            updateSwitch(value: false)
        }
        
    }
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        updateSwitch(value: sender.isOn)
    }
    
    func updateSwitch(value : Bool){
        
        if value {
            defaults.set(true, forKey: switchState)
            overrideUserInterfaceStyle = .dark
            darkModeSwitch.isOn = true
        } else {
            defaults.set(false, forKey: switchState)
            overrideUserInterfaceStyle = .light
            darkModeSwitch.isOn = false
        }
        
    }
    
    @IBAction func counterIncrement(_ sender: Any) {
        updateCounter(defaults.integer(forKey: "conter") + 1)
    }
    
    func updateCounter(_ newValue : Int){
        if newValue >= 0 {
        conter = newValue
        labelText.text = String(conter)
        defaults.set(conter, forKey: "conter")
        }
    }
    
    @IBAction func counterDecrement(_ sender: Any) {
        updateCounter(  defaults.integer(forKey: "conter") - 1)
    }
    
}

