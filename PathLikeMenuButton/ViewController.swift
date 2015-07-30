//
//  ViewController.swift
//  PathLikeMenuButton
//
//  Created by nixnoughtnothing on 7/29/15.
//  Copyright © 2015 nix nought nothing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create Main Button
        let mainButton = UIButton(frame: CGRectMake(0,0,50,50))
        mainButton.center = self.view.center
        
        // Create an instance of buttonLikePath Class
        let pathButtons          = buttonLikePath(frame:self.view.frame)
        pathButtons.mainButton   = mainButton
        pathButtons.mainPosition = mainButton.layer.position
        
        self.view.addSubview(pathButtons)
        
        // Customize Main Button
        mainButton.layer.masksToBounds = true
        mainButton.layer.cornerRadius = 25
        mainButton.backgroundColor = UIColor.hexStr("#81F3FD")
        mainButton.setTitle("＋", forState: .Normal)
        mainButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        mainButton.addTarget(pathButtons,action:"touchDownMainButton:",forControlEvents: UIControlEvents.TouchDown)
        mainButton.tag = 0
        
        self.view.addSubview(mainButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

