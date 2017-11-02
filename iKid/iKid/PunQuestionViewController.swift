//
//  PunQuestionViewController.swift
//  iKid
//
//  Created by Xinyi Wang on 11/2/17.
//  Copyright © 2017 Xinyi Wang. All rights reserved.
//

import UIKit

class PunQuestionViewController: QuestionViewController {
    
    override func viewDidLoad() {
        color = UIColor(red:1.00, green:0.84, blue:0.75, alpha:1.0)
        content = "The future, the present and the past walked into a bar."
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
