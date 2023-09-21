//
//  ViewController.swift
//  isMyStoryboardActingWeird
//
//  Created by Turker Kizilcik on 17.09.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var audioPlayer : AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(playSound))
        tapGestureRecognizer.numberOfTapsRequired = 2
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
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
    }
}

