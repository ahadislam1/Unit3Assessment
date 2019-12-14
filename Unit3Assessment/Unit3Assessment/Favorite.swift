//
//  Favorite.swift
//  Unit3Assessment
//
//  Created by Ahad Islam on 12/12/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

struct Favorite: Codable {
    let id: String?
    let favoritedBy: String
    let elementName: String
    let elementSymbol: String
    
    init(id: String? = nil, favoritedBy: String, elementName: String, elementSymbol: String) {
        self.id = id
        self.favoritedBy = favoritedBy
        self.elementName = elementName
        self.elementSymbol = elementSymbol
    }
}
