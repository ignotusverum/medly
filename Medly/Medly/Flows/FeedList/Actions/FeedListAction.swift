//
//  FeedListAction.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import Foundation

enum FeedListAction {
    case reload
    case fetched([Country])
    
    case error(Error)
}
