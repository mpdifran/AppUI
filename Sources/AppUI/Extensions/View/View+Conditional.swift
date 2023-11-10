//
//  View+Conditional.swift
//
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension View {

    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            return AnyView(content(self))
        } else {
            return AnyView(self)
        }
    }
}
