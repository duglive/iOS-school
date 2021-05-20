//
//  CircleView.swift
//  UIResponder
//
//  Created by Саид Дагалаев on 20.05.2021.
//

import UIKit

class CircleView: UIView {
    convenience init(radius: CGFloat) {
        self.init(frame: CGRect(x: 0, y: 0, width: radius, height: radius))
        layer.cornerRadius = radius
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
