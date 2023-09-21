//
//  UploadViewController.swift
//  InstaCloneFirebase
//
//  Created by Turker Kizilcik on 6.08.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var uploadButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        
        imageView.addGestureRecognizer(imageTapRecognizer)

    }
    
    @objc func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func makeAlert(titleInput : String , messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    
    @IBAction func uploadButtonClick(_ sender: Any) {
        
        let uuid = UUID().uuidString
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("images")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let imageReference = mediaFolder.child(uuid + ".jpg")
            imageReference.putData(data) { metadata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    imageReference.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            
                            //DATABASE
                            
                            let firestoreDatabase = Firestore.firestore()
                            
                            var firestoreReference : DocumentReference? = nil
                            
                            let firestorepost = ["imageUrl" : imageUrl!,
                                                 "postedBy" : Auth.auth().currentUser!.email!,
                                                 "postComment": self.commentText.text!,
                                                 "date" : FieldValue.serverTimestamp(),
                                                 "likes" : 0]
                                                 as [String:Any]
                            
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorepost , completion: { (error) in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                                } else {
                                    self.imageView.image = UIImage(systemName: "photo")
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                        }
                    }
                }
            }
        }
    }
    
    
    

}
