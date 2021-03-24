//
//  AppReducer.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import Foundation

class AppReducer {
    class func reduce(state: inout AppState,
                      action: AppAction) {
        switch(action) {
        case let .feedListFlow(action):
            feedListReducer(state: &state.feedFlowState,
                            action: action)
        }
    }
}
