//
//  TableViewController.swift
//  Test2
//
//  Created by Turker Kizilcik on 18.09.2023.
//

import UIKit

class TableViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var notes: [Note] = [
            Note(title: "Başlık 1", content: "İçerik 1"),
            Note(title: "Başlık 2", content: "İçerik 2"),
        ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


struct Note {
    let title: String
    let content: String
}

