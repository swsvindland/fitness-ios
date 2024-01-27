//
//  AllView.swift
//  track
//
//  Created by Sam Svindland on 1/27/24.
//

import SwiftUI
import SwiftData

struct AllView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        List {
            ForEach(items.reversed()) { item in
                VStack(alignment: .leading) {
                    Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric))")
                    Text("Systolic: \(item.systolic)")
                    Text("Diastolic: \(item.diastolic)")
                }
            }
        }
    }
}

#Preview {
    AllView()
}
