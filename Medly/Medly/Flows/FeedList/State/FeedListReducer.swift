//
//  FeedListReducer.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import UIKit
import Foundation

func feedListReducer(state: inout FeedListState,
                     action: FeedListAction) {
    switch action {
    case .fetched(let feed):
        state = .feedFetched(feed)
    default: break
    }
}
