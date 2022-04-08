//
//  SQLVC.swift
//  SaveDataLocal
//
//  Created by hany karam on 4/8/22.
//

import UIKit

class SQLVC: UIViewController {
    var db:OpaquePointer?
    var dataBaseManager = DataBaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = dataBaseManager.openDatabase()
        dataBaseManager.createTable(db: db)
        dataBaseManager.insert(id: 1, name: "hany", db: db)
    }
    
    @IBAction func get(_ sender: Any) {
        dataBaseManager.query(db: db)
        print(dataBaseManager.query(db: db))
    }
    
    
}
