//
//  TAnimatorSettings.swift
//  T-Animator
//
//  Created by David Matura on 20/01/2019.
//  Copyright © 2019 David Matura. All rights reserved.
//

import Foundation

public struct TAnimatorSettings {
    
    public enum AnimationType {
        
        /// All possible options what T-animator's offering.
        case fadeIn
        case bounceIn
        case moveFadeIn
        case slideIn
    }
    
    public var type: AnimationType = .bounceIn
    public var duration: TimeInterval = 0.5
    public var delay: TimeInterval = 0.2
    
    public init(type: AnimationType, duration: TimeInterval, delay: TimeInterval) {
        
        self.type = type
        self.duration = duration
        self.delay = delay
    }
}
