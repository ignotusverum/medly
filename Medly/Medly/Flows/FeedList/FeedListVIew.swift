//
//  FeedListView.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import SwiftUI
import Combine

struct FeedListView: View {
    let reload: Command
    let countries: [Country]

    @State var isFilteringByFaves: Bool = false

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                Color
                    .clear
                    .padding(.top, 10)

                LazyVStack {
                    ForEach(countries,
                            id: \.self) { row in
                        CountryCard(country: row)
                    }
                }
                                    .padding(.horizontal)
                .animation(.default)

                Color
                    .clear
                    .padding(.bottom,
                             60)
            }
        }
        .background(Color.backgroundColor)
        .padding(.top, 1)
        .onAppear(perform: {
            reload()
        })
    }
}

struct FeedListViewConnector: Connector {
    @EnvironmentObject var store: AppStore

    func map() -> some View {
        var countries: [Country] = []
        switch store.state.feedFlowState {
        case let .feedFetched(fetchedCountries):
            countries = fetchedCountries
        default: break
        }

        return FeedListView(reload: store.bind(.feedListFlow(action: .reload)),
                            countries: countries)
    }
}
