//
//  ViewController.swift
//  RollingBall
//
//  Created by NguyenDucBien on 12/8/16.
//  Copyright © 2016 NguyenDucBien. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    var right: Bool = true
    var direct: CGFloat = 1
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        playSong()
        
        let time = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(changeDirection), userInfo: nil, repeats: true)
        
    }
    
    func addBall()
    {
        let mainViewSize = self.view.bounds.size
        
        ball = UIImageView(image: UIImage(named: "ball"))
        ballRadious = 32.0
        ball.center = CGPointMake(ballRadious,mainViewSize.height * 0.5)
        self.view.addSubview(ball)
        
        
    }
    func rollBall()
    {
        var deltaAngle: CGFloat = 0.1
        radians = radians + deltaAngle
        ball.transform = CGAffineTransformMakeRotation(radians)
        
        
        self.ball.center = CGPointMake(self.ball.center.x + ballRadious * deltaAngle, self.ball.center.y + (ballRadious * deltaAngle) * direct )
        
        
        if ball.center.x + 32 > self.view.bounds.width
        {
            deltaAngle = -0.1
            right = false
        }
    }
    
    
    func ballRoll()
    {
        var deltaAngle: CGFloat = -0.1
        radians = radians + deltaAngle
        ball.transform = CGAffineTransformMakeRotation(radians)
        
        
        self.ball.center = CGPointMake(self.ball.center.x + ballRadious * deltaAngle, self.ball.center.y - (ballRadious * deltaAngle) * direct )
        
        
        if ball.center.x - 32 < 0        {
            deltaAngle = 0.1
            right = true
        }
    }
    
    
    func changeDirection()
    {
        if right
        {
            changeDirect()
            rollBall()
        }
        else
        {
            changeDirect()
            ballRoll()
        }
    }
    
    
    func changeDirect()
    {
        if ball.center.y + 32 > self.view.bounds.height
        {
            direct = -1
        }
        else if ball.center.y - 32 < 0        {
            direct = 1
        }
    }
    
    
    func playSong (){
        let filePath = NSBundle.mainBundle().pathForResource("Brazil-2014", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    
}

