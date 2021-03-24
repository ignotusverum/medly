//
//  JSONDecoder.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import Foundation

extension JSONDecoder {
    static var iso8601SnakeCaseDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
