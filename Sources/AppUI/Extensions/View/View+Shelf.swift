//
//  View+Shelf.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

struct ViewShelf<ShelfContent: View>: ViewModifier {
    let spacing: CGFloat?
    let shelfContent: ShelfContent

    init(spacing: CGFloat? = nil, @ViewBuilder shelfContent: () -> ShelfContent) {
        self.spacing = spacing
        self.shelfContent = shelfContent()
    }

    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: spacing) {
                    shelfContent
                }
                .padding()
                .background {
                    Rectangle()
                        .fill(.bar)
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
    }
}

public extension View {

    func shelf<ShelfContent: View>(
        spacing: CGFloat? = nil,
        @ViewBuilder _ shelfContent: @escaping () -> ShelfContent
    ) -> some View {
        modifier(ViewShelf(spacing: spacing, shelfContent: shelfContent))
    }
}


#Preview {
    NavigationView {
        List {
            Text("1")
            Text("2")
            Text("3")
            Text("4")
            Text("5")
            Text("6")
            Text("7")
            Text("8")
            Text("9")
            Text("0")
            Text("1")
            Text("2")
            Text("3")
            Text("4")
            Text("5")
            Text("6")
            Text("7")
            Text("8")
            Text("9")
            Text("0")
            Text("1")
            Text("2")
            Text("3")
            Text("4")
            Text("5")
            Text("6")
            Text("7")
            Text("8")
            Text("9")
            Text("0")
        }
        .navigationTitle("Preview")
        .shelf {
            ProminentButton("Create") { }
            ProminentButton("Cancel") { }
        }
    }
}
