//
//  View+ZStack.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public extension View {

    /// Aligns this view within a ZStack.
    ///
    /// - parameter alignment: The alignment to use for this view.
    func zStackAlignment(_ alignment: Alignment) -> some View {
        VStack(spacing: 0) {
            if alignment == .center ||
                alignment == .bottom ||
                alignment == .bottomLeading ||
                alignment == .bottomTrailing {
                Spacer(minLength: 0)
            }

            HStack(spacing: 0) {
                if alignment == .center ||
                    alignment == .trailing ||
                    alignment == .topTrailing ||
                    alignment == .bottomTrailing {
                    Spacer(minLength: 0)
                }

                self

                if alignment == .center ||
                    alignment == .leading ||
                    alignment == .topLeading ||
                    alignment == .bottomLeading {
                    Spacer(minLength: 0)
                }
            }

            if alignment == .center ||
                alignment == .top ||
                alignment == .topLeading ||
                alignment == .topTrailing {
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    ZStack {
        Text("Center")
            .zStackAlignment(.center)
        Text("Top")
            .zStackAlignment(.top)
        Text("Bottom")
            .zStackAlignment(.bottom)
        Text("Leading")
            .zStackAlignment(.leading)
        Text("Trailing")
            .zStackAlignment(.trailing)
        Text("Top Leading")
            .zStackAlignment(.topLeading)
        Text("Bottom Leading")
            .zStackAlignment(.bottomLeading)
        Text("Top Trailing")
            .zStackAlignment(.topTrailing)
        Text("Bottom Trailing")
            .zStackAlignment(.bottomTrailing)
    }
    .padding()
}
