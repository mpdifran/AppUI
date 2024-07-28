//
//  SwiftUIView.swift
//  
//
//  Created by Mark DiFranco on 2024-07-28.
//

import SwiftUI

public struct TertiaryButtonStyle: ButtonStyle {

    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .bold()
        .padding(.vertical, 16)
        .padding(.horizontal)
        .background(.tint.opacity(0.3))
        .foregroundStyle(.tint)
        .clipShape(RoundedRectangle(cornerRadius: 17))
    }
}

public extension ButtonStyle where Self == TertiaryButtonStyle {
    static var tertiary: some ButtonStyle { TertiaryButtonStyle() }
}

#Preview {
    Button("Tap Me", systemImage: "sparkles") {

    }
    .buttonStyle(.tertiary)
    .padding()
    .tint(.blue)
}
