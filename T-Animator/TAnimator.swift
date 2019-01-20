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
    
    public func fadeIn(cell: UITableViewCell, at indexPath: IndexPath, duration: TimeInterval, delay: TimeInterval) {
        
        guard !hasFinished else {
            
            hasFinished = false
            return
        }
        
        cell.alpha = 0
        
        let delayFactor = delay * Double(indexPath.row)
        
        UIView.animate(
            withDuration: duration,
            delay: delayFactor,
            animations: {
                
                cell.alpha = 1
        })
        
        hasFinished = isLastCell(indexPath)
    }
    
    public func bounceIn(cell: UITableViewCell, at indexPath: IndexPath, duration: TimeInterval, delay: TimeInterval) {
        
        guard !hasFinished else {
            
            hasFinished = false
            return
        }
        
        let height = cell.frame.size.height
        cell.transform = CGAffineTransform(translationX: 0, y: height)
        
        let delayFactor = delay * Double(indexPath.row)
        
        UIView.animate(
            withDuration: duration,
            delay: delayFactor,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.25,
            options: [.curveEaseInOut],
            animations: {
                
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        
        hasFinished = isLastCell(indexPath)
    }
    
    public func moveFadeIn(cell: UITableViewCell, at indexPath: IndexPath, duration: TimeInterval, delay: TimeInterval) {
        
        guard !hasFinished else {
            
            hasFinished = false
            return
        }
        
        let height = cell.frame.size.height
        cell.transform = CGAffineTransform(translationX: 0, y: height / 2)
        cell.alpha = 0
        
        let delayFactor = delay * Double(indexPath.row)
        
        UIView.animate(
            withDuration: duration,
            delay: delayFactor,
            options: [.curveEaseInOut],
            animations: {
                
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
        })
        
        hasFinished = isLastCell(indexPath)
    }
    
    public func slideIn(cell: UITableViewCell, at indexPath: IndexPath, duration: TimeInterval, delay: TimeInterval) {
        
        guard !hasFinished else {
            
            hasFinished = false
            return
        }
        
        cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
        
        let delayFactor = delay * Double(indexPath.row)
        
        UIView.animate(
            withDuration: duration,
            delay: delayFactor,
            options: [.curveEaseInOut],
            animations: {
                
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
        })
        
        hasFinished = isLastCell(indexPath)
    }
}

private extension TAnimator {
    
    func isLastCell(_ indexPath: IndexPath) -> Bool {
        
        let rows = tableView.numberOfRows(inSection: indexPath.section)

        guard rows > 0 else {
            return false
        }
        
        let lastRowIndex = rows - 1
        
        guard indexPath.row == lastRowIndex else {
            return false
        }
        
        return true
    }
}
