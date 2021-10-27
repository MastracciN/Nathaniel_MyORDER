//
//  OrderView.swift
//  Nathaniel_MyORDER
//
//  mastracn - 991367889
//  Nathaniel Mastracci
//
//  Created by user929441 on 9/30/21.
//

import SwiftUI

struct OrderView: View {
    
    var coffeeTypes = ["Dark Roast", "Original Blend", "Vanilla"]
    var sizes = ["Small", "Medium", "Large"]
    @State private var selectedType = "Dark Roast"
    @State private var selectedSize = "Small"
    @State private var amount = ""
    @EnvironmentObject var coreDBHelper : CoreDBHelper
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Picker("Coffee Type", selection: $selectedType){
                        ForEach(coffeeTypes, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Form{
                    Picker("Size", selection: $selectedSize){
                        ForEach(sizes, id: \.self) {
                            Text($0)
                        }
                    }
                }.pickerStyle(SegmentedPickerStyle())
                HStack{
                    Text("Amount").padding()
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2)
                        ).padding(10)
                }
                
                Button(action: {
                    self.addNewCoffee()
                }){
                    Text("Add Coffee")
                }
                
            }//VStack
            
            .navigationBarTitle("Coffee Order", displayMode: .automatic)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    NavigationLink("Orders", destination: DisplayView())
                }//ToolbarItemGroup
            }//toolbar
        }//NavigationView
        .onAppear(){
            self.coreDBHelper.getAllCoffee()
        }
    }//View
    
    private func addNewCoffee(){
        self.coreDBHelper.insertTask(coffee: Coffee(cType: self.selectedType, cSize: self.selectedSize, cAmount: self.amount))
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
