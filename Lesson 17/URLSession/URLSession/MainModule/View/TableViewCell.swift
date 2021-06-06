//
//  TableViewCell.swift
//  URLSession
//
//  Created by Саид Дагалаев on 06.06.2021.
//

import UIKit

class TableViewCell : UITableViewCell {
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLabel()
    }
    
    func setLabel() {
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = self.bounds
    }
    
    func config(text: String) {
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
