//
//  DisplayView.swift
//  Nathaniel_MyORDER
//
//  mastracn - 991367889
//  Nathaniel Mastracci
//
//  Created by user929441 on 9/30/21.
//

import Foundation
import SwiftUI

struct DisplayView: View {
    @State private var selectedIndex: Int = -1
    @State private var selection : Int? = nil
    @State var stepperValue: Int = 0
    @EnvironmentObject var coreDBHelper : CoreDBHelper
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            
            
            if (self.coreDBHelper.coffeeList.count > 0){
                List{
                    ForEach(self.coreDBHelper.coffeeList.enumerated().map({$0}), id: \.element.self) {indx, currentCoffee in
                        VStack(alignment: .leading){
                            Text("\(currentCoffee.type) - \(currentCoffee.size)")
//                            Text("\(currentCoffee.amount)")
                            Stepper("Quantity: \(currentCoffee.amount)", value: $stepperValue)
                        }
                    }//ForEach
                    .onDelete(perform: { indexSet in
                        for index in indexSet{
                            print(#function, "Coffee to delete : \(self.coreDBHelper.coffeeList[index].type)")
                            self.coreDBHelper.deleteCoffee(coffeeID: self.coreDBHelper.coffeeList[index].id!)
                            self.coreDBHelper.coffeeList.remove(at: index)
                        }
                    })//onDelete
                }//List
                
            } else {
                VStack{
                    Text("There are no coffee orders yet")
                }
            }
        }//ZStack
        .onAppear(){
            self.coreDBHelper.getAllCoffee()
        }
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
