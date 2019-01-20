//
//  TAnimatorTablewViewDelegate.swift
//  T-Animator
//
//  Created by David Matura on 20/01/2019.
//  Copyright © 2019 David Matura. All rights reserved.
//

import UIKit

public protocol TAnimatorTablewViewDelegate: class {
    
    func tableView(_ tableView: TAnimatorTableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    func tableView(_ tableView: TAnimatorTableView, didSelectRowAt indexPath: IndexPath)
    
}
