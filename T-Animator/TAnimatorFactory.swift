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
}
