//
//  LaunchScreen.swift
//  QuizGame
//
//  Created by Rahul Gupta on 6/11/17.
//  Copyright © 2017 Rahul Gupta. All rights reserved.
//

import UIKit

class LaunchScreen: UIViewController {

    @IBOutlet weak var imgQuiz: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        let fullRotation = CGFloat(Double.pi * 2)
        let duration = 2.0
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions.calculationModeLinear
        
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: options, animations: {
            // each keyframe needs to be added here
            // within each keyframe the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
                // start at 0.00s (5s × 0)
                // duration 1.67s (5s × 1/3)
                // end at   1.67s (0.00s + 1.67s)
                self.imgQuiz.transform = CGAffineTransform(rotationAngle: 1/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                self.imgQuiz.transform = CGAffineTransform(rotationAngle: 2/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                self.imgQuiz.transform = CGAffineTransform(rotationAngle: 3/3 * fullRotation)
            })
            
        },completion: {finished in
            // any code entered here will be applied
            // once the animation has completed
            UIView.animate(withDuration: 0.0,  animations: {
                
                self.perform(#selector(LaunchScreen.gotoAnotherPage), with: nil, afterDelay: 2.0)
            })
            
        })
        
        
       
    }
    
    func gotoAnotherPage(){
        
        performSegue(withIdentifier: "HomeScreen", sender: self)
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
