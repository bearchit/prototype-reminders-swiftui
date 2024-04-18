//
//  EventDataStore.swift
//  Reminder
//
//  Created by Mingoo Kim on 4/18/24.
//

import EventKit

actor EventDataStore {
    let eventStore: EKEventStore

    init() {
        eventStore = EKEventStore()
    }
}
