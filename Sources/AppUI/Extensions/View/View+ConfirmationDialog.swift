//
//  SwiftUIView.swift
//  
//
//  Created by Mark DiFranco on 2023-12-21.
//

import SwiftUI

public struct ConfirmationDialogDetails {
    public let title: String
    public let message: String?
    public let buttons: [Button]

    public init(title: String, message: String?, buttons: [Button]) {
        self.title = title
        self.message = message
        self.buttons = buttons
    }
}

public extension ConfirmationDialogDetails {
    struct Button: Identifiable {
        public let id = UUID()
        public let title: String
        public let role: ButtonRole?
        public let action: () -> Void

        public init(title: String, role: ButtonRole? = nil, action: @escaping () -> Void) {
            self.title = title
            self.role = role
            self.action = action
        }
    }
}

public extension View {

    func confirmationDialog(_ details: Binding<ConfirmationDialogDetails?>) -> some View {
        confirmationDialog(details.wrappedValue?.title ?? "", isPresented: Binding(isNotNil: details), titleVisibility: .visible) {
            ForEach(details.wrappedValue?.buttons ?? []) { button in
                Button(button.title, role: button.role, action: button.action)
            }
        } message: {
            if let message = details.wrappedValue?.message {
                Text(message)
            }
        }
    }
}

#Preview {
    struct WrappedView: View {
        @State private var details: ConfirmationDialogDetails?

        var body: some View {
            Button("Show Confirmation") {
                details = .init(
                    title: "Are you sure?",
                    message: "This can't be undone.",
                    buttons: [
                        .init(title: "Delete", role: .destructive) {

                        },
                        .init(title: "Cancel", role: .cancel) {

                        }
                    ]
                )
            }
            .confirmationDialog($details)
        }
    }

    return WrappedView()
}
