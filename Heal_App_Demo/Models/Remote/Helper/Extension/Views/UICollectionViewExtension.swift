//
//  UICollectionView+Extensions.swift
//  VOCAB Note
//
//  Created by Hoang Dinh Huy on 4/5/21.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerCells(_ cells: AnyClass..., fromNib: Bool = true) {
        for cell in cells {
            let identifier = String(describing: cell)
            if fromNib == true {
                self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
                continue
            }
            self.register(cell, forCellWithReuseIdentifier: identifier)
        }
    }
    
    func registerHeaderFooter(_ cells: AnyClass..., forSupplementaryViewOfKind: String, fromNib: Bool = true) {
        for cell in cells {
            let identifier = String(describing: cell)
            if fromNib == true {
                self.register(UINib(nibName: identifier, bundle: nil), forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: identifier)
                continue
            }
            self.register(cell, forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: identifier)
            
        }
    }
    
    func dequeueReusableCell <T: UICollectionViewCell> (_ cell: T.Type, indexPath: IndexPath) -> T {
        let identifier = String(describing: cell)
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell as! T
    }
    
    func dequeueReusableHeaderFooter <T: UICollectionReusableView>(_ cell: T.Type, ofKind: String, indexPath: IndexPath) -> T {
        let identifier = String(describing: cell)
        let cell = self.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: identifier, for: indexPath)
        return cell as! T
    }
    
    func reloadDataNoAnimated() {
        UIView.setAnimationsEnabled(false)
        self.reloadData()
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadSectionNoAnimated(_ section: Int) {
        UIView.setAnimationsEnabled(false)
        self.reloadSections([section])
        UIView.setAnimationsEnabled(true)
    }
    
    func reloadRowNoAnimated(_ indexPath: IndexPath) {
        UIView.setAnimationsEnabled(false)
        self.reloadItems(at: [indexPath])
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
