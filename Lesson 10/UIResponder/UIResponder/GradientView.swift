//
//  GradientView.swift
//  UIResponder
//
//  Created by Саид Дагалаев on 20.05.2021.
//

import UIKit

class GradientView : UIView {
    private var gradient = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initColors(colors: [UIColor]) {
        gradient.colors = colors.map { $0.cgColor }
    }
}
