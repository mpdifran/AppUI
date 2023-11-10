//
//  View+HStack.swift
//
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension View {

    func horizontallyCentered() -> some View {
        HStack {
            Spacer(minLength: 0)
            self
            Spacer(minLength: 0)
        }
    }
}

#Preview {
    VStack(alignment: .leading) {
        Text("Hello")
            .horizontallyCentered()

        Text("Hello World")
    }
    .frame(maxWidth: .infinity)
}
