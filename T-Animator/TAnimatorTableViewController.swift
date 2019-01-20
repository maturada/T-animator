//
//  TAnimatorTableView.swift
//  T-Animator
//
//  Created by David Matura on 20/01/2019.
//  Copyright © 2019 David Matura. All rights reserved.
//

import UIKit

open class TAnimatorTableViewController: UITableViewController {
    
    // MARK: - Settings.
    
    /// Set and override default settings.
    public var settings: TAnimatorSettings = TAnimatorSettings(
        type: .bounceIn,
        duration: 0.7,
        delay: 0.3
    )
    
    // MARK: - UITableViewDelegate.
    
    open override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let animation = TAnimatorFactory.makeAnimation(for: cell, at: indexPath, in: tableView)
        animation(settings)
    }
}
