//
//  View+Frame.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension View {

    func frame(square: CGFloat) -> some View {
        frame(width: square, height: square)
    }

    func frame(size: CGSize) -> some View {
        frame(width: size.width, height: size.height)
    }
}
