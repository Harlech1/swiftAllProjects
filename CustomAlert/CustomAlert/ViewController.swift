//
//  ViewController.swift
//  CustomAlert
//
//  Created by Turker Kizilcik on 15.08.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        let button = UIButton(type: .system)
        button.setTitle("Show Alert", for: .normal)
        button.addTarget(self, action: #selector(showCustomAlert), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func showCustomAlert() {
        let customAlert = UIAlertController(title: "Cat", message: "\n\n\n\n\n\n", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Pet", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "Kill", style: .default) { _ in
            // Handle confirm action
        }
        
        customAlert.addAction(cancelAction)
        customAlert.addAction(confirmAction)
        
        // Create and add UIImageView
        let image = UIImage(named: "cutecat")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        customAlert.view.addSubview(imageView)
        
        // Add constraints for UIImageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: customAlert.view.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: customAlert.view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100), // Adjust the width as needed
            imageView.heightAnchor.constraint(equalToConstant: 100) // Adjust the height as needed
        ])
        
        present(customAlert, animated: true, completion: nil)
    }
}

