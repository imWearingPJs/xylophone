//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //playSound1 method
import AudioToolbox //playSound2 method

class ViewController: UIViewController{
    
    var player: AVAudioPlayer? //used for playSound1 method

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        print(sender.tag)
        //playSound1()
        playSound2()
    }
    
    func playSound1(){
        guard let url = Bundle.main.url(forResource: "note1", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSound2(){
        if let soundURL = Bundle.main.url(forResource: "note2", withExtension: "wav") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            // Play
            AudioServicesPlaySystemSound(mySound);
        }
    }
  

}

