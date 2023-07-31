//
//  MenuList.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//


import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]

    enum CodingKeys: String, CodingKey {
        case menu
    }

    static func getMenuData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()

        guard let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json") else {
            print("Invalid URL")
            return
        }

        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let fullMenu = try decoder.decode(MenuList.self, from: data)
                    for dish in fullMenu.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.price = dish.price
                        newDish.descriptionDish = dish.descriptionDish
                        newDish.image = URL(string: dish.image) // Convert image string to URL
                        newDish.category = dish.category
                    }
                    try viewContext.save()
                } catch {
                    print("Error decoding menu data: \(error)")
                }
            } else if let error = error {
                print("Error fetching menu data: \(error)")
            }
        }
        dataTask.resume()
    }
}
