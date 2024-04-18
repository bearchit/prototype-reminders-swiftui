//
//  EventStoreManager+FullAccess.swift
//  Reminder
//
//  Created by Mingoo Kim on 4/18/24.
//

import EventKit

extension ReminderStoreManager {
    func setupEventStore() async throws {
        let response = try await dataStore.verifyAuthorizationStatus()
        authorizationStatus = EKEventStore.authorizationStatus(for: .reminder)
        if response {
            try await fetchReminders()
        }
    }

    func fetchReminders() async throws {
        let reminders = try await dataStore.fetchReminders()
        self.reminders = reminders
    }
}
