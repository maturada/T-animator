//
//  TAnimatorTableView.swift
//  T-Animator
//
//  Created by David Matura on 20/01/2019.
//  Copyright © 2019 David Matura. All rights reserved.
//

import UIKit

public struct TAnimatorSettings {
    
    public enum AnimationType {
        
        /// All possible options what T-animator's offering.
        case bounceIn
        case fadeIn
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

public class TAnimatorTableView: UITableView {
    
    var animator: TAnimator!
    
    ///  Default animation settings.
    public var settings: TAnimatorSettings = TAnimatorSettings(
        type: .bounceIn,
        duration: 0.5,
        delay: 0.2
    )
    
    /// Animator delegate.
    public weak var animatorDelegate: TAnimatorTablewViewDelegate?
    
    // MARK: Initialization.
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    override public init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
}

// MARK: Private inteface.

private extension TAnimatorTableView {
    
    private func setup() {
        
        delegate = self
        animator = TAnimatorFactory.makeTanimator(using: self)
    }
}

// MARK: - UITableViewDelegate

extension TAnimatorTableView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let animator = TAnimatorFactory.makeTanimator(using: tableView)
        
        switch settings.type {
        case .bounceIn:
            
            animator.bounceIn(cell: cell, duration: settings.duration, delay: settings.delay)
        case .fadeIn:
            
            animator.fadeIn(cell: cell, duration: settings.duration, delay: settings.delay)
        case .slideIn:
            
            animator.slideIn(cell: cell, duration: settings.duration, delay: settings.delay)
        }
        
        animatorDelegate?.tableView(self, willDisplay: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        animatorDelegate?.tableView(self, didSelectRowAt: indexPath)
    }
    
}
