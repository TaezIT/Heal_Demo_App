//
//  UITableViewExtension.swift
//  EcaproMonitoring
//
//  Created by Quang Thai on 8/12/19.
//  Copyright © 2019 HUNG ANH LE. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCells(_ cells: AnyClass..., fromNib: Bool = true) {
        for cell in cells {
            let identifier = String(describing: cell)
            if fromNib == true {
                self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
                continue
            }
            register(cell, forCellReuseIdentifier: identifier)
        }
    }
    
    func dequeueReusableCell <T: UITableViewCell> (_ cell: T.Type, indexPath: IndexPath) -> T {
        let identifier = String(describing: cell)
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell as! T
    }
    
    func registerHeaderFooter(_ cells: AnyClass..., fromNib: Bool = true) {
        for cell in cells {
            let identifier = String(describing: cell)
            if fromNib == true {
                self.register(UINib(nibName: identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier)
                continue
            }
            self.register(cell, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
    
    func dequeueReusableHeaderFooter <T: UITableViewHeaderFooterView>(_ cell: T.Type) -> T {
        let identifier = String(describing: cell)
        let cell = self.dequeueReusableHeaderFooterView(withIdentifier: identifier)
        return cell as! T
    }
    
    func reloadDataNoAnimated() {
        UIView.setAnimationsEnabled(false)
        self.reloadData()
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadSectionNoAnimated(_ section: Int) {
        UIView.setAnimationsEnabled(false)
        self.reloadSections([section], with: .none)
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadRowNoAnimated(_ indexPath: IndexPath) {
        UIView.setAnimationsEnabled(false)
        self.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
    }
    
    // MARK: - Pull To Refresh
    func addPullToRefresh(_ viewController: UIViewController, tinColor: UIColor = .black, action: Selector) {
        let refreshControl = UIRefreshControl()
        if #available(iOS 10.0, *) {
            self.refreshControl = refreshControl
        } else {
            self.addSubview(refreshControl)
        }
        refreshControl.tintColor = tinColor
        refreshControl.addTarget(viewController, action: action, for: .valueChanged)
    }
    
    func startPullToRefresh() {
        var refreshControl: UIRefreshControl?
        if #available(iOS 10.0, *) {
            refreshControl = self.refreshControl
        } else {
            for view in self.subviews {
                
                if let refreshView = view as? UIRefreshControl {
                    refreshControl = refreshView
                    break
                }
            }
        }
        guard let refresh = refreshControl else {
            return
        }
        refresh.beginRefreshing()
        self.isUserInteractionEnabled = false
    }
    
    func stopPullToRefresh() {
        var refreshControl: UIRefreshControl?
        if #available(iOS 10.0, *) {
            refreshControl = self.refreshControl
        } else {
            for view in self.subviews {
                
                if let refreshView = view as? UIRefreshControl {
                    refreshControl = refreshView
                    break
                }
            }
        }
        guard let refresh = refreshControl else {
            return
        }
        refresh.endRefreshing()
        self.isUserInteractionEnabled = true
    }
}
