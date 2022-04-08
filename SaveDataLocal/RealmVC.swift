//
//  RealmVC.swift
//  SaveDataLocal
//
//  Created by hany karam on 4/9/22.
//

import UIKit
import RealmSwift
class RealmVC: UIViewController {
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        save()
    }
    func save(){
        let person = Person()
        person.email = "hany"
        realm.beginWrite()
        realm.add(person)
        try! realm.commitWrite()
        
    }
    
    @IBAction func getData(_ sender: Any) {
        let pepole = realm.objects(Person.self)
        for person in pepole {
            let email = person.email
            print(email)
        }
        
    }
}
class Person:Object{
    @objc dynamic var email:String = ""
}
