//
//  DetailItem.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//

import SwiftUI

struct DetailItem: View {

    let dish: Dish

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                    image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                        .frame(minHeight: 150)

                Text(dish.title ?? "")
                        .font(.subTitleFont())
                        .foregroundColor(.primaryColor1)

                Text(dish.descriptionDish ?? "")
                        .font(.regularText())

                Text("$" + (dish.price ?? ""))
                        .font(.highlightText())
                        .foregroundColor(.primaryColor1)
                        .monospaced()
            }
                    .padding()
        }
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
    }
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        DetailItem(dish: PersistenceController.oneDish())
    }
}

