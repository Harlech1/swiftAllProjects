//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Nikolay Melzack on 31.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    var isPic = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func changePic() {
        
        
        
        if isPic == true {
            imageView.image = UIImage(named: "Unknown-1")
            myLabel.text = "Sewerslvt Album"
            isPic = false
        } else {
            imageView.image = UIImage(named: "Unknown")
            myLabel.text = "Sewerslvt Pic"
            isPic = true
        }
        
    }

}

