//
//  MainVC.swift
//  UIActivity
//
//  Created by Саид Дагалаев on 23.05.2021.
//

import UIKit

class MainVC: UIViewController {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yes")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImageView()
        setBarButtonItem()
    }
    
    func setImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    func setBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleShare))
    }
    
}

extension MainVC {
    
    @objc
    func handleShare() {
        let customActivity = CustomActivity()
        let activityVC = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [customActivity])
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.postToFlickr, UIActivity.ActivityType.postToVimeo, UIActivity.ActivityType.saveToCameraRoll]
        present(activityVC, animated: true, completion: nil)
        activityVC.completionWithItemsHandler = { activity, success, items, error in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
