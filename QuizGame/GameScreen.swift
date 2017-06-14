//
//  GameScreen.swift
//  QuizGame
//
//  Created by Rahul Gupta on 6/11/17.
//  Copyright © 2017 Rahul Gupta. All rights reserved.
//

import UIKit

class GameScreen: UIViewController {
    
    @IBOutlet weak var lblQuestion: UILabel!
    let questions : [String] = ["What is the Sum of 2+3 ?","What is the Sum of 2+2 ?"]
    let answers : [[String]] = [["5","4","3","6"], ["8","6","4","3"]]
    let checkAnswer : [[String]] = [["T","F","F","F"], ["F","F","T","F"]]
    var getClickValue : Int!
    var getResult : Float = 0
    var timer = Timer()

    var count : Int = 0
    @IBOutlet weak var timeBar: UIProgressView!
    var time : Float = 1
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var ansA: UIButton!

    @IBOutlet weak var ansD: UIButton!
    @IBOutlet weak var ansC: UIButton!
    @IBOutlet weak var ansB: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setQuestions()
        ansA.addTarget(self, action: #selector(self.pressedAnsA), for: .touchUpInside)
        ansA.tag = 0
        ansB.addTarget(self, action: #selector(self.pressedAnsB), for: .touchUpInside)
        ansB.tag = 1
        ansC.addTarget(self, action: #selector(self.pressedAnsC), for: .touchUpInside)
        ansC.tag = 2
        ansD.addTarget(self, action: #selector(self.pressedAnsD), for: .touchUpInside)
        ansD.tag = 3

       // startProgress()

        // Do any additional setup after loading the view.
    }
    
    
    func startProgress(){
        
        time = 1
        timeBar.progress = Float(time)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(GameScreen.setProgress), userInfo: nil, repeats: true)
    }
    
    func setProgress() {
        time -= 0.1

      //  let cTime = time * 10
       // let mTime = Int(cTime)
        
        
        lblTime.text = String(describing: time)
        timeBar.progress = time
        
        if time < 0.1 {
            lblTime.text = "0"
            self.timer.invalidate()
           // UserDefaults.standard.set(getResult + time, forKey: "score")
            gotoScoreScreen()
            
        }
        
         self.timeBar.progress = Float(self.time - 0.1)
    }

    func setQuestions(){
        
        startProgress()
        lblQuestion.text = questions[count]
 
        ansA.setTitle(answers[count][0], for: .normal)
        ansB.setTitle(answers[count][1], for: .normal)
        ansC.setTitle(answers[count][2], for: .normal)
        ansD.setTitle(answers[count][3], for: .normal)
        
        ansA.backgroundColor = UIColor.clear
        ansB.backgroundColor = UIColor.clear
        ansC.backgroundColor = UIColor.clear
        ansD.backgroundColor = UIColor.clear
        
    }
    
    
    
    func pressedAnsA(sender:UIButton){
        let clickValue = sender.tag
        
        if checkAnswer[count][clickValue] == "T"{
            ansA.backgroundColor = UIColor.green
            ansB.backgroundColor = UIColor.red
            ansC.backgroundColor = UIColor.red
            ansD.backgroundColor = UIColor.red
            
            getResult = getResult + time
            UserDefaults.standard.set(getResult, forKey: "score")

           
        }else{
            ansA.backgroundColor = UIColor.red
            
        }
        self.count = self.count + 1
        if count > 1{
            self.timer.invalidate()
            gotoScoreScreen()
        }else{
            self.perform(#selector(setQuestions), with: nil, afterDelay: 2.0)
            lblTime.text = "1.0"
            self.timer.invalidate()
        }
        
        
    }

    
    func pressedAnsB(sender:UIButton){
        let clickValue = sender.tag
        
        if checkAnswer[count][clickValue] == "T"{
            ansA.backgroundColor = UIColor.red
            ansB.backgroundColor = UIColor.green
            ansC.backgroundColor = UIColor.red
            ansD.backgroundColor = UIColor.red
            
            getResult = getResult + time
            UserDefaults.standard.set(getResult, forKey: "score")

            
        }else{
            ansB.backgroundColor = UIColor.red
            
        }
        count = count + 1
        if count > 1{
            self.timer.invalidate()
            gotoScoreScreen()
        }else{
            self.perform(#selector(setQuestions), with: nil, afterDelay: 2.0)
            lblTime.text = "1.0"
            self.timer.invalidate()
        }
    }
    
    
    func pressedAnsC(sender:UIButton){
        let clickValue = sender.tag
        
        if checkAnswer[count][clickValue] == "T"{
            ansA.backgroundColor = UIColor.red
            ansB.backgroundColor = UIColor.red
            ansC.backgroundColor = UIColor.green
            ansD.backgroundColor = UIColor.red
            
            getResult = getResult + time
            UserDefaults.standard.set(getResult, forKey: "score")

            
        }else{
            ansC.backgroundColor = UIColor.red
            
        }
        count = count + 1
        if count > 1{
            self.timer.invalidate()
            gotoScoreScreen()
        }else{
            self.perform(#selector(setQuestions), with: nil, afterDelay: 2.0)
            lblTime.text = "1.0"
            self.timer.invalidate()
        }
        
    }
    
    
    func pressedAnsD(sender:UIButton){
        let clickValue = sender.tag
        
        if checkAnswer[count][clickValue] == "T"{
            ansA.backgroundColor = UIColor.red
            ansB.backgroundColor = UIColor.red
            ansC.backgroundColor = UIColor.red
            ansD.backgroundColor = UIColor.green
            
            getResult = getResult + time
            UserDefaults.standard.set(getResult, forKey: "score")

            
        }else{
            ansD.backgroundColor = UIColor.red
            
        }
        count = count + 1
        if count > 1{
            self.timer.invalidate()
            gotoScoreScreen()
        }else{
            self.perform(#selector(setQuestions), with: nil, afterDelay: 2.0)
            lblTime.text = "1.0"
            self.timer.invalidate()
        }
        
    }
    
    func gotoScoreScreen(){
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "ScoreScreen") as! ScoreScreen
        VC.score = getResult
        self.navigationController?.pushViewController(VC, animated: true)
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
