//
//  MainViewController.swift
//  iKid
//
//  Created by Xinyi Wang on 11/2/17.
//  Copyright © 2017 Xinyi Wang. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    @IBOutlet weak var tab: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tab.items![0].title = "Good"
        tab.items![1].title = "Pun"
        tab.items![2].title = "Dad"
        tab.items![2].image = #imageLiteral(resourceName: "first.pdf")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
