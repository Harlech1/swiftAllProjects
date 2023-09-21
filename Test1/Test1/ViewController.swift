//
//  ViewController.swift
//  Test1
//
//  Created by Turker Kizilcik on 13.08.2023.
//

import UIKit
import Security

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var fakeSignUpButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    //silinecek
    @IBOutlet weak var debugLabel: UILabel!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    //local olarak korumaya yarıyor.
    var passwordMain = ""
    var passwordFake = ""
    
    // gesture recognize'dan klavye'dışına basınca çıkma muhabbeti
    // sign up düzgün align'lanmadı.(dışa çıktı)
    // untrusted developer(muhabbeti)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.textColor = UIColor.systemBlue
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        
        startAnimation()

        debugLabel.isHidden = true
    }
    
    //anladım
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let hasPassword = checkIfPasswordExists(password: "userPassword20")
        
        passwordTextField.text = ""
        
        signUpButton.isHidden = hasPassword
        signInButton.isHidden = !hasPassword
    }
    
    //anladım
    @objc func startAnimation() {
        
        UIView.animate(withDuration: 1, animations: {
            self.imageView.alpha = 1.0
         }) { (completed) in
             UIView.animate(withDuration: 1, animations: {
                 self.imageView.alpha = 0.8
             }) { (completed) in
                 // İkinci animasyon tamamlandığında, startAnimation'ı tekrar çağır
                 self.startAnimation()
             }
         }
    }
    
    //anladım ---"orta düzeyde bir sıkıntı var kod güzelleştirilmeli"---
    @IBAction func signInButtonClicked(_ sender: Any) {
    
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: "userPassword20",
        kSecReturnData as String: kCFBooleanTrue!,
        kSecMatchLimit as String: kSecMatchLimitOne
    ]
    
    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)
    
    if status == errSecSuccess,
        let passwordData = item as? Data,
        let password = String(data: passwordData, encoding: .utf8) {
        passwordMain = password
        print("Alınan parola: \(password)")
    } else {
        print("Parola bulunamadı veya alınamadı. Hata kodu: \(status)")
    }
    
    let query1: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrAccount as String: "userPasswordFake17",
        kSecReturnData as String: kCFBooleanTrue!,
        kSecMatchLimit as String: kSecMatchLimitOne
    ]
    
    var item1: CFTypeRef?
    let status1 = SecItemCopyMatching(query1 as CFDictionary, &item1)
    
    if status1 == errSecSuccess,
        let passwordData = item1 as? Data,
        let password = String(data: passwordData, encoding: .utf8) {
        passwordFake = password
        print("Alınan parola: \(password)")
    } else {
        print("Parola bulunamadı veya alınamadı. Hata kodu: \(status)")
    }
    
    if passwordTextField.text == passwordMain {
        performSegue(withIdentifier: "toList", sender: "normal")
    } else if passwordTextField.text == passwordFake {
        performSegue(withIdentifier: "toList", sender: "fake")
    } else {
        makeAlert(titleInput: "Error", messageInput: "Passwords doesn't match.")
    }
    
}
    
    //anladım
    @IBAction func signUpButtonClicked(_ sender: Any) {
        
        if (passwordTextField.text?.count ?? 0) >= 4 {
            if let password = passwordTextField.text {
                let passwordData = password.data(using: .utf8)!
                let query: [String: Any] = [
                    kSecClass as String: kSecClassGenericPassword,
                    kSecAttrAccount as String: "userPassword20",
                    kSecValueData as String: passwordData
                ]
                
                let status = SecItemAdd(query as CFDictionary, nil)
                
                switch status {
                case errSecSuccess:
                    makeAlertWithAction(titleInput: "Welcome to Encrypted Notebook!", messageInput: "Second alanı açayım mı?")
                    signUpButton.isHidden = true
                    signInButton.isHidden = false
                    passwordMain = password
                case errSecDuplicateItem:
                    makeAlert(titleInput: "Error", messageInput: "This item already exists in the Keychain.")
                case errSecItemNotFound:
                    makeAlert(titleInput: "Error", messageInput: "The specified item could not be found in the Keychain.")
                case errSecAuthFailed:
                    makeAlert(titleInput: "Error", messageInput: "Authentication failed. Incorrect password or missing authorization.")
                case errSecDecode:
                    makeAlert(titleInput: "Error", messageInput: "Data decoding error.")
                case errSecParam:
                    makeAlert(titleInput: "Error", messageInput: "Invalid parameter error.")
                case errSecNotAvailable:
                    makeAlert(titleInput: "Error", messageInput: "Keychain services are not available.")
                case errSecUserCanceled:
                    makeAlert(titleInput: "Error", messageInput: "The user canceled the operation.")
                case errSecInteractionNotAllowed:
                    makeAlert(titleInput: "Error", messageInput: "User interaction is not allowed.")
                case errSecUnimplemented:
                    makeAlert(titleInput: "Error", messageInput: "Operation is not yet implemented or supported.")
                default:
                    makeAlert(titleInput: "Error", messageInput: "Unknown error occurred.")
                }
            }
        } else {
            makeAlert(titleInput: "Password can't be shorter than 4 characters!", messageInput: "Try another password.")
        }
    }
        
    //anladım
    @IBAction func fakeSignUpButtonClicked(_ sender: Any) {
        
        if passwordTextField.text != passwordMain {
            if (passwordTextField.text?.count ?? 0) >= 4 {
                if let password = passwordTextField.text {
                    
                    let passwordData = password.data(using: .utf8)!
                    let query: [String: Any] = [
                        kSecClass as String: kSecClassGenericPassword,
                        kSecAttrAccount as String: "userPasswordFake17",
                        kSecValueData as String: passwordData
                    ]
                    
                    let status = SecItemAdd(query as CFDictionary, nil)
                    
                    switch status {
                    case errSecSuccess:
                        makeAlert(titleInput: "Success", messageInput: "Operation completed successfully.")
                        signUpButton.isHidden = true
                        signInButton.isHidden = false
                        passwordFake = password
                        fakeSignUpButton.isHidden = true
                    case errSecDuplicateItem:
                        makeAlert(titleInput: "Error", messageInput: "This item already exists in the Keychain.")
                    case errSecItemNotFound:
                        makeAlert(titleInput: "Error", messageInput: "The specified item could not be found in the Keychain.")
                    case errSecAuthFailed:
                        makeAlert(titleInput: "Error", messageInput: "Authentication failed. Incorrect password or missing authorization.")
                    case errSecDecode:
                        makeAlert(titleInput: "Error", messageInput: "Data decoding error.")
                    case errSecParam:
                        makeAlert(titleInput: "Error", messageInput: "Invalid parameter error.")
                    case errSecNotAvailable:
                        makeAlert(titleInput: "Error", messageInput: "Keychain services are not available.")
                    case errSecUserCanceled:
                        makeAlert(titleInput: "Error", messageInput: "The user canceled the operation.")
                    case errSecInteractionNotAllowed:
                        makeAlert(titleInput: "Error", messageInput: "User interaction is not allowed.")
                    case errSecUnimplemented:
                        makeAlert(titleInput: "Error", messageInput: "Operation is not yet implemented or supported.")
                    default:
                        makeAlert(titleInput: "Error", messageInput: "Unknown error occurred.")
                    }
                }
            } else {
                makeAlert(titleInput: "Password can't be shorter than 4 characters!", messageInput: "Try another password.")
            }
        } else {
            makeAlert(titleInput: "This is the password for the first space", messageInput: "Select another password.")
        }
        
    }
    
    //anladım
    func makeAlert(titleInput: String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
        
    //anladım
    func makeAlertWithAction(titleInput: String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let noButton = UIAlertAction(title: "No", style: UIAlertAction.Style.default)
        let yesButton = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
            (UIAlertAction) in
            self.fakeSignUpButton.isHidden = false
            self.signInButton.isHidden = true
        }
        alert.addAction(yesButton)
        alert.addAction(noButton)
        self.present(alert, animated: true, completion: nil)
    }
        
    //anladım
    func checkIfPasswordExists(password : String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: password,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        return status == errSecSuccess
    }
}
