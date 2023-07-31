//
//  Header.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//


import SwiftUI

struct Header: View {
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)

    var body: some View {
        ZStack {
            Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 60)
                    .padding(.bottom)

            HStack {
                Spacer()
                if isLoggedIn {
                    NavigationLink(destination: UserProfile()) {
                        Image("profile-image-placeholder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 50)
                                .clipShape(Circle())
                                .padding(.trailing)
                    }
                }
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
