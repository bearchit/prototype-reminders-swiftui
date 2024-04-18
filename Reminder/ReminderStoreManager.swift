//
//  ReminderStoreManager.swift
//  Reminder
//
//  Created by Mingoo Kim on 4/18/24.
//

import EventKit

@Observable
class ReminderStoreManager {
    var reminders: [EKReminder]

    var authorizationStatus: EKAuthorizationStatus

    let dataStore: EventDataStore

    init(store: EventDataStore = EventDataStore()) {
        self.dataStore = store
        self.reminders = []
        self.authorizationStatus = EKEventStore.authorizationStatus(for: .reminder)
    }

    var isWriteOnlyOrFullAccessAuthorized: Bool {
        if #available(iOS 17.0, *) {
            return (authorizationStatus == .writeOnly) || (authorizationStatus == .fullAccess)
        } else {
            // Fall back on earlier versions.
            return authorizationStatus == .authorized
        }
    }
}




