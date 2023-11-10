//
//  View+Shelf.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

struct ViewShelf<ShelfContent: View>: ViewModifier {
    let shelfContent: ShelfContent

    init(@ViewBuilder shelfContent: () -> ShelfContent) {
        self.shelfContent = shelfContent()
    }

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            content
            shelfContent
                .padding()
        }
    }
}

public extension View {

    func shelf<ShelfContent: View>(@ViewBuilder _ shelfContent: @escaping () -> ShelfContent) -> some View {
        modifier(ViewShelf(shelfContent: shelfContent))
    }
}


#Preview {
    List {
        Text("1")
        Text("2")
        Text("3")
        Text("4")
    }
    .shelf {
        ProminentButton(title: "Create") { }
    }
}
