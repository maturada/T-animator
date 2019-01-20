//
//  TAnimator.swift
//  T-Animator
//
//  Created by David Matura on 20/01/2019.
//  Copyright © 2019 David Matura. All rights reserved.
//

import UIKit

open class TAnimator {
    
    private let tableView: UITableView
    
    private var hasFinished = false
    
    public init(tableView: UITableView) {
        
        self.tableView = tableView
    }
    
    public func bounceIn(cell: UITableViewCell, duration: TimeInterval, delay: TimeInterval) {
        
        guard !hasFinished else {
            
            hasFinished = false
            return
        }
        
        let height = cell.frame.size.height
        cell.transform = CGAffineTransform(translationX: 0, y: height)
        cell.alpha = 0
        
        let positionFactor = Double(tableView.indexPath(for: cell)?.row ?? 0)
        let delayFactor = delay * positionFactor
        
        UIView.animate(
            withDuration: duration,
            delay: delayFactor,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.1,
            options: [.curveEaseInOut],
            animations: {
                
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
        })
        
        hasFinished = isLastCell(cell)
    }
    
    public func fadeIn(cell: UITableViewCell, duration: TimeInterval, delay: TimeInterval) {
        
        guard !hasFinished else {
            
            hasFinished = false
            return
        }
        
        let height = cell.frame.size.height
        cell.transform = CGAffineTransform(translationX: 0, y: height / 2)
        cell.alpha = 0
        
        let positionFactor = Double(tableView.indexPath(for: cell)?.row ?? 0)
        let delayFactor = delay * positionFactor
        
        UIView.animate(
            withDuration: duration,
            delay: delayFactor,
            options: [.curveEaseInOut],
            animations: {
                
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
        })
        
        hasFinished = isLastCell(cell)
    }
    
    public func slideIn(cell: UITableViewCell, duration: TimeInterval, delay: TimeInterval) {
        
        guard !hasFinished else {
            
            hasFinished = false
            return
        }
        
        cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
        
        let positionFactor = Double(tableView.indexPath(for: cell)?.row ?? 0)
        let delayFactor = delay * positionFactor
        
        UIView.animate(
            withDuration: duration,
            delay: delayFactor,
            options: [.curveEaseInOut],
            animations: {
                
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        
        hasFinished = isLastCell(cell)
    }
}

private extension TAnimator {
    
    func isLastCell(_ cell: UITableViewCell) -> Bool {
        
        guard tableView.visibleCells.last == cell else {
            
            return false
        }
        
        return true
    }
}
