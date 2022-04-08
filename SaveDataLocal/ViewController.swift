//
//  ViewController.swift
//  SaveDataLocal
//
//  Created by hany karam on 4/8/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setData(_ sender: Any) {
        defaults.setValue(textField.text, forKey: "email")
    }
    @IBAction func getData(_ sender: Any) {
        defaults.value(forKey: "email")
        print(defaults.value(forKey: "email") ?? "")
    }
    
}

