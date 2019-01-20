//
//  TAnimatorTableView.swift
//  T-Animator
//
//  Created by David Matura on 20/01/2019.
//  Copyright © 2019 David Matura. All rights reserved.
//

import UIKit

public class TAnimatorTableViewController: UITableViewController {
    
    private var animator: TAnimator!
    
    ///  Default animation settings.
    public var settings: TAnimatorSettings = TAnimatorSettings(
        type: .bounceIn,
        duration: 0.5,
        delay: 0.2
    )
    
    // MARK: Initialization.
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setup()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
    }
    
}

// MARK: Private inteface.

private extension TAnimatorTableViewController {
    
    private func setup() {
        
        tableView.delegate = self
        animator = TAnimatorFactory.makeTanimator(using: tableView)
    }
}

// MARK: - UITableViewDelegate

extension TAnimatorTableViewController {
    
    public override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let animator = TAnimatorFactory.makeTanimator(using: tableView)
        
        switch settings.type {
        case .bounceIn:
            
            animator.bounceIn(cell: cell, duration: settings.duration, delay: settings.delay)
        case .fadeIn:
            
            animator.fadeIn(cell: cell, duration: settings.duration, delay: settings.delay)
        case .slideIn:
            
            animator.slideIn(cell: cell, duration: settings.duration, delay: settings.delay)
        }
    }
}
