//
//  ContentView.swift
//  Reminder
//
//  Created by Mingoo Kim on 4/18/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var storeManager: ReminderStoreManager = .init()

    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    @State private var shouldPresentError: Bool = false
    @State private var alertTitle: String?
    @State private var alertMessage: String?

    var body: some View {
        NavigationSplitView {
            RemindersView()
                .environment(storeManager)
                .task {
                    do {
                        try await storeManager.setupEventStore()
                    } catch {
                        showError(error, title: "Authroization failed.")
                    }
                }

        } detail: {
            Text("Select an item")
        }
        .alertErrorMessage(message: alertMessage, title: alertTitle, isPresented: $shouldPresentError)
    }

    func showError(_ error: Error, title: String) {
        alertTitle = title
        alertMessage = error.localizedDescription
        shouldPresentError = true
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
