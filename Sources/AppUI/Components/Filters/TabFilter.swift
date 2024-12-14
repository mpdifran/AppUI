//
//  TabFilter.swift
//  AppUI
//
//  Created by Mark DiFranco on 2024-12-14.
//

import SwiftUI

public protocol TabFilterItem: Identifiable, Equatable, CaseIterable {
    var name: String { get }
    var image: Image { get }
    var color: Color { get }
}

public struct TabFilter<Tab: TabFilterItem>: View where Tab.AllCases: RandomAccessCollection {
    @Binding private var selectedTab: Tab

    public init(
        selectedTab: Binding<Tab>
    ) {
        self._selectedTab = selectedTab
    }

    public var body: some View {
        HStack {
            ForEach(Tab.allCases) { tab in
                tabView(for: tab)
                    .contentShape(Rectangle())
                    .sensoryFeedback(.selection, trigger: selectedTab)
                    .onTapGesture {
                        selectedTab = tab
                    }
            }
        }
        .padding()
    }
}

private extension TabFilter {

    @ViewBuilder
    func tabView(for tab: Tab) -> some View {
        HStack {
            if tab == selectedTab {
                Spacer()
            }

            tab.image
                .symbolVariant(tab == selectedTab ? .fill : .none)
                .foregroundStyle(tab == selectedTab ? .white : .secondary)
                .transition(.opacity)

            if tab == selectedTab {
                Text(tab.name)
                    .foregroundStyle(.white)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
            }

            if tab == selectedTab {
                Spacer()
            }
        }
        .bold()
        .padding(14)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(tab == selectedTab ? AnyShapeStyle(tab.color) : AnyShapeStyle(.background.secondary))
        }
        .animation(.bouncy, value: selectedTab)
    }
}

private enum PreviewTab: TabFilterItem {
    var id: Self { self }

    case main
    case promotions
    case updates
    case shopping

    var name: String {
        switch self {
        case .main: return "Main"
        case .promotions: return "Promotions"
        case .updates: return "Updates"
        case .shopping: return "Shopping"
        }
    }

    var image: Image {
        Image(systemName: systemImage)
    }

    var systemImage: String {
        switch self {
        case .main: return "house"
        case .promotions: return "tag"
        case .updates: return "arrow.up.circle"
        case .shopping: return "cart"
        }
    }

    var color: Color {
        switch self {
        case .main: return .blue
        case .promotions: return .red
        case .updates: return .green
        case .shopping: return .yellow
        }
    }
}

#Preview {
    @Previewable @State var selectedTab = PreviewTab.main

    TabFilter(selectedTab: $selectedTab)
}
