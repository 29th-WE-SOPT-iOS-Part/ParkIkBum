//
//  UITableView++.swift
//  Youtube_Clone
//
//  Created by 박익범 on 2021/10/29.
//

import Foundation
import UIKit

extension UITableView{
    public func registerCustomXib(xibName: String){
        let xib = UINib(nibName: xibName, bundle: nil)
        self.register(xib, forCellReuseIdentifier: xibName)
    }
    
    
}

