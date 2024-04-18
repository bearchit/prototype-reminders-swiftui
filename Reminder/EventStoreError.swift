//
//  EventStoreError.swift
//  Reminder
//
//  Created by Mingoo Kim on 4/18/24.
//

import Foundation

enum EventStoreError: Error {
    case denied
    case restricted
    case unknown
    case upgrade
}

extension EventStoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .denied:
            return NSLocalizedString("The app doesn't have permission to Reminders in Settings.", comment: "Access denied")
        case .restricted:
            return NSLocalizedString("This device doesn't allow access to Reminders.", comment: "Access restricted")
        case .unknown:
            return NSLocalizedString("An unknown error occured.", comment: "Unknown error")
        case .upgrade:
            let access = "The app has write-only access to Reminders in Settings."
            let update = "Please grant it full access so the app can fetch and delete your reminders."
            return NSLocalizedString("\(access) \(update)", comment: "Upgrade to full access")
        }
    }
}
