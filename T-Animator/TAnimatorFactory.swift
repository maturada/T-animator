//
//  TAnimatorFactory.swift
//  T-Animator
//
//  Created by David Matura on 20/01/2019.
//  Copyright © 2019 David Matura. All rights reserved.
//

import UIKit

open class TAnimatorFactory {
    
    static public func makeTanimator(using tableView: UITableView) -> TAnimator {
        
        return TAnimator(tableView: tableView)
    }
    
    static public func makeAnimation(for cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) -> ((TAnimatorSettings) -> Void)  {
        
        return { (settings) in
            
            let animator = TAnimator(tableView: tableView)
            
            switch settings.type {
            case .fadeIn:
                animator.fadeIn(cell: cell, at: indexPath, duration: settings.duration, delay: settings.delay)
            case .bounceIn:
                animator.bounceIn(cell: cell, at: indexPath, duration: settings.duration, delay: settings.duration)
            case .moveFadeIn:
                animator.moveFadeIn(cell: cell, at: indexPath, duration: settings.duration, delay: settings.delay)
            case .slideIn:
                animator.slideIn(cell: cell, at: indexPath, duration: settings.duration, delay: settings.delay)
            }
        }
    }
}
