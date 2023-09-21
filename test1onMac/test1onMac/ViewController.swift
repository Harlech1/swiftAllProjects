//
//  ViewController.swift
//  test1onMac
//
//  Created by Nikolay Melzack on 15.09.2023.
//

// sign up düzgün align'lanmadı.(dışa çıktı)
// untrusted developer(muhabbeti)
// kilit resmi parolaya basınca değişebilir.

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var fakeSignUpButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var passwordMain = ""
    var passwordFake = ""
    
    let lightBlueColor = UIColor(red: 42/255, green: 32/255, blue: 205/255, alpha: 1.0)
    
    var audioPlayer : AVAudioPlayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        welcomeLabel.adjustsFontSizeToFitWidth = true
        welcomeLabel.minimumScaleFactor = 0.5
    
        passwordTextField.layer.borderWidth = 1.0 // Çerçeve kalınlığı
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.layer.cornerRadius = 12
        passwordTextField.layer.borderColor = lightBlueColor.cgColor
        passwordTextField.textColor = UIColor.systemBlue
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        
        let showHideButton = UIButton(type: .custom)
        showHideButton.tintColor = lightBlueColor
        showHideButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        showHideButton.frame = CGRect(x: 0, y: 0 , width: 25, height: 25)
        showHideButton.translatesAutoresizingMaskIntoConstraints = false
        showHideButton.addTarget(self, action: #selector(eyeButtonClickedOnMyOwn), for: .touchUpInside)
        
        passwordTextField.rightView = showHideButton
        passwordTextField.rightViewMode = .always
        
        startAnimation()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(playSound))
            tapGestureRecognizer.numberOfTapsRequired = 2
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            
        let hasPassword = checkIfPasswordExists(password: "userPassword25")
            
        passwordTextField.text = ""
        
        signUpButton.isHidden = hasPassword
        signInButton.isHidden = !hasPassword
    }
    
    @objc func playSound() {
        
        guard let soundURL = Bundle.main.url(forResource: "crow", withExtension: "wav") else {
            return
        }

        do {
            // AVAudioPlayer nesnesini oluştur
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Ses dosyası çalınamadı: \(error.localizedDescription)")
        }
        
        print("yo")
    }
    
    //anladım /// yok
    @objc func eyeButtonClickedOnMyOwn(UIButton : UIButton) {
        if UIButton.currentImage == UIImage(systemName: "eye") {
            UIButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            togglePasswordVisibility()
        } else if UIButton.currentImage == UIImage(systemName: "eye.slash"){
            UIButton.setImage(UIImage(systemName: "eye"), for: .normal)
            togglePasswordVisibility()
        }
    }
    
    //anladım /// yok
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //anladım /// yok
    @objc func togglePasswordVisibility() {
            passwordTextField.isSecureTextEntry.toggle()
        }
    
    //anladım /// yok
    @objc func startAnimation() {
        
        UIView.animate(withDuration: 1, animations: {
            self.imageView.alpha = 1.0
            }) { (completed) in
                UIView.animate(withDuration: 1, animations: {
                    self.imageView.alpha = 0.75
                }) { (completed) in
                    // İkinci animasyon tamamlandığında, startAnimation'ı tekrar çağır
                    self.startAnimation()
                }
            }
    }
    
    //anladım /// main ve fake var
    @IBAction func signInButtonClicked(_ sender: Any) {
        let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: "userPassword25",
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
                kSecAttrAccount as String: "userPasswordFake22",
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
                passwordTextField.text = ""
            }
    }
    
    //anladım /// main var
    @IBAction func signUpButtonClicked(_ sender: Any) {
        if (passwordTextField.text?.count ?? 0) >= 4 {
                    if let password = passwordTextField.text {
                        let passwordData = password.data(using: .utf8)!
                        let query: [String: Any] = [
                            kSecClass as String: kSecClassGenericPassword,
                            kSecAttrAccount as String: "userPassword25",
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
    
    //anladım /// fake var
    @IBAction func fakeSignUpButtonClicked(_ sender: Any) {
        if passwordTextField.text != passwordMain {
                    if (passwordTextField.text?.count ?? 0) >= 4 {
                        if let password = passwordTextField.text {
                            
                            let passwordData = password.data(using: .utf8)!
                            let query: [String: Any] = [
                                kSecClass as String: kSecClassGenericPassword,
                                kSecAttrAccount as String: "userPasswordFake22",
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
    
    //anladım /// yok
    func makeAlert(titleInput: String, messageInput : String) {
            let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
            
    //anladım /// yok
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
            
    //anladım /// yok
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

