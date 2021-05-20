//
//  UIView+ext.swift
//  UIResponder
//
//  Created by Саид Дагалаев on 20.05.2021.
//

import UIKit

extension UIView {
    func pinToCenter(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
    }
    
    func setSize(height: CGFloat, width: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
