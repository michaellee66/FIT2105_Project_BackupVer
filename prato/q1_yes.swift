//
//  q1_yes.swift
//  prato
//
//  Created by ZEYU_Michael_Li on 14/07/2016.
//  Copyright © 2016 ZEYU_Michael_Li. All rights reserved.
//

import UIKit
import AVFoundation
class q1_yes: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        playBackgroundMusic("q1_response_yes")
        let OpenGif = UIImage.gifWithName("talking")
        
        // Use the UIImage in your UIImageView
        let imageView = UIImageView(image: OpenGif)
        imageView.frame = CGRect(x: 0.0, y: 70.0, width: 200.0, height: 250.0)
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - music function
    
    var backgroundMusicPlayer = AVAudioPlayer()
    
    func playBackgroundMusic(filename: String) {
        
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: "mp3")
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
            backgroundMusicPlayer.numberOfLoops = 0
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    
    func stopBackgroundMusic() {
        
        backgroundMusicPlayer.stop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
