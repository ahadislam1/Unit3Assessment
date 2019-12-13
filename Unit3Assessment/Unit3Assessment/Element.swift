//
//  ChemistryElement.swift
//  Unit3Assessment
//
//  Created by Ahad Islam on 12/12/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

struct Element: Codable {
    let name: String
    let symbol: String
    let number: Int
    let atomic_mass: Double
    let melt: Double?
    let boil: Double?
    let discovered_by: String?
    
    var elementNumberInString: String {
        return number / 100 == 0 ?
            (number / 10 == 0 ? "00\(number)" : "0\(number)") : "\(number)"
    }
}
