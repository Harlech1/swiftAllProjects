//
//  ViewController.swift
//  SegueApp
//
//  Created by Nikolay Melzack on 31.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var userName = ""

    @IBOutlet weak var myLabel: UILabel!
    
    
    @IBOutlet weak var nameText: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad called")
        nameText.text = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDiss called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWilldiss called")
    }
              
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear called")
        nameText.text = ""
    }
              
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear called")
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        userName = nameText.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName
        }
    }
    


}

