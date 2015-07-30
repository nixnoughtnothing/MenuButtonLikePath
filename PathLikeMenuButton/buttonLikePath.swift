//
//  buttonLikePath.swift
//  PathLikeMenuButton
//
//  Created by nixnoughtnothing on 7/29/15.
//  Copyright © 2015 nix nought nothing. All rights reserved.
//

import UIKit

extension UIColor {
    class func hexStr (var hexStr : NSString, alpha : CGFloat = 1.0) -> UIColor {
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat((color & 0x0000FF) ) / 255.0
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        }else {
            print("invalid hex string")
            return UIColor.whiteColor()
        }
    }
}

class buttonLikePath: UIView {

    // MARK: - Define valuables -
    var subButton1 = UIButton()
    var subButton2 = UIButton()
    var subButton3 = UIButton()
    var subButton4 = UIButton()
    var subButton5 = UIButton()
    var mainButton:  UIButton!
    var colors:      NSMutableArray!
    var mainPosition:CGPoint!
    var subButtonsShowed:Bool?
    
    
    // MARK: - initialize(required by UIView) -
    required init?(coder aDecoder:NSCoder){
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    
    
    
    // subボタンの座標を返すメソッド
    func getPosition(angle: CGFloat, radius: CGFloat) -> CGPoint{
        
        let radian    = angle * CGFloat(M_PI) / 180.0
        let xPosition = mainButton.layer.position.x + radius * cos(radian) // x-coordinate
        let yPosition = mainPosition.y + radius * sin(radian) // y-coordinate
        let position  = CGPointMake(xPosition,yPosition)
        
        return position
    }
    
    
    // メインボタンイベント(touchUp時)
    func touchDownMainButton(sender: UIButton){
        
        self.backgroundColor = UIColor.whiteColor()
        
        
        
        if subButtonsShowed == nil{
            subButtonsShowed = false
        }
        
        if subButtonsShowed == false{
            
            UIView.animateWithDuration(0.06,
                // アニメーション中の処理
                animations: {() -> Void in
                    
                    // 拡大用アフィン行列を作成
                    self.subButton1.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    self.subButton2.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    self.subButton3.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    self.subButton4.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    self.subButton5.transform = CGAffineTransformMakeScale(1.0, 1.0)
                })
                { (Bool) -> Void in
            }
            
            let subButtons = [subButton1,subButton2,subButton3,subButton4,subButton5]
            colors = [UIColor.hexStr("#34AADC"),UIColor.hexStr("#1D62F0"),UIColor.hexStr("#52EDC7"),UIColor.hexStr("#007AFF"),UIColor.hexStr("#1AD6FD")]
             as NSMutableArray
            
            // mainボタンからの距離（半径）
            let radius: CGFloat = 150
            
            // subボタンに各種設定
            for var i = 0; i < subButtons.count; i++ {
                subButtons[i].frame = CGRectMake(0, 0, 40, 40)
                subButtons[i].layer.cornerRadius = 20.0
                subButtons[i].backgroundColor = colors[i] as? UIColor
                subButtons[i].center = self.center
                subButtons[i].addTarget(self, action: "onClickSubButtons:", forControlEvents: UIControlEvents.TouchUpInside)
                subButtons[i].tag = i+1
                
                // subボタンをviewに追加
                self.addSubview(subButtons[i])
            }
            
            UIView.animateWithDuration(0.06,
                // アニメーション中の処理
                animations: {() -> Void in
                    
                    // 拡大用アフィン行列を作成
                    sender.transform = CGAffineTransformMakeScale(0.4, 0.4)
                    
                    // 縮小用アフィン行列を作成
                    sender.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    
                })
                { (Bool) -> Void in
            }
            
            UIView.animateWithDuration(0.7,
                delay: 0.01,
                
                // バネを設定
                usingSpringWithDamping:0.5,
                
                // バネの弾性力
                initialSpringVelocity:1.5,
                options: UIViewAnimationOptions.CurveEaseIn,
                
                // アニメーション中の処理
                animations: { () ->Void in
                    
                    // subボタンに座標を設定
                    self.subButton1.layer.position = self.getPosition(-30, radius: radius)
                    self.subButton2.layer.position = self.getPosition(-60, radius: radius)
                    self.subButton3.layer.position = self.getPosition(-90, radius: radius)
                    self.subButton4.layer.position = self.getPosition(-120, radius: radius)
                    self.subButton5.layer.position = self.getPosition(-150, radius: radius)
                }){(Bool) -> Void in
            }
            subButtonsShowed = true
        }else{
            
            // mainボタンからの距離（半径）
            let radius: CGFloat = 0
            
            UIView.animateWithDuration(0.06,
                // アニメーション中の処理
                animations: {() -> Void in
                    
                    // 拡大用アフィン行列を作成
                    sender.transform = CGAffineTransformMakeScale(0.4, 0.4)
                    
                    // 縮小用アフィン行列を作成
                    sender.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    
                })
                { (Bool) -> Void in
            }
            
            UIView.animateWithDuration(0.7,
                delay: 0.0,
                
                // バネを設定
                usingSpringWithDamping:0.5,
                
                // バネの弾性力
                initialSpringVelocity:0.0,
                options: UIViewAnimationOptions.CurveEaseIn,
                
                // アニメーション中の処理
                animations: { () ->Void in
                    
                    // subボタンに座標を設定
                    self.subButton1.layer.position = self.getPosition(90, radius: radius)
                    self.subButton2.layer.position = self.getPosition(90, radius: radius)
                    self.subButton3.layer.position = self.getPosition(90, radius: radius)
                    self.subButton4.layer.position = self.getPosition(90, radius: radius)
                    self.subButton5.layer.position = self.getPosition(90, radius: radius)
                }){(Bool) -> Void in
            }
            
            UIView.animateWithDuration(0.2,
                
                // アニメーション中の処理
                animations: {() -> Void in
                    
                    // 縮小用アフィン行列を作成
                    self.subButton1.transform = CGAffineTransformMakeScale(0.08, 0.08)
                    self.subButton2.transform = CGAffineTransformMakeScale(0.08, 0.08)
                    self.subButton3.transform = CGAffineTransformMakeScale(0.08, 0.08)
                    self.subButton4.transform = CGAffineTransformMakeScale(0.08, 0.08)
                    self.subButton5.transform = CGAffineTransformMakeScale(0.08, 0.08)
                }){ (Bool) -> Void in
            }
            subButtonsShowed = false
        }
    }
    
    
    
    
    // subボタンイベント(背景の色を設定)
    func onClickSubButtons(sender: UIButton){
        
        // 背景色をsubボタンの色に設定する
        switch(sender.tag){
        case 1:
            self.backgroundColor = colors[0] as? UIColor
        case 2:
            self.backgroundColor = colors[1] as? UIColor
        case 3:
            self.backgroundColor = colors[2] as? UIColor
        case 4:
            self.backgroundColor = colors[3] as? UIColor
        case 5:
            self.backgroundColor = colors[4] as? UIColor
        default:
            self.backgroundColor = UIColor.whiteColor()
        }
    }

}
