//
//  Home.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//


import SwiftUI

struct Home: View {
    @StateObject private var viewModel = DishesModel()

    var body: some View {
        NavigationView {
            MainScreen()
                    .navigationBarBackButtonHidden()
                    .environmentObject(viewModel)
        }
                .onAppear {
                    viewModel.reload(PersistenceController.shared.container.viewContext)
                }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
