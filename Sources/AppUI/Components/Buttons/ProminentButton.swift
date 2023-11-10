//
//  ProminentButton.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public struct ProminentButton: View {
    let title: String
    let role: ButtonRole?
    let isLoading: Bool
    let action: () -> Void

    public init(
        title: String,
        role: ButtonRole? = nil,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
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
                        .padding(6)
                } else {
                    Text(title)
                        .bold()
                        .padding(6)
                }
                Spacer()
            }
        }
        .buttonStyle(.borderedProminent)
        .allowsHitTesting(!isLoading)
    }
}

#Preview {
    List {
        ProminentButton(title: "Start Game") {
            print("Hey")
        }
        .padding()

        ProminentButton(title: "Start Game", isLoading: true) {
            print("Hey")
        }
        .padding()
    }
}
