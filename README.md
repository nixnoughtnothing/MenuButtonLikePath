# PathStyleMenu

Path-Style menu button written in `Swift2.0`

## demo
![demo](https://github.com/nixnoughtnothing/MenuButtonLikePath/blob/master/ScreenRecording.gif)


## Usage

**(1) Installation**  
Manually
```
Just drag and drop the buttonLikePath.swift file in the PathLikeMenuButton folder into your project.
```

**(2) Write Code below in your ViewController(feel free to customize menu button)**
```Swift

override func viewDidLoad() {

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
```
