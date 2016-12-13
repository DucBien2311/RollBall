//
//  ViewController.swift
//  RollingBall
//
//  Created by NguyenDucBien on 12/8/16.
//  Copyright © 2016 NguyenDucBien. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    var run = true
    var rdy: Double = 0.0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        let time = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(runningBall), userInfo: nil, repeats: true)
        
    }
    func addBall(){
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadious = 32.0
        ball.center = CGPointMake(0,0)
        self.view.addSubview(ball)
    }
    
    func runningBall(){
        
        var deltaAngle: CGFloat = 0.1
        
        
        if (run == false){   //bóng quay theo chiều ngược lại, góc quay âm
            deltaAngle = -0.1
        }
        
        if (ball.center.x + 32.0 > self.view.bounds.width || ball.center.y + 32.0 > self.view.bounds.height){  //bóng đập lại khi chạm biên phải hoặc bên dưới
            run = false
            ballRadious = -ballRadious
            rdy = Double(arc4random_uniform(92) % 100) * 0.01

        }
        
        
        if (ball.center.x - 32.0 < 0 || ball.center.y - 32.0 < 0){  //bóng đập lại khi chạm biên trái hoặc bên trên
            run = true
            ballRadious = 32.0
            rdy = Double(arc4random_uniform(92) % 100) * 0.01
            
        }
        
        radians = radians + deltaAngle
        ball.transform = CGAffineTransformMakeRotation(radians)
        rollBall()
        
    }
    
    func rollBall()
    {
        var deltaAngle: CGFloat = 0.1
       self.ball.center = CGPointMake(self.ball.center.x + ballRadious * deltaAngle, self.ball.center.y + ballRadious * deltaAngle * CGFloat(rdy))

    }

}

