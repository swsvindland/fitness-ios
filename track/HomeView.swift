//
//  HomeView.swift
//  track
//
//  Created by Sam Svindland on 1/27/24.
//

import SwiftUI
import Charts
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        List() {
            Chart(items) {
                LineMark(
                    x: .value("Date", $0.timestamp),
                    y: .value("Systolic", $0.systolic)
                )
                LineMark(
                    x: .value("Date", $0.timestamp),
                    y: .value("Diastolic", $0.diastolic)
                )
            }
            Chart(items) {
                LineMark(
                    x: .value("Date", $0.timestamp),
                    y: .value("Systolic", $0.systolic)
                )
            }
        }
    }
}

#Preview {
    HomeView()
}
