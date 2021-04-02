//
//  FeedItemDetailView.swift
//  Medly
//
//  Created by Vlad Z. on 4/2/21.
//

import SwiftUI

struct FeedItemDetailView: View {
    let country: Country

    var body: some View {
        VStack {
            Text(country.name)
            Text(country.alpha2Code)
            Text(country.capital)
            Text("\(country.population)")
            ForEach(country.timezones,
                    id: \.self) { timezone in
                Text(timezone)
            }
        }
    }
}

