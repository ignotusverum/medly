//
//  MedlyApp.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import SwiftUI

@main
struct MedlyApp: App {
    let store = AppStore(initial: AppState(),
                         middlewares: MiddlewareFactory.allMiddlewares) { state, action in
        debugPrint("[DEBUG] - Reduce\t\t\t", action)
        AppReducer.reduce(state: &state, action: action)
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                Color
                    .backgroundColor
                    .blur(radius: 20)
                    .edgesIgnoringSafeArea(.all)

                RootView(store: store)
            }
        }
    }
}
