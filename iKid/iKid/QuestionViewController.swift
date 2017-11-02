//
//  QuestionViewController.swift
//  iKid
//
//  Created by Xinyi Wang on 11/2/17.
//  Copyright © 2017 Xinyi Wang. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    public var question: UILabel?
    public var color: UIColor! = UIColor(red:0.75, green:0.80, blue:1.00, alpha:1.0)
    public var content: String! = "A ham sandwich walks into a bar and orders a beer."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicLayout(color, content)

        setUpLayout(view.frame.height, view.frame.width)
    }
    
    public func basicLayout(_ bgColor: UIColor, _ text: String) {
        view.backgroundColor = bgColor
        if content != "" {
            let questionFrame = CGRect.init(origin: view.frame.origin, size: CGSize.init(width: view.frame.width / 3, height: view.frame.height / 3))
            question = UILabel.init(frame: questionFrame)
            question!.text = text
            
            question!.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(question!)
            view.didAddSubview(question!)
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        removeViewConstraints(self.view)
    }
    
    // Refreshes the layout
    override func viewWillLayoutSubviews() {
        setUpLayout(self.view.frame.height, self.view.frame.width)
    }
    
    public func setUpLayout(_ height: CGFloat, _ width: CGFloat) {
        if question != nil {
            question!.widthAnchor.constraint(equalToConstant: view.frame.width / 3).isActive = true
            question!.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
            question!.centerXAnchor.constraintEqualToSystemSpacingAfter(view.centerXAnchor, multiplier: 1).isActive = true
            question!.centerYAnchor.constraintEqualToSystemSpacingBelow(view.centerYAnchor, multiplier: 1).isActive = true
            question!.lineBreakMode = .byWordWrapping
            question!.numberOfLines = 0
            question!.adjustsFontSizeToFitWidth = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func removeViewConstraints(_ view: UIView) {
        if view.subviews.count > 0 {
            for element in view.subviews {
                removeViewConstraints(element)
            }
        }
        view.removeConstraints(view.constraints)
    }

}
