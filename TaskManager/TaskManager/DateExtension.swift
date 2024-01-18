//
//  DateExtension.swift
//  TaskManager
//
//  Created by AMAR on 18/01/24.
//

import SwiftUI

extension Date {
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat =  format
        
        return formatter.string(from: self)
    }
    
    //Checking whether the date is today
    var istoday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    //Fetching week based on given date
    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)
        
        var week:[WeekDay] = []
        let weekDate = calendar.dateInterval(of: .weekOfMonth, for: startDate)
        guard (weekDate?.start) != nil else {return []}
        
        //Iterating to get full week
        (0..<7).forEach{index in
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startDate) {
                week.append(.init(date: weekDay))
            }
        }
        return week
    }
    
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var date: Date
    }
}
