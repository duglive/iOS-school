//
//  CustomActivity.swift
//  UIActivity
//
//  Created by Саид Дагалаев on 23.05.2021.
//

import UIKit

class CustomActivity: UIActivity {
    override var activityTitle: String? { "Send to aliens" }
    override var activityType: UIActivity.ActivityType? { .none }
    override class var activityCategory: UIActivity.Category { .share }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool { true }
    
    override var activityImage: UIImage? {
        UIImage(named: "aliens")
    }
    
    override var activityViewController: UIViewController? {
        let alertController = UIAlertController(title: "Done", message: "The aliens got your meme", preferredStyle: .alert)
        let action = UIAlertAction(title: "haha", style: .default) { [weak self] _ in
            self?.activityDidFinish(true)
        }
        alertController.addAction(action)
        
        return alertController
    }
}
