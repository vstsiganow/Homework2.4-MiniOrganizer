//
//  Date+Extension.swift
//  Homework2.4-MiniOrganizer
//
//  Created by vtsyganov on 30.05.2021.
//

import Foundation

extension Date {
    func days(to secondDate: Date, calendar: Calendar = Calendar.current) -> Int {
        return calendar.dateComponents([.day], from: self, to: secondDate).day! // Здесь force unwrap, так как в компонентах указали .day и берем day
    }
}
