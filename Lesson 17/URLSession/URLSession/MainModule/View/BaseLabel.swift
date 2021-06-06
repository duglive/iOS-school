//
//  BaseLabel.swift
//  URLSession
//
//  Created by Саид Дагалаев on 06.06.2021.
//

import UIKit

class BaseLabel : UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        text = "-"
    }
}
