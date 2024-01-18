//
//  +View.swift
//  TaskManager
//
//  Created by AMAR on 18/01/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View{
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vSpacing(_ alignment: Alignment) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    //Checking two date are same
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
