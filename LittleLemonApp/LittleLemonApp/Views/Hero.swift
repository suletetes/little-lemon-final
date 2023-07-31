//
//  Hero.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//

import SwiftUI

struct Hero: View {

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("hero-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()

            VStack(alignment: .leading, spacing: 5) {
                Text("Little Lemon")
                        .foregroundColor(.primaryColor2)
                        .font(.displayFont())
                Text("Chicago")
                        .foregroundColor(.white)
                        .font(.subTitleFont())
                Text("We are a family-owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .foregroundColor(.white)
                        .font(.leadText())
            }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.primaryColor1)
        }
                .frame(maxHeight: 240)
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
    }
}
