//
//  FeedListState.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import Foundation

enum FeedListState {
    case initial
    case feedFetched([Country])

    init() { self = .initial }
}
