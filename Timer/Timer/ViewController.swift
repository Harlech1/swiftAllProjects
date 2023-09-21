//
//  ViewController.swift
//  Timer
//
//  Created by Nikolay Melzack on 31.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var counter = 0
    
    
    // command + lefrtclick
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        counter = 10
        timeLabel.text =  "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunction() {
        timeLabel.text = "Time left: \(counter)"
        counter += -1
        
        if counter == -1 {
            timeLabel.text = "Time is over"
            timer.invalidate()
        }
    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        print("clicked")
    }
    
}

