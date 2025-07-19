//
//  View+Shelf.swift
//
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

struct ViewShelf<ShelfContent: View, S: ShapeStyle>: ViewModifier {
    private let spacing: CGFloat?
    private let backgroundFill: S
    private let includePadding: Bool
    private let shelfContent: ShelfContent

    init(
        spacing: CGFloat? = nil,
        backgroundFill: S = .regularMaterial,
        includePadding: Bool = true,
        @ViewBuilder shelfContent: () -> ShelfContent
    ) {
        self.spacing = spacing
        self.backgroundFill = backgroundFill
        self.includePadding = includePadding
        self.shelfContent = shelfContent()
    }

    func body(content: Content) -> some View {
        if #available(iOS 26.0, watchOS 26, *) {
            GlassEffectContainer {
                content
                    .safeAreaInset(edge: .bottom) {
                        VStack(spacing: spacing) {
                            shelfContent
                        }
                        .horizontallyCentered()
                        .if(includePadding) {
                            $0.padding()
                        }
                        .glassEffect(in: RoundedRectangle(cornerRadius: 34))
                        .padding(.horizontal, 8)
                    }
            }
        } else {
            content
                .safeAreaInset(edge: .bottom) {
                    VStack(spacing: spacing) {
                        shelfContent
                    }
                    .horizontallyCentered()
                    .if(includePadding) {
                        $0.padding()
                    }
                    .background {
                        Rectangle()
                            .fill(backgroundFill)
                            .edgesIgnoringSafeArea(.bottom)
                    }
                }
        }
    }
}

public extension View {

    func shelf<ShelfContent: View, S: ShapeStyle>(
        spacing: CGFloat? = nil,
        backgroundFill: S = .regularMaterial,
        includePadding: Bool = true,
        @ViewBuilder _ shelfContent: @escaping () -> ShelfContent
    ) -> some View {
        modifier(
            ViewShelf(
                spacing: spacing,
                backgroundFill: backgroundFill,
                includePadding: includePadding,
                shelfContent: shelfContent
            )
        )
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
