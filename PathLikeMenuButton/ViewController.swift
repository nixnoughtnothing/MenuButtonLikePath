//
//  ViewController.swift
//  PathLikeMenuButton
//
//  Created by nixnoughtnothing on 7/29/15.
//  Copyright © 2015 nix nought nothing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // mainボタンを初期化
    var mainButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mainボタンを生成
        mainButton = UIButton(frame: CGRectMake(0,0,50,50))
        // ボタンの位置をviewの中心に設定
        mainButton.center = self.view.center
        
        
        // buttonLikePathクラスのインスタンス作成
        let pathButtons          = buttonLikePath(frame:self.view.frame)
        pathButtons.mainButton   = self.mainButton
        pathButtons.mainPosition = self.mainButton.layer.position
        
        
        // インスタンスをviewに追加
        self.view.addSubview(pathButtons)
        
        // mainボタン各設定
        mainButton.layer.masksToBounds = true
        mainButton.layer.cornerRadius = 25
        mainButton.backgroundColor = UIColor.hexStr("#81F3FD")
        mainButton.setTitle("＋", forState: .Normal)
        mainButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        mainButton.addTarget(pathButtons,action:"touchDownMainButton:",forControlEvents: UIControlEvents.TouchDown)
        mainButton.tag = 0
        
        // mainボタンをviewに追加
        self.view.addSubview(mainButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

