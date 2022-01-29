//
//  ViewController.swift
//  ApplicationStopWatch
//
//  Created by Adilet on 29/1/22.
//

import UIKit

class ViewController: UIViewController {
/*First page og timer*/
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    

    
    @IBAction func resetTapped(_ sender: Any) {
        self.count = 0
        self.timer.invalidate()
        self.timerLabel.text = self .makeTimeString(hours: 0, minutes: 0, seconds: 0)
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        timerCounting = false
        timer.invalidate()
    }
    
    
    @IBAction func startTapped(_ sender: Any) {
        timerCounting = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounter() -> Void{
        count += 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int){
        return ((seconds/3600),((seconds%3600)/60),((seconds%3600)%60))
    }
    
    func makeTimeString(hours:Int, minutes:Int, seconds:Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += ":"
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    //***********************//***********************//***********************//***********************//***********************//*****
    @IBOutlet weak var timerView : UIView!
    @IBOutlet weak var stopWatchView : UIView!
    @IBOutlet weak var secondResetButton: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var secondStartButton: UIButton!
    @IBOutlet weak var secondStopButton: UIButton!
    @IBOutlet weak var secondTimerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        if secondTimerLabel == nil {
//            return
//        }
//        secondTimerLabel.text = ""
        pickerView?.dataSource = self
        
    }
    
    @IBAction func secondStartTapped(_ sender: Any) {
        pickerView.alpha = 0
    }
    
    @IBAction func secondStopTapped(_ sender: Any) {
        pickerView.alpha = 1
    }
    
    @IBAction func secondResetTapped(_ sender: Any) {
        pickerView.alpha = 1
    }
    @IBAction func switchViews (_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            timerView.alpha = 1
            stopWatchView.alpha = 0
        }
        else{
            timerView.alpha = 0
            stopWatchView.alpha = 1
        }
    }
    
    
    
    
    
    
}

extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return 5
    }
    
    
}
//extension ViewCon troller:UIPickerViewDelegate {
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "Hi"
//    }
//}
