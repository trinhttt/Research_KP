//
//  PlayMusicViewController.swift
//  PlayMusic
//
//  Created by Trinh Thai on 10/5/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit
import AVFoundation

class PlayMusicViewController: UIViewController {

    @IBOutlet weak var ibImage: UIImageView!
    @IBOutlet weak var ibVolumnSlider: UISlider!
    
    var timer: Timer!
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
        player?.stop()
    }
    
    func setupView() {
        rotateImage()
        playSound()
    }
    
    func rotateImage() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (finish) in
            self.ibImage.transform = self.ibImage.transform.rotated(by: .pi/360)
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "Buoc-Qua-Doi-Nhau-Le-Bao-Binh", withExtension: "mp3") else { return }
        
        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func ibBackTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
