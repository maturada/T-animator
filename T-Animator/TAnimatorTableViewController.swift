//
//  TAnimatorTableView.swift
//  T-Animator
//
//  Created by David Matura on 20/01/2019.
//  Copyright © 2019 David Matura. All rights reserved.
//

import UIKit

open class TAnimatorTableViewController: UITableViewController {
    
    ///  Default animation settings.
    public var settings: TAnimatorSettings = TAnimatorSettings(
        type: .bounceIn,
        duration: 0.5,
        delay: 0.2
    )
    
    // MARK: - UITableViewDelegate
    
    open override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let animation = TAnimatorFactory.makeAnimation(for: cell, in: tableView)
        animation(settings)
    }
}
