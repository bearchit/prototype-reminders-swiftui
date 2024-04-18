//
//  RemindersView.swift
//  Reminder
//
//  Created by Mingoo Kim on 4/18/24.
//

import EventKit
import SwiftUI

struct RemindersView: View {
    @Environment(ReminderStoreManager.self) private var storeManager
    @State private var selection: Set<EKReminder> = []

    var body: some View {
        VStack {
            if storeManager.reminders.isEmpty {
                Text("Empty")
            } else {
                List(selection: $selection) {
                    ForEach(storeManager.reminders, id: \.self) { reminder in
                        VStack(alignment: .leading, spacing: 7) {
                            Text(reminder.title)
                                .foregroundColor(.primary)
                                .font(.headline)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RemindersView()
}
