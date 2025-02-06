//
//  MusicViewController.swift
//  Wk5AnimationsAudio
//
//  Created by Default User on 2/6/25.
//

import UIKit
import AVFoundation;

class MusicViewController: UIViewController {
    
    @IBOutlet var sgSong : UISegmentedControl!
    @IBOutlet var volSlider:UISlider!
    
    var soundPlayer : AVAudioPlayer?;
    var songName : String="song1";
    
    @IBAction func segmentDidChange(sender:UISegmentedControl){
        if(sgSong.selectedSegmentIndex==0){
            songName="song1";
        }else if(sgSong.selectedSegmentIndex==1){
            songName="song2";
        }else{
            songName="song3";
        }
        playSong();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playSong();
    }
    
    func playSong(){
        let soundURL = Bundle.main.path(forResource: songName, ofType: "mp3");
        
        let url = URL(fileURLWithPath: soundURL!)
        
        soundPlayer = try! AVAudioPlayer.init(contentsOf: url);
        soundPlayer?.currentTime = 30;
        soundPlayer?.volume = volSlider.value;
        soundPlayer?.numberOfLoops = -1;
        soundPlayer?.play();

        
    }
    
    @IBAction func sliderValueChanged(sender:UISlider){
        soundPlayer?.volume = volSlider.value;
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
