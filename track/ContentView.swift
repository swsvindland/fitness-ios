//
//  ContentView.swift
//  track
//
//  Created by Sam Svindland on 1/26/24.
//

import SwiftUI
import Charts
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var showingPopover = false
    
    @State private var systolic: String = ""
    @State private var diastolic: String = ""

    var body: some View {
            VStack() {
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
                List {
                    ForEach(items.reversed()) { item in
                        VStack(alignment: .leading) {
                            Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric))")
                            Text("Systolic: \(item.systolic)")
                            Text("Diastolic: \(item.diastolic)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                   EditButton()
//                }
//                ToolbarItem {
//                    Button(action: showAddItemPopover) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                    .popover(isPresented: $showingPopover) {
//                        Form {
//                            TextField("Systolic", text: $systolic).keyboardType(.numberPad)
//                            TextField("Diastolic", text: $diastolic).keyboardType(.numberPad)
//                            
//                            Button(action: addItem, label: {
//                                Text("Save")
//                            })
//                        }
//                    }
//                }
//            }
        }
    
    private func showAddItemPopover() {
        showingPopover = true;
    }

    private func addItem() {
        showingPopover = false;
        
        let parsedSystolic = Int(systolic) ?? 0
        let parsedDiastolic = Int(diastolic) ?? 0
        
        withAnimation {
            let newItem = Item(timestamp: Date(), systolic: parsedSystolic, diastolic: parsedDiastolic)
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

let numberFormatter: NumberFormatter = {
     let formatter = NumberFormatter()
     formatter.numberStyle = .decimal
     return formatter
 }()
