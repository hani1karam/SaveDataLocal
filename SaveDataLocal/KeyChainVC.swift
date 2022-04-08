//
//  KeyChainVC.swift
//  SaveDataLocal
//
//  Created by hany karam on 4/8/22.
//

import UIKit
import KeychainSwift

class KeyChainVC: UIViewController {
    @IBOutlet weak var textField: UITextField!
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func setData(_ sender: Any) {
        keychain.set(textField.text ?? "", forKey: "email")
    }
    
    @IBAction func getData(_ sender: Any) {
        keychain.get("email")
        print(keychain.get("email") ?? "")
    }
}
