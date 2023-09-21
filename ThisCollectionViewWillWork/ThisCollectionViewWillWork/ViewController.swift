//
//  ViewController.swift
//  ThisCollectionViewWillWork
//
//  Created by Nikolay Melzack on 19.09.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    let cats = ["cat1", "cat2", "cat3"]
    
    let titles = ["Ev 1", "Ev 2", "Ev 3", "Kredi Kardım","centerlandı mı iyice","selamscroll1",
                  "selamscroll1",
                  "selamscroll1",
                  "selamscroll1","uzunluktesti526236234"]
    let contents = ["Ev1, insanların hayatlarını yaşadığı, güvende hissettiği, dinlendiği ve anılar biriktirdiği özel bir mekandır. Ev, sadece fiziksel bir yapı değil, aynı zamanda içinde yaşayanların duyguları, deneyimleri ve kimlikleriyle şekillenen bir yaşam alanıdır.", "Ev2, insanların hayatlarını yaşadığı, güvende hissettiği, dinlendiği ve anılar biriktirdiği özel bir mekandır. Ev, sadece fiziksel bir yapı değil, aynı zamanda içinde yaşayanların duyguları, deneyimleri ve kimlikleriyle şekillenen bir yaşam alanıdır.", "Ev3, insanların hayatlarını yaşadığı, güvende hissettiği, dinlendiği ve anılar biriktirdiği özel bir mekandır. Ev, sadece fiziksel bir yapı değil, aynı zamanda içinde yaşayanların duyguları, deneyimleri ve kimlikleriyle şekillenen bir yaşam alanıdır.", "Kart ismim: Türker, Kart Numaram : 5100 2353 5392 1250, Kart Son Tarihim 13/19","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec in nulla in neque blandit scelerisque pretium et ante. Phasellus quis elit laoreet, consectetur ex ut, pretium nisi. Etiam cursus ut ex et laoreet. Quisque blandit vestibulum elementum. Suspendisse sodales vehicula interdum", "kısa olsa nolur ki","selamscroll1","selamscroll1","selamscroll1","selamscroll1"]
    
    var collectionView : UICollectionView!

    override func viewDidLoad() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.addSubview(collectionView!)
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(nextButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func nextButtonTapped() {
            performSegue(withIdentifier: "toNoteCreator", sender: self)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.titleLabel.text = titles[indexPath.row]
        cell.contentLabel.text = contents[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 5
        let height: CGFloat = 150
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedIndexPath = indexPath
                print("Tapped cell at section \(selectedIndexPath.section), item \(selectedIndexPath.item)")
                
                // Segue'yi çağır
                performSegue(withIdentifier: "toNoteCreator", sender: nil)
    }

}

class CustomCell : UICollectionViewCell {
    
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    let labelsContainerView = UIView()
    let scrollView = UIScrollView()
    let titleNotesLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        // Add the scrollView to the main view
        addSubview(scrollView)

        // Set constraints for the scrollView to cover the whole view
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        // Add labelsContainerView to the scrollView
        scrollView.addSubview(labelsContainerView)

        // Set constraints for labelsContainerView inside the scrollView
        NSLayoutConstraint.activate([
            labelsContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            labelsContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            labelsContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            labelsContainerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            labelsContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        
            labelsContainerView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(labelsContainerView)
            
            // Add title label to the container view
            labelsContainerView.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            // Add content label to the container view
            labelsContainerView.addSubview(contentLabel)
            contentLabel.translatesAutoresizingMaskIntoConstraints = false
            contentLabel.numberOfLines = 0  // Allow multiple lines
            
            // Set constraints for labelsContainerView
            labelsContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            labelsContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            labelsContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
            labelsContainerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            
            // Set corner radius for the container view (to make it round)
            labelsContainerView.layer.cornerRadius = 10
            labelsContainerView.layer.backgroundColor = CGColor(red: 42/255, green: 32/255, blue: 205/255, alpha: 1.0)
            labelsContainerView.layer.masksToBounds = true
            
        // Set title label constraints
        titleLabel.topAnchor.constraint(equalTo: labelsContainerView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: labelsContainerView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: labelsContainerView.trailingAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true  // Set title label height


        // Set content label constraints
        let contentTopConstraint = contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0)
        contentTopConstraint.priority = UILayoutPriority(999)  // Set a lower priority for this constraint

        let contentBottomConstraint = contentLabel.bottomAnchor.constraint(lessThanOrEqualTo: labelsContainerView.bottomAnchor, constant: -10)
        contentBottomConstraint.priority = UILayoutPriority(999)  // Set a lower priority for this constraint

        contentTopConstraint.isActive = true
        contentBottomConstraint.isActive = true

        contentLabel.leadingAnchor.constraint(equalTo: labelsContainerView.leadingAnchor, constant: 10).isActive = true  // Adjust the constant value as needed
        contentLabel.trailingAnchor.constraint(equalTo: labelsContainerView.trailingAnchor, constant: -10).isActive = true
        
        



            // Additional configurations (if needed)
            titleLabel.textColor = UIColor.white
            titleLabel.textAlignment = .center
            contentLabel.textColor = UIColor.gray
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

