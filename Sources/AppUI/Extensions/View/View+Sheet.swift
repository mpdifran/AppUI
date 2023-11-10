//
//  View+Sheet.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension View {

    func sheet(_ view: Binding<AnyView?>) -> some View {
        sheet(isPresented: Binding(isNotNil: view, defaultValue: nil)) {
            view.wrappedValue
        }
    }

    func fullScreenCover(_ view: Binding<AnyView?>) -> some View {
        fullScreenCover(isPresented: Binding(isNotNil: view, defaultValue: nil)) {
            view.wrappedValue
        }
    }
}
