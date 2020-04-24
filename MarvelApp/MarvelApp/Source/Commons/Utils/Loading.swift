//
//  Loading.swift
//  MarvelApp
//
//  Created by m.murillo.bermejo on 23/04/2020.
//  Copyright © 2020 m.murillo.bermejo. All rights reserved.
//

import UIKit

fileprivate var loadingView : UIView?

extension UIViewController {
    
    func showLoading() {
        loadingView = UIView(frame: self.view.bounds)
        loadingView?.backgroundColor = UIColor.init(red: 203.0, green: 28.0, blue: 29.0, alpha: 0.5)
        
        let l = UIActivityIndicatorView(style: .large)
        l.center = loadingView!.center
        l.startAnimating()
        loadingView?.addSubview(l)
        self.view.addSubview(loadingView!)
    }
    
    func dismissLoading() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
}

