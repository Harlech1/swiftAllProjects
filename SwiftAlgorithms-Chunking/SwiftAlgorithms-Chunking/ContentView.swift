//
//  ContentView.swift
//  SwiftAlgorithms-Chunking
//
//  Created by Turker Kizilcik on 21.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(MockData.chunkedExpenses, id: \.self) { expenses in
                DisclosureGroup {
                    ForEach(expenses) { expense in
                        HStack(alignment: .lastTextBaseline) {
                            Text(expense.date.formatted(date: .numeric, time: .omitted))
                                .font(.footnote)
                                .frame(width: 80, alignment: .leading)
                            Text(expense.title)
                            Spacer()
                            Text(expense.value, format: .currency(code: "USD"))
                        }
                    }
                } label: {
                    Text(expenses.first!.date.formatted(.dateTime.month(.wide)))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
