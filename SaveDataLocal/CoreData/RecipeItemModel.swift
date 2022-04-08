//
//  RecipeItemModel.swift
//  SaveDataLocal
//
//  Created by hany karam on 4/8/22.
//

import Foundation
struct RecipeItemModel : Codable {
    let id : String?
    let name : String?
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }
}

