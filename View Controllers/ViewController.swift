//
//  ViewController.swift
//  Wk5AnimationsAudio
//
//  Created by Default User on 2/6/25.
//

import UIKit

class ViewController: UIViewController {
    
    //? makes it optional
    var spinLayer:CALayer?
    var flyLayer:CALayer?
    var fadeLayer:CALayer?
    
    @IBOutlet var sgAnim:UISegmentedControl!
    @IBOutlet var imgView:UIImageView!
    
    @IBAction func unwindToHome(sender : UIStoryboardSegue)
    {
        
    }
    
    @IBAction func segmentDidChange(sender:UISegmentedControl){
        chooseAnim()
    }
    
    func animateImage()
    {
        let playImage=UIImage(named: "play.jpeg")!
        let settingsImage=UIImage(named:"settings.jpeg")!
        let aboutImage=UIImage(named:"about.jpeg")!
        
        
        //putting it in array
        let arImg=[playImage,settingsImage,aboutImage]

        imgView.animationImages=arImg;
        imgView.animationDuration=2.0;
        imgView.animationRepeatCount=0;
        imgView.startAnimating();

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //animating the image
        animateImage()
        chooseAnim()
    }
    
    func clearAnim(){
        spinLayer?.removeAllAnimations();
        fadeLayer?.removeAllAnimations();
        flyLayer?.removeAllAnimations();
        
        spinLayer?.removeFromSuperlayer();
        fadeLayer?.removeFromSuperlayer();
        flyLayer?.removeFromSuperlayer();
    }
    
    func chooseAnim(){
        
        clearAnim();
        
        if(sgAnim.selectedSegmentIndex==0){
            spinImage();
        }
        else if (sgAnim.selectedSegmentIndex==1){
            moveImage();
        }
        else{
            fadeImage();
        }
                   
        
    }
    
    func spinImage(){
        
        let spinImg=UIImage(named: "play.jpeg");
        spinLayer = .init();
        spinLayer?.contents=spinImg?.cgImage;
        
        //specifying size and position
        spinLayer?.bounds=CGRect(x: 0, y: 0, width: 150, height: 150);
        spinLayer?.position=CGPoint(x: 200, y: 200);
        
        //adding as a layer
        view.layer.addSublayer(spinLayer!);
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.timingFunction=CAMediaTimingFunction(name:.easeInEaseOut);
        rotateAnimation.fromValue=0;
        rotateAnimation.toValue=2*Double.pi;
        rotateAnimation.isRemovedOnCompletion=false;
        rotateAnimation.duration=1.0;
        rotateAnimation.repeatCount = .infinity;
        
        spinLayer?.add(rotateAnimation, forKey: nil);

    }

    func moveImage(){
        let flyImage=UIImage(named:"about.jpeg");
        flyLayer = .init();
        flyLayer?.contents=flyImage?.cgImage;
        flyLayer?.bounds=CGRect(x:0, y:0, width: 150, height: 150);
        flyLayer?.position=CGPoint(x: 0, y: 0);
        view.layer.addSublayer(flyLayer!)
        
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.timingFunction=CAMediaTimingFunction(name:.easeInEaseOut)
        moveAnimation.fromValue = NSValue.init(cgPoint:CGPoint(x: 0,y: 0));
        moveAnimation.toValue = NSValue.init(cgPoint: CGPoint(x:700,y:500));
        
        moveAnimation.isRemovedOnCompletion=false;
        moveAnimation.duration=3.0;
        //trying this line
        moveAnimation.beginTime=1.0;
        moveAnimation.repeatCount = .infinity;
        flyLayer?.add(moveAnimation,forKey: nil);
        
        
        
        
        
    }
    
    func fadeImage(){
        
        let fadeImg = UIImage(named:"settings.jpeg");
        fadeLayer = .init();
        fadeLayer?.contents = fadeImg?.cgImage;
        fadeLayer?.bounds=CGRect(x: 0, y: 0, width: 150, height: 150);
        fadeLayer?.position=CGPoint(x: 200, y: 200);
        
        view.layer.addSublayer(fadeLayer!);
        
        //setting fade animation now
        let fadeAnimation = CABasicAnimation(keyPath: "opacity");
        fadeAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut);
        fadeAnimation.fromValue = NSNumber.init(value:1.0);
        fadeAnimation.toValue = NSNumber.init(value: 0.0);
        
        //animation duration - total time to be faded away
        fadeAnimation.duration=3.0;
        //this means start fading after 1st second
        fadeAnimation.beginTime=1.0
        fadeAnimation.isAdditive=false;
        
        //now making sure that after fading out, it fades back in
        fadeAnimation.autoreverses=true;
        
       fadeAnimation.fillMode = .both
        fadeAnimation.repeatCount = .infinity;
        fadeLayer?.add(fadeAnimation,forKey: nil);
        
        
        
        
    }


}

