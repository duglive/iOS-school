//
//  MainVC.swift
//  Animations
//
//  Created by Саид Дагалаев on 30.05.2021.
//

import UIKit

class MainVC: UIViewController {
    
    var spiralView = SpiralView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setStartButton()
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .white
    }

    func setSpiralView() {
        view.addSubview(spiralView)
        
        NSLayoutConstraint.activate([
            spiralView.heightAnchor.constraint(equalToConstant: 300),
            spiralView.widthAnchor.constraint(equalToConstant: 300),
            spiralView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spiralView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setStartButton() {
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }

}

extension MainVC {
    
    @objc
    func startButtonAction(_ sender: UIButton) {
        setSpiralView()
        spiralView.drawSpiral()
        sender.isHidden = true
    }
}
