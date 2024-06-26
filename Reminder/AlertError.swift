//
//  AlertError.swift
//  Reminder
//
//  Created by Mingoo Kim on 4/18/24.
//

import SwiftUI

struct AlertError: ViewModifier {
    var message: String?
    var title: String?
    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        content
            .alert(title ?? "An error occurs.",
                   isPresented: $isPresented,
                   actions: {},
                   message: {
                       Text(message ?? "An error occurs.")
                   })
    }
}

extension View {
    func alertErrorMessage(message: String?, title: String?, isPresented: Binding<Bool>) -> some View {
        modifier(AlertError(message: message, title: title, isPresented: isPresented))
    }
}
