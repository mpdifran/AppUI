//
//  View+Sheet.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension View {

    /// Presents the view as a sheet.
    func sheet(_ view: Binding<AnyView?>) -> some View {
        sheet(isPresented: Binding(isNotNil: view, defaultValue: nil)) {
            view.wrappedValue
        }
    }

    /// Presents the view as a full screen cover. On macOS, the view is presented as a sheet.
    func fullScreenCover(_ view: Binding<AnyView?>) -> some View {
        #if os(macOS)
        sheet(view)
        #else
        fullScreenCover(isPresented: Binding(isNotNil: view, defaultValue: nil)) {
            view.wrappedValue
        }
        #endif
    }

    /// Presents the view as a popover.
    func popover(_ view: Binding<AnyView?>) -> some View {
        popover(isPresented: Binding(isNotNil: view, defaultValue: nil)) {
            view.wrappedValue
        }
    }
}
