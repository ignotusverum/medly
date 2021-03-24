//
//  CountryAdapter.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import Combine
import Foundation

public class CountryAdapter: NetworkingAdapter {
    public var settings: AdapterConfig = .init(base: "restcountries.eu",
                                               name: "rest/v2/all")

    private static var adapter: CountryAdapter = CountryAdapter()

    static func fetch()-> AnyPublisher<[Country], Error> {
        let config = Requests
            .fetch
            .configure

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return adapter
            .request(config)
            .decode(type: [Country].self,
                    decoder: decoder)
            .eraseToAnyPublisher()
    }
}

private extension CountryAdapter {
    enum Requests: FrameAPIRequest {
        case fetch

        public var configure: RequestConfig {
            switch self {
            case .fetch:
                return RequestConfig(method: .get)
            }
        }
    }
}
