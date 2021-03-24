//
//  MiddlewareFactory.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import Foundation
import Combine

protocol MiddlewareProcessing {
    static func handler() -> Middleware<AppState, AppAction>
}

class MiddlewareFactory {
    static var cancellables = Set<AnyCancellable>()
    static var allMiddlewares: [Middleware<AppState, AppAction>] {
        return [
            FeedMiddleware.handler()
        ]
    }
}
