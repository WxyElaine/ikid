//
//  SecondViewController.swift
//  iKid
//
//  Created by Xinyi Wang on 11/1/17.
//  Copyright © 2017 Xinyi Wang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    fileprivate var questionViewController : PunQuestionViewController!
    fileprivate var nextViewController : PunNextViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:1.00, green:0.84, blue:0.75, alpha:1.0)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height / 7).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
    }
    
    @IBAction func switchViews(_ sender: UIButton) {
        questionBuilder()
        nextBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if questionViewController != nil &&
            questionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            nextViewController.view.frame = view.frame
            switchViewController(questionViewController, to: nextViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            questionViewController.view.frame = view.frame
            switchViewController(nextViewController, to: questionViewController)
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    
    fileprivate func questionBuilder() {
        if questionViewController == nil {
            questionViewController = storyboard?.instantiateViewController(withIdentifier: "PunQuestion") as! PunQuestionViewController
        }
    }
    fileprivate func nextBuilder() {
        if nextViewController == nil {
            nextViewController =
                storyboard?.instantiateViewController(withIdentifier: "PunNext") as! PunNextViewController
        }
    }
}

