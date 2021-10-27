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
    @EnvironmentObject var coreDBHelper : CoreDBHelper
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            VStack(alignment: .leading){
                Text("hello world")
            }
        }
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
