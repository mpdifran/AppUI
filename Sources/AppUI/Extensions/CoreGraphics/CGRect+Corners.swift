//
//  CGRect+Corners.swift
//
//
//  Created by Mark DiFranco on 2023-11-10.
//

#if canImport(UIKit)
import UIKit

public extension CGRect {

    var topLeft: CGPoint {
        .init(x: 0, y: 0)
    }

    var topRight: CGPoint {
        .init(x: width, y: 0)
    }

    var bottomRight: CGPoint {
        .init(x: width, y: height)
    }

    var bottomLeft: CGPoint {
        .init(x: 0, y: height)
    }
}
#endif
