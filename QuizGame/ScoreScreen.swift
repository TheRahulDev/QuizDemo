//
//  ScoreScreen.swift
//  QuizGame
//
//  Created by Rahul Gupta on 6/12/17.
//  Copyright © 2017 Rahul Gupta. All rights reserved.
//

import UIKit

class ScoreScreen: UIViewController {

    @IBOutlet weak var lblScore: UILabel!
    
    var score : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //  let scoreL = UserDefaults.standard.float(forKey: "score")
        
        lblScore.text = String(describing: score)
        
        
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
