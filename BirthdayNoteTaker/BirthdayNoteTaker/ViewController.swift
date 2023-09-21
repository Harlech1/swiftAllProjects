//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Nikolay Melzack on 30.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
        
    }

    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(nameText.text, forKey: "name")
        UserDefaults.standard.set(birthdayText.text, forKey: "birthday")

        nameLabel.text =  "Name: \(nameText.text!)"
        birthdayLabel.text = "Birthday: \(birthdayText.text!)"
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if  (storedName as? String) != nil  {
         UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name :"
        }
        
        if  (storedBirthday as? String) != nil  {
         UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday :"
        }
        
        
    }
    
    
}

    
