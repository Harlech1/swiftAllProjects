//
//  MockData.swift
//  SwiftAlgorithms-Chunking
//
//  Created by Turker Kizilcik on 21.08.2023.
//

import Foundation
import Algorithms

struct Expense: Hashable, Identifiable {
    let id = UUID()
    let date: Date
    let title: String
    let value: Double
}

struct MockData {
    
    static let calendar = Calendar.current
    
    static let expenses = [
        Expense(date: .now,
                title: "Expense 1",
                value: 9.99),
        
        Expense(date: calendar.date(byAdding: .day, value: 14, to: .now)!,
                title: "Expense 2",
                value: 19.99),
        
        Expense(date: calendar.date(byAdding: .day, value: 28, to: .now)!,
                title: "Expense 3",
                value: 29.99),
        
        Expense(date: calendar.date(byAdding: .day, value: 42, to: .now)!,
                title: "Expense 4",
                value: 39.99),
        
        Expense(date: calendar.date(byAdding: .day, value: 56, to: .now)!,
                title: "Expense 5",
                value: 49.99),
        
        Expense(date: calendar.date(byAdding: .day, value: 70, to: .now)!,
                title: "Expense 6",
                value: 59.99),
        
        Expense(date: calendar.date(byAdding: .day, value: 84, to: .now)!,
                title: "Expense 7",
                value: 69.99),
        
        Expense(date: calendar.date(byAdding: .day, value: 98, to: .now)!,
                title: "Expense 8",
                value: 79.99)
        
    ]
    
    static var chunkedExpenses : [[Expense]] {
        
        let chunkedExpenses = MockData.expenses.chunked { calendar.isDate($0.date, equalTo: $1.date, toGranularity: .month)
            
        }
        return chunkedExpenses.map { Array ($0) }
    }
}
