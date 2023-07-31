//
//  FoodItem.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//


import SwiftUI

struct FoodItem: View {

    let dish: Dish

    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Text(dish.title ?? "")
                        .font(.sectionCategories())
                        .foregroundColor(.black)

                Text(dish.descriptionDish ?? "")
                        .font(.paragraphText())
                        .foregroundColor(.primaryColor1)
                        .lineLimit(2)

                Text("$" + (dish.price ?? ""))
                        .font(.highlightText())
                        .foregroundColor(.primaryColor1)
                        .monospaced()
            }
                    .frame(maxWidth: .infinity, alignment: .leading)

            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
                    .frame(width: 90, height: 90)
                    .clipShape(Rectangle())
        }
                .padding(.vertical)
                .frame(maxHeight: 150)
    }
}

struct FoodItem_Previews: PreviewProvider {
    static var previews: some View {
        FoodItem(dish: PersistenceController.oneDish())
    }
}
