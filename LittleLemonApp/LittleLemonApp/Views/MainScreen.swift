//
//  MainScreen.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//

import SwiftUI

struct MainScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject private var viewModel: DishesModel // Add the DishesModel as an environment object

    var body: some View {
        NavigationStack {
            VStack {
                Header()
                Menu()
            }
                    .onAppear {
                        viewModel.reload(viewContext) // Call the reload function from the DishesModel on appearance
                    }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .environmentObject(DishesModel()) // Provide a DishesModel as an environment object for previews
    }
}
