//
//  GoodNextViewController.swift
//  iKid
//
//  Created by Xinyi Wang on 11/2/17.
//  Copyright © 2017 Xinyi Wang. All rights reserved.
//

import UIKit

class GoodNextViewController: NextViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        color = UIColor(red:1.00, green:0.75, blue:0.80, alpha:1.0)
        content = ""
        
        super.viewDidLoad()
    }

    override func basicLayout(_ bgColor: UIColor, _ text: String) {
        super.basicLayout(bgColor, text)
        imageView.image = #imageLiteral(resourceName: "Panda.jpeg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setUpLayout(_ height: CGFloat, _ width: CGFloat) {
        var pandaHeight = CGFloat(0)
        var pandaWidth = CGFloat(0)
        if height >= width {
            pandaWidth = width * 2 / 3
            pandaHeight = width * 2 / 3
        } else {
            pandaWidth = height * 2 / 3
            pandaHeight = height * 2 / 3
        }
        imageView.widthAnchor.constraint(equalToConstant: pandaWidth).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: pandaHeight).isActive = true
        imageView.centerXAnchor.constraintEqualToSystemSpacingAfter(view.centerXAnchor, multiplier: 1).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 1).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
