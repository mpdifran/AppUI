//
//  View+Any.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension View {

    var asAny: AnyView {
        AnyView(self)
    }
}
