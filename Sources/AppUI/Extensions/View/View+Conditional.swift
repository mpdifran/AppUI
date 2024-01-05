//
//  View+Conditional.swift
//
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension View {

    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        Group {
            if condition {
                content(self)
            } else {
                self
            }
        }
    }
}
