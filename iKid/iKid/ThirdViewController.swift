//
//  ThirdViewController.swift
//  iKid
//
//  Created by Xinyi Wang on 11/2/17.
//  Copyright © 2017 Xinyi Wang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    fileprivate var questionViewController : QuestionViewController!
    fileprivate var nextViewController : NextViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.75, green:0.80, blue:1.00, alpha:1.0)
        
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
            questionViewController = storyboard?.instantiateViewController(withIdentifier: "Question") as! QuestionViewController
        }
    }
    fileprivate func nextBuilder() {
        if nextViewController == nil {
            nextViewController =
                storyboard?.instantiateViewController(withIdentifier: "Next") as! NextViewController
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
