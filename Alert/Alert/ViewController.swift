//
//  ViewController.swift
//  Alert
//
//  Created by Nikolay Melzack on 31.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordAgainText: UITextField!
    
    var x = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpClicked(_ sender: Any) {
        
        if (usernameText.text == "") {
            alertFunc(titleInput: "Error", messageInput: "Username not found")
        } else if passwordText.text == "" {
            alertFunc(titleInput: "Error", messageInput: "Password cant be blank")
        } else if passwordText.text != passwordAgainText.text {
            alertFunc(titleInput: "Error", messageInput: "Passwords dont match")
        } else {
            alertFunc(titleInput: "Success", messageInput: "You have created an account")
        }
        
        
        
    }
    
    func alertFunc(titleInput: String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            (UIAlertAction) in
            print("Button Clicked")
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

