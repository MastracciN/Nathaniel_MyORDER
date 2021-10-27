//
//  CoffeeOrder.swift
//  Nathaniel_MyORDER
//
//  mastracn - 991367889
//  Nathaniel Mastracci
//
//  Created by user929441 on 9/30/21.
//

import Foundation

class CoffeeOrder: ObservableObject, Identifiable{
    @Published var orderList = [Coffee]()
    
    init(){
        
    }
    
    func add(coffee: Coffee){
        orderList.append(coffee)
    }
    
}
