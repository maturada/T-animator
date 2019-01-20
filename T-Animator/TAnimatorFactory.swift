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
    
    static public func makeAnimation(for cell: UITableViewCell, in tableView: UITableView) -> ((TAnimatorSettings) -> Void)  {
        
        return { (settings) in
            
            let animator = TAnimator(tableView: tableView)
            
            switch settings.type {
                
            case .bounceIn:
                animator.bounceIn(cell: cell, duration: settings.duration, delay: settings.duration)
            case .fadeIn:
                animator.bounceIn(cell: cell, duration: settings.duration, delay: settings.delay)
            case .slideIn:
                animator.slideIn(cell: cell, duration: settings.duration, delay: settings.delay)
            }
        }
    }
}
