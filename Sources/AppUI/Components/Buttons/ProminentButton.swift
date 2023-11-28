//
//  ProminentButton.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public struct ProminentButton: View {
    let title: String
    let systemImage: String?
    let role: ButtonRole?
    let isLoading: Bool
    let action: () -> Void

    public init(
        _ title: String,
        role: ButtonRole? = nil,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.systemImage = nil
        self.role = role
        self.isLoading = isLoading
        self.action = action
    }

    public init(
        _ title: String,
        systemImage: String,
        role: ButtonRole? = nil,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.systemImage = systemImage
        self.role = role
        self.isLoading = isLoading
        self.action = action
    }

    public var body: some View {
        Button(role: role, action: action) {
            HStack {
                Spacer()
                if isLoading {
                    CircularSpinnerView()
                } else if let systemImage {
                    Label(title, systemImage: systemImage)
                        .labelStyle(.titleAndIcon)
                } else {
                    Text(title)
                }
                Spacer()
            }
            .bold()
            .padding(6)
        }
        .buttonStyle(.borderedProminent)
        .allowsHitTesting(!isLoading)
    }
}

#Preview {
    List {
        ProminentButton("Start Game") {
            print("Hey")
        }

        ProminentButton("Start Game", isLoading: true) {
            print("Hey")
        }

        ProminentButton(
            "Start Game",
            systemImage: "plus"
        ) {
            print("Hey")
        }
        .tint(.red)
        .foregroundStyle(.black)
    }
}
