//
//  Article.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import Foundation

struct Country: Codable, Hashable {
    let name: String
    let alpha2Code: String
    let capital: String

    var imageULR: URL {
        URL(string: "https://www.countryflags.io/\(alpha2Code)/flat/64.png")!
    }
}
