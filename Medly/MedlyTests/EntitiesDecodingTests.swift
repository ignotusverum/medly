//
//  MedlyTests.swift
//  MedlyTests
//
//  Created by Vlad Z. on 3/30/21.
//

@testable import Medly
import XCTest

class EntitiesDecodingTests: XCTestCase {
    func canDecode<T: Decodable>(_ type: T.Type,
                                 decoder: JSONDecoder = JSONDecoder()) -> (Data) throws -> T {
        { try decoder.decode(T.self,
                             from: $0) }
    }

    func testDecoding() {
        let bundle = Bundle(for: EntitiesDecodingTests.self)
        let resources: [(String, (Data) throws -> Any)] = [
            ("countries", canDecode([Country].self))
        ]

        for (resource, canDecode) in resources {
            let path = bundle.path(forResource: resource, ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))

            XCTAssertNoThrow(try canDecode(data), "\(resource)")
        }
    }
}

