//
//  TAnimatorTableView.swift
//  T-Animator
//
//  Created by David Matura on 20/01/2019.
//  Copyright © 2019 David Matura. All rights reserved.
//

import UIKit

open class TAnimatorTableView: UITableView, UITableViewDelegate {
    
    enum AnimationType {
        
        /// All possible options what T-animator's offering.
        case bounceIn
        case fadeIn
        case slideIn
    }
    
    private var animator: TAnimator!
    
    /// Animation settings.
    internal var animationType: AnimationType = .bounceIn
    internal var duration: TimeInterval = 0.5
    internal var delay: TimeInterval = 0.2
    
    /// Set animator delegate.
    internal weak var animatorDelegate: TAnimatorTablewViewDelegate?
    
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
    
    // MARK: - UITableViewDelegate
    
    private func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let animator = TAnimatorFactory.makeTanimator(using: tableView)
        
        switch animationType {
        case .bounceIn:
            
            animator.bounceIn(cell: cell, duration: duration, delay: delay)
        case .fadeIn:
            
            animator.fadeIn(cell: cell, duration: duration, delay: delay)
        case .slideIn:
            
            animator.slideIn(cell: cell, duration: duration, delay: delay)
        }
        animatorDelegate?.tableView(self, willDisplay: cell, forRowAt: indexPath)
    }
    
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        animatorDelegate?.tableView(self, didSelectRowAt: indexPath)
    }
    
}

// MARK: Private inteface.

private extension TAnimatorTableView {
    
    private func setup() {
        
        delegate = self
        animator = TAnimatorFactory.makeTanimator(using: self)
    }
}
