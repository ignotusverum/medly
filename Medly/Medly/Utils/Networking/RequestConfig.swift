//
//  RequestConfig.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
}

public protocol FrameAPIRequest {
    var configure: RequestConfig { get }
}

public struct RequestConfig {
    public var method: HTTPMethod
    public var path: String?
    public var queryParams: [String: String]

    public init(method: HTTPMethod,
                path: String? = nil,
                queryParams: [String: String]) {
        self.method = method
        self.path = path
        self.queryParams = queryParams
    }
}
