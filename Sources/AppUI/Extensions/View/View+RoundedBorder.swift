//
//  View+RoundedBorder.swift
//
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension View {

    func roundedBorder(_ radius: CGFloat = 15, color: Color, lineWidth: CGFloat = 1) -> some View {
        clipShape(
            RoundedRectangle(cornerRadius: radius)
        )
        .overlay(
            RoundedRectangle(cornerRadius: radius)
                .stroke(color, lineWidth: lineWidth)
        )
    }
}
