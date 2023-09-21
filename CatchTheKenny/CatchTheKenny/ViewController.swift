//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Nikolay Melzack on 31.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 10
    var score = 0
    var highscore = 0
    var imageArray = [UIImageView]()
    
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highscore = 0
            highscoreLabel.text = "Highscore: \(highscore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highscore = newScore
            highscoreLabel.text = "Highscore: \(highscore)"
        }
        
        image1.isUserInteractionEnabled = true
        image2.isUserInteractionEnabled = true
        image3.isUserInteractionEnabled = true
        image4.isUserInteractionEnabled = true
        image5.isUserInteractionEnabled = true
        image6.isUserInteractionEnabled = true
        image7.isUserInteractionEnabled = true
        image8.isUserInteractionEnabled = true
        image9.isUserInteractionEnabled = true
        
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseByOne))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseByOne))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseByOne))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseByOne))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseByOne))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseByOne))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseByOne))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseByOne))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseByOne))
        
        image1.addGestureRecognizer(gestureRecognizer1)
        image2.addGestureRecognizer(gestureRecognizer2)
        image3.addGestureRecognizer(gestureRecognizer3)
        image4.addGestureRecognizer(gestureRecognizer4)
        image5.addGestureRecognizer(gestureRecognizer5)
        image6.addGestureRecognizer(gestureRecognizer6)
        image7.addGestureRecognizer(gestureRecognizer7)
        image8.addGestureRecognizer(gestureRecognizer8)
        image9.addGestureRecognizer(gestureRecognizer9)
        
        imageArray = [image1,image2,image3,image4,image5,image6,image7,image8,image9]
       
        
        timeLabel.text =  "Time left: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo:nil, repeats: true)
        
        hideKenny()
        
        
    }
    
    @objc func hideKenny() {
        
        for kenny in imageArray {
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(imageArray.count-1)))
        imageArray[random].isHidden = false
        
    }
    
    @objc func increaseByOne() {
            score += 1
            scoreLabel.text = "Score: \(score)"
    }
    
    @objc func timerFunction() {
        timeLabel.text = "Time left: \(counter)"
        counter += -1
        
        if counter == -2 {
            timeLabel.text = "Time is over"
            
            for kenny in imageArray {
                kenny.isHidden = true
            }
            
            if self.score > self.highscore {
                self.highscore = self.score
                highscoreLabel.text = "Highscore: \(highscore)"
                UserDefaults.standard.set(self.highscore, forKey: "highscore")
            }
            
            let alert = UIAlertController(title: "Time is up", message: "Do you want to play again", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) {
                (UIAlertAction) in
                //replay func
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunction), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo:nil, repeats: true)
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            
            self.present(alert, animated: true)
            
            timer.invalidate()
            hideTimer.invalidate()
        }
    }
    
    @objc func restartGame() {
        timeLabel.text = "Time left:10"
        counter = 10
        
        
    }


}

