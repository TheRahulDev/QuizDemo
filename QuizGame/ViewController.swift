//
//  ViewController.swift
//  QuizGame
//
//  Created by Rahul Gupta on 6/11/17.
//  Copyright © 2017 Rahul Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func pressA(_ sender: Any) {
        self.gotoGameScreen()
    }
   
    @IBAction func pressB(_ sender: Any) {
        self.gotoGameScreen()
    }
    @IBAction func pressC(_ sender: Any) {
        self.gotoGameScreen()
    }
    @IBAction func pressD(_ sender: Any) {
        self.gotoGameScreen()
    }
    
    func gotoGameScreen(){
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "GameScreen") as! GameScreen
        self.navigationController?.pushViewController(VC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

