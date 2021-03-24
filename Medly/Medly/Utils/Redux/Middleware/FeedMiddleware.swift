//
//  FeedMiddleware.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import Foundation
import Combine

class FeedMiddleware: MiddlewareProcessing {
    class func handler() -> Middleware<AppState, AppAction> {
        return { state, action, dispatch in
            switch action {
            case let .feedListFlow(action):
                switch action {
                case .reload:
                    fetchFeed(dispatch: dispatch)
                default: break
                }
            }
        }
    }

    private class func fetchFeed(dispatch: @escaping Dispatcher<AppAction>) {
        CountryAdapter
            .fetch()
            .sink{ completion in
                switch completion {
                case .failure(let error):
                    dispatch(.feedListFlow(action: .error(error)))
                default: break
                }
            } receiveValue: { feed in
                dispatch(.feedListFlow(action: .fetched(feed)))
            }
            .store(in: &MiddlewareFactory.cancellables)
    }
}
