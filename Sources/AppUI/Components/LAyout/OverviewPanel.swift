//
//  SwiftUIView.swift
//  
//
//  Created by Mark DiFranco on 2023-12-02.
//

import SwiftUI

public extension View {

    func overviewPanel<Content: View>(
        isVisible: Binding<Bool>,
        maxWidth: CGFloat = 150,
        _ contentBuilder: () -> Content
    ) -> some View {
        HStack(spacing: 0) {
            if isVisible.wrappedValue {
                VStack(spacing: 0) {
                    contentBuilder()
                    Spacer(minLength: 0)
                }
                .frame(maxWidth: maxWidth)
                #if os(macOS) || os(watchOS)
                .background(.background.secondary)
                #else
                .background(Color(uiColor: .secondarySystemBackground))
                #endif
                .transition(.move(edge: .leading))
                Spacer(minLength: 0)
            }
            self
            if isVisible.wrappedValue {
                Spacer(minLength: 0)
            }
        }
        .toolbar {
            #if os(macOS)
            ToolbarItem(placement: .navigation) {
                Button("Overview", systemImage: "sidebar.leading") {
                    isVisible.wrappedValue.toggle()
                }
            }
            #else
            ToolbarItem(placement: .topBarLeading) {
                Button("Overview", systemImage: "sidebar.leading") {
                    isVisible.wrappedValue.toggle()
                }
            }
            #endif
        }
        .animation(.easeInOut, value: isVisible.wrappedValue)
    }
}

#Preview {
    struct Wrapper: View {
        @State var isVisible = false

        var body: some View {
            NavigationStack {
                    Text("This is my content")
                        .navigationTitle("Test")
                        #if !os(macOS)
                        .navigationBarTitleDisplayMode(.inline)
                        #endif
                        .overviewPanel(isVisible: $isVisible) {
                            List {
                                Text("First")
                                Text("Second")
                                Text("Third")
                            }
                        }
            }
            #if os(macOS)
            .frame(width: 600, height: 400)
            #endif
        }
    }

    return Wrapper()
}
