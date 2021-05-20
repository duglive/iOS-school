//
//  DonutView.swift
//  UIResponder
//
//  Created by Саид Дагалаев on 21.05.2021.
//

import UIKit

class DonutView : UIImageView {
    private let touchableArea = CGSize(width: 80, height: 80)
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let dWidth = touchableArea.width - bounds.width
        let dHeight = touchableArea.height - bounds.height
        
        let rect = CGRect(x: (bounds.minX - dWidth)/2, y: (bounds.minY - dHeight)/2, width: touchableArea.width, height: touchableArea.height)
        
        return rect.contains(point)
    }
}
