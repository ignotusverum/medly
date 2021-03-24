//
//  ArticleCard.swift
//  Medly
//
//  Created by Vlad Z. on 3/23/21.
//

import SwiftUI

struct CountryCard: View {
    let country: Country

    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(Font.body.weight(.bold))

                Text(country.capital)
                    .font(Font.caption.weight(.medium))
                    .foregroundColor(Color.gray)
                    .padding(.top,
                             2)
            }

            Spacer()

            AsyncImage(
                url: country.imageULR,
                placeholder: { Text("...") },
                image: { Image(uiImage: $0).resizable() }
            )
            .frame(width: 60,
                   height: 60)
            .cornerRadius(15)
        }
        .padding(.horizontal, 20)
        .padding(.vertical)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.surfaceColor.opacity(0.4),
                        radius: 1,
                        x: 0,
                        y: 1)
        )
    }
}
