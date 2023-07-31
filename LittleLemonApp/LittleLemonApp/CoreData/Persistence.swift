//
//  Persistence.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//

import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ExampleDatabase")
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    func clear() {
        // Delete all dishes from the store
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try container.viewContext.execute(deleteRequest)
        } catch {
            print("Error deleting dishes: \(error)")
        }
    }

    static func oneDish() -> Dish {
        let dish = Dish(context: shared.container.viewContext)
        dish.title = "Greek Salad"
        dish.descriptionDish = "The famous Greek salad of crispy lettuce, peppers, olives, and feta cheese."
        dish.price = "10"
        dish.category = "starters"
        dish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
        return dish
    }
}
