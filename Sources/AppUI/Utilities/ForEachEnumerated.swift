//
//  ForEachEnumerated.swift
//
//
//  Created by Mark DiFranco on 2024-05-31.
//

import SwiftUI

public struct ForEachEnumerated<ItemType, ContentView: View>: View where ItemType: Identifiable {
    private let data: [ItemType]
    private let content: (Int, ItemType) -> ContentView

    public init(_ data: [ItemType], @ViewBuilder content: @escaping (Int, ItemType) -> ContentView) {
        self.data = data
        self.content = content
    }

    public var body: some View {
        ForEach(Array(zip(data.indices, data)), id: \.1.id) { idx, item in
            content(idx, item)
        }
    }
}

public struct ForEachEnumeratedNoID<ItemType, ContentView: View>: View {
    private let data: [ItemType]
    private let content: (Int, ItemType) -> ContentView

    public init(_ data: [ItemType], @ViewBuilder content: @escaping (Int, ItemType) -> ContentView) {
        self.data = data
        self.content = content
    }

    public var body: some View {
        ForEach(Array(zip(data.indices, data)), id: \.0) { idx, item in
            content(idx, item)
        }
    }
}

extension String: Identifiable {
    public var id: String { self }
}

#Preview {
    List {
        Section {
            ForEachEnumerated(["A", "B", "C"]) { index, item in
                HStack {
                    Text("\(index)")
                    Text(item)
                }
            }
        }
        Section {
            ForEachEnumeratedNoID(["A", "B", "C"]) { index, item in
                HStack {
                    Text("\(index)")
                    Text(item)
                }
            }
        }
    }
}
