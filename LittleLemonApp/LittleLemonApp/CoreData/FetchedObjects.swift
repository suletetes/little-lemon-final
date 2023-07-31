
//
//  FetchedObjects.swift
//  LittleLemonAppFinal
//
//  Created by suleabdul on 31.07.2023.
//



import CoreData
import Foundation
import SwiftUI

struct FetchedObjects<T, Content>: View where T: NSManagedObject, Content: View {

  let content: ([T]) -> Content

  @FetchRequest var results: FetchedResults<T>

  init(
          predicate: NSPredicate = NSPredicate(value: true),
          sortDescriptors: [NSSortDescriptor] = [],
          @ViewBuilder content: @escaping ([T]) -> Content
  ) {
    self.content = content
    self._results = FetchRequest(
            entity: T.entity(),
            sortDescriptors: sortDescriptors,
            predicate: predicate
    )
  }

  var body: some View {
    self.content(Array(results))
  }
}
