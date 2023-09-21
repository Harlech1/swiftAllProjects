//
//  DetailsVC.swift
//  Landmark
//
//  Created by Nikolay Melzack on 31.07.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage

        // Do any additional setup after loading the view.
    }
    

  

}
