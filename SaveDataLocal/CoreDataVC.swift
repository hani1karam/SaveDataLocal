//
//  CoreDataVC.swift
//  SaveDataLocal
//
//  Created by hany karam on 4/8/22.
//

import UIKit

class CoreDataVC: UIViewController {
    var dataManager: DatabaseManagerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager = DatabaseManager()
        dataManager?.addFavoritesItem(item: RecipeItemModel(id: "1",name: "Hany"))
    }
    
    @IBAction func getData(_ sender: Any) {
        print(dataManager?.fetchFavoritesListList()[0].name ?? "")
    }
    
}
