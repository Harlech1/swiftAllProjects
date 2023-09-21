//
//  CollectionViewController.swift
//  TryingToMakeACell
//
//  Created by Turker Kizilcik on 19.09.2023.
//

import UIKit

var notes : [Note] =
[
    Note(title: "Başlık 1", content: "İçerik 1"),
    Note(title: "Başlık 2", content: "İçerik 2")
]

class CollectionViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.contentLabel.text = notes[indexPath.row].content
        cell.titleLabel.text = notes[indexPath.row].title
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}



struct Note {
    let title: String
    let content: String
}
