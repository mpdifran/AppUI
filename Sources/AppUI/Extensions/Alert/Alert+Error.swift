//
//  Alert+Error.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension Alert {

    init(error: Error?, onDismiss: @escaping () -> Void = { }) {
        self.init(title: Text("Oops"),
                  message: Text(error?.localizedDescription ?? ""),
                  dismissButton: .default(Text("OK"), action: onDismiss))
    }
}

