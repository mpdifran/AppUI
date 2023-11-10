//
//  CGSize+Aspect.swift
//  
//
//  Created by Mark DiFranco on 2023-11-10.
//

import UIKit

public extension CGSize {

    var aspectRatio: CGFloat {
        width / height
    }
}
