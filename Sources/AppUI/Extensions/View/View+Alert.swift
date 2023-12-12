//
//  View+Alert.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public struct AlertDetails {
    let title: String
    let message: String?
    let onDismiss: () -> Void

    public init(
        title: String,
        message: String?,
        onDismiss: @escaping () -> Void = { }
    ) {
        self.title = title
        self.message = message
        self.onDismiss = onDismiss
    }

    public init(
        title: String? = nil,
        error: Error,
        onDismiss: @escaping () -> Void = { }
    ) {
        self.title = title ?? "Oops"
        self.message = error.localizedDescription
        self.onDismiss = onDismiss
    }
}

public struct ErrorAlertDetails {
    let error: Error
    let onRetry: () -> Void
    let onDismiss: () -> Void

    public init(
        error: Error,
        onRetry: @escaping () -> Void = { },
        onDismiss: @escaping () -> Void = { }
    ) {
        self.error = error
        self.onRetry = onRetry
        self.onDismiss = onDismiss
    }
}

public extension View {

    func alert(error: Binding<Error?>,
               onDismiss: @escaping () -> Void = { }) -> some View {
        return alert(isPresented: Binding(isNotNil: error)) {
            Alert(error: error.wrappedValue, onDismiss: onDismiss)
        }
    }

    func alert(errorAlertDetails: Binding<ErrorAlertDetails?>) -> some View {
        return alert("Oops", isPresented: Binding(isNotNil: errorAlertDetails)) {
            Button("OK", role: .cancel) {
                errorAlertDetails.wrappedValue?.onDismiss()
            }
            Button("Retry") {
                errorAlertDetails.wrappedValue?.onRetry()
            }
        } message: {
            if let error = errorAlertDetails.wrappedValue?.error {
                Text(error.localizedDescription)
            } else {
                Text("An error occurred.")
            }
        }
    }

    func alert(alertDetails: Binding<AlertDetails?>) -> some View {
        return alert(alertDetails.wrappedValue?.title ?? "", isPresented: Binding(isNotNil: alertDetails)) {
            Button("OK") {
                alertDetails.wrappedValue?.onDismiss()
            }
        } message: {
            if let message = alertDetails.wrappedValue?.message {
                Text(message)
            }
        }
    }
}
