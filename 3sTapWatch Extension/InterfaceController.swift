//
//  InterfaceController.swift
//  3sTapWatch Extension
//
//  Created by CK on 03/01/2019.
//  Copyright © 2019 CK. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    /*
     Declare variables for game control
     */
    var highScore = 0
    var taps = 0

    @IBOutlet weak var secondsSlider: WKInterfaceSlider!
    @IBOutlet weak var increaseTapButton: WKInterfaceButton!
    @IBOutlet weak var highScoreLabel: WKInterfaceLabel!
    @IBOutlet weak var tapsCounterLabel: WKInterfaceLabel!
    /*Define possible actions*/
    @IBAction func increaseTap() {
    
        if timerIsOn == false {
            startTimer()
            taps += 1
            
            tapsCounterLabel.setText(String(taps))
        }else{
            taps += 1
            tapsCounterLabel.setText(String(taps))
        }
        
    }
    
    
    /*SELF MADE TIMER*/
    var timerIsOn = false
    var time = 0
    //timer
    var timer = Timer()
    
    @IBOutlet weak var secondsLabel: WKInterfaceLabel!
    
    @IBAction func startTimer() {
        if timerIsOn == false {
            runTimer()
        }
        
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(InterfaceController.updateTimer), userInfo: nil, repeats: true)
        timerIsOn = true
    }
    
    @IBAction func stopTimer() {
        timerIsOn = false
        timer.invalidate()
    }
    
    @IBAction func resetTimer() {
        timerIsOn = false
        timer.invalidate()
        time = 0
        secondsLabel.setText("0")
    }
    

    @objc func updateTimer (){
        
        if (time == 3){//Time is UP!!
            if(taps > highScore){//NEW HIGHSCORE!!
                highScore = taps //update High Score
                highScoreLabel.setText("🏆\(highScore)")
            }
            stopTimer()
            resetTimer()
            taps = 0
           tapsCounterLabel.setText("\(taps)")
        }else{
        time += 1
        secondsLabel.setText(String(time))
        }
    }
    
    
}
