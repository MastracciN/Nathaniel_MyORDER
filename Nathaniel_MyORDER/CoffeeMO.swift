//
//  CoffeeMO.swift
//  Nathaniel_MyORDER
//
//  Created by user929441 on 10/26/21.
//

import Foundation
import CoreData

@objc(CoffeeMO)
final class CoffeeMO: NSManagedObject{
    @NSManaged var id: UUID?
    @NSManaged var type: String
    @NSManaged var size: String
    @NSManaged var amount: String
    @NSManaged var date: Date
}

extension CoffeeMO{
    func convertToCoffee() -> Coffee{
        Coffee(cID: id ?? UUID(), cType: type, cSize: size, cAmount: amount)
    }
}
