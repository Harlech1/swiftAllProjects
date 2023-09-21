//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Nikolay Melzack on 31.07.2023.
//

import UIKit

class SecondViewController: UIViewController
{
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = myName 
    }
    
    
    
    

}
