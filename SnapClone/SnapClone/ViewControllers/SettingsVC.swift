//
//  SettingsVC.swift
//  SnapClone
//
//  Created by Turker Kizilcik on 10.08.2023.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func logOutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        } catch {
            
        }
    }
    
}
