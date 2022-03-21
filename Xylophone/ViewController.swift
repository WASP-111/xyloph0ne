//
//  ViewController.swift
//  Xylophone
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audio:AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playAlarm(soundName: sender.currentTitle!)
        
        //Уменьшает прозрачность сендера (нажатой кнопки) до половины
        sender.alpha = 0.5
        
        //Выполнение кода с задержкой в 0.2 секунды
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            //После выполнения кода возвращаем прозрачность обратно
            sender.alpha = 1.0
        }
    }
    
    func playAlarm(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        audio = AVPlayer.init(url: url!)
        audio.play()
    }
}
