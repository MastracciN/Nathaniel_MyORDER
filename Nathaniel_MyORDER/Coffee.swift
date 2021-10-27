//
//  Coffee.swift
//  Nathaniel_MyORDER
//
//  mastracn - 991367889
//  Nathaniel Mastracci
//
//  Created by user929441 on 9/30/21.
//

import Foundation
import SwiftUI

struct Coffee: Identifiable, Hashable{
    var id = UUID()
    var cType: String = ""
    var cSize: String = ""
    var cAmount: String = ""
    
    init() {
    }
    
    init(cType: String, cSize: String, cAmount: String){
        self.cType = cType
        self.cSize = cSize
        self.cAmount = cAmount
    }
    
    init(cID: UUID, cType: String, cSize: String, cAmount: String){
        self.id = cID
        self.cType = cType
        self.cSize = cSize
        self.cAmount = cAmount
    }
}
