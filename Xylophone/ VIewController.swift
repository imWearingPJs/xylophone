//
//  ViewController.swift
//  Xylophone
//
//  Created by Michael Kozub on 07/02/2019.
//  Copyright © Michael Kozub. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        playSound(String(sender.tag))
    }
    
    func playSound(_ notePlayed : String){
        
        let note = "note" + notePlayed
        
        let soundURL = Bundle.main.url(forResource: note , withExtension: "wav")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        } catch {
            print(error)
        }
        audioPlayer.play()
    }
  

}

