//
//  CircularSpinnerView.swift
//
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public struct CircularSpinnerView: View {

    public init() { }

    @State private var isSpinning = false

    public var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .frame(square: 20)
            .fixedSize()
            .rotationEffect(.degrees(isSpinning ? 360 : 0))
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    isSpinning = true
                }
            }
    }
}

#Preview {
    CircularSpinnerView()
        .foregroundColor(.accentColor)
}
