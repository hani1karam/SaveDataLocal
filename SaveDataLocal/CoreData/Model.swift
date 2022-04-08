//
//  Model.swift
//  SaveDataLocal
//
//  Created by hany karam on 4/8/22.
//

import Foundation
extension DataUser{
    func convertToTodo() -> RecipeItemModel {
        RecipeItemModel(
            id:id,
            name: name)
    }
}
