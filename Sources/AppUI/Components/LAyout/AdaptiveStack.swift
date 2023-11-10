//
//  AdaptiveStack.swift
//
//
//  Created by Mark DiFranco on 2023-11-10.
//

import SwiftUI

public struct AdaptiveStack<Content>: View where Content : View {

    public enum LayoutDirection {
        case hStack(hSizeClasses: [UserInterfaceSizeClass] = [], vSizeClasses: [UserInterfaceSizeClass] = [])
        case vStack(hSizeClasses: [UserInterfaceSizeClass] = [], vSizeClasses: [UserInterfaceSizeClass] = [])
    }

    private let layoutDirection: LayoutDirection
    private let horizontalAlignment: VerticalAlignment
    private let verticalAlignment: HorizontalAlignment
    private let spacing: CGFloat?
    private let content: Content

    public init(_ layoutDirection: LayoutDirection,
         horizontalAlignment: VerticalAlignment = .center,
         verticalAlignment: HorizontalAlignment = .center,
         spacing: CGFloat? = nil,
         @ViewBuilder contentBuilder: () -> Content) {

        self.layoutDirection = layoutDirection
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = contentBuilder()
    }

    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    public var body: some View {
        if isHorizontal {
            HStack(alignment: horizontalAlignment, spacing: spacing) {
                content
            }
        } else {
            VStack(alignment: verticalAlignment, spacing: spacing) {
                content
            }
        }
    }
}

private extension AdaptiveStack {

    var isHorizontal: Bool {
        switch layoutDirection {
        case .hStack(let hSizeClasses, let vSizeClasses):
            if let sizeClass = horizontalSizeClass, hSizeClasses.contains(sizeClass) {
                return true
            } else if let sizeClass = verticalSizeClass, vSizeClasses.contains(sizeClass) {
                return true
            }
            return false
        case .vStack(let hSizeClasses, let vSizeClasses):
            if let hSizeClass = horizontalSizeClass,
               let vSizeClass = verticalSizeClass,
               hSizeClasses.contains(hSizeClass) || vSizeClasses.contains(vSizeClass) {
                return false
            }
            return true
        }
    }
}

extension UserInterfaceSizeClass {

    static let all = [UserInterfaceSizeClass.compact, UserInterfaceSizeClass.regular]
}

#Preview {
    VStack {
        AdaptiveStack(.vStack(hSizeClasses: [.compact])) {
            Text("Top")
            Text("Bottom")
        }

        AdaptiveStack(.hStack(vSizeClasses: [.compact])) {
            Text("Left")
            Text("Right")
        }
    }
}
