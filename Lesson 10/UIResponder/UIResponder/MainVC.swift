//
//  MainVC.swift
//  UIResponder
//
//  Created by Саид Дагалаев on 20.05.2021.
//

import UIKit

class MainVC : UIViewController {
    
    let colors = [#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientView()
        setDonutView()
    }
    
    func setGradientView() {
        let gradientView = GradientView(frame: self.view.frame)
        gradientView.initColors(colors: colors)
        view = gradientView
    }
    
    func setDonutView() {
        let donutView = DonutView()
        let image = UIImage(named: "donut")
        donutView.image = image
        donutView.contentMode = .scaleToFill
        view.addSubview(donutView)
        donutView.pinToCenter(to: view)
        donutView.setSize(height: 300, width: 300)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(pushVC))
        donutView.addGestureRecognizer(tapGesture)
        donutView.isUserInteractionEnabled = true
    }
    
    @objc func pushVC() {
        navigationController?.pushViewController(SecondVC(), animated: true)
    }
    
}

class SecondVC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
    }
}
