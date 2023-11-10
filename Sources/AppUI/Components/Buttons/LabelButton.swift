//
//  LabelButton.swift
//
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public struct LabelButton: View {
    let title: String
    let systemImage: String
    let role: ButtonRole?
    let action: () -> Void

    public init(
        _ title: String,
        systemImage: String,
        role: ButtonRole? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.systemImage = systemImage
        self.role = role
        self.action = action
    }

    public var body: some View {
        Button(role: role, action: action) {
            Label(title, systemImage: systemImage)
        }
    }
}

#Preview {
    LabelButton("Game List", systemImage: "gamecontroller") { }
}
