//
//  CGSize+Aspect.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

#if canImport(CoreGraphics)
import CoreGraphics

public extension CGSize {

    var aspectRatio: CGFloat {
        width / height
    }

    var transposed: CGSize {
        CGSize(width: height, height: width)
    }
}
#endif
