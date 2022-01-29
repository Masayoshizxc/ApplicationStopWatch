//
//  ViewController.swift
//  ApplicationStopWatch
//
//  Created by Adilet on 29/1/22.
//

import UIKit

class ViewController: UIViewController {
/*First page of timer*/
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    var clickCheck:Int = 0
    
    @IBOutlet weak var imageOfStopWatch: UIImageView!
    
    @IBOutlet weak var imageOfTimer: UIImageView!
    
    @IBAction func resetTapped(_ sender: Any) {
        clickCheck = 0
        
        self.count = 0
        self.timer.invalidate()
        self.timerLabel.text = self .makeTimeString(hours: 0, minutes: 0, seconds: 0)
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        clickCheck = 0
        timerCounting = false
        timer.invalidate()
        
    }
    

    @IBAction func startTapped(_ sender: Any) {
        if(clickCheck==0){
        timerCounting = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)}
        clickCheck += 1
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
        pickerView?.delegate = self
    }
    
    @IBAction func secondStartTapped(_ sender: Any) {
        pickerView.isHidden = true
//        secondTimerLabel.text =
    }
//    func returningPickerViewValues (values: Int) -> (Int,Int,Int){
//        return ()
//    }
    @IBAction func secondStopTapped(_ sender: Any) {
        pickerView.isHidden = false
    }
    var checkSelect = 0
    @IBAction func secondResetTapped(_ sender: Any) {
        secondTimerLabel.text = "00:00:00"
        pickerView.isHidden = false
        checkSelect = 1
        pickerView.reloadComponent(0)
        pickerView.reloadComponent(1)
        pickerView.reloadComponent(2)
    }
    @IBAction func switchViews (_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            imageOfStopWatch.isHidden = true
            imageOfTimer.isHidden = false
            timerView.alpha = 1
            stopWatchView.alpha = 0
        }
        else{
            imageOfStopWatch.isHidden = false
            imageOfTimer.isHidden = true
            timerView.alpha = 0
            stopWatchView.alpha = 1
            imageOfStopWatch.alpha = 1
        }
    }
    let hours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
    let minutes = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25","26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]
    let seconds = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25","26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"]
    
    
    
}

extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return hours.count
        }
        if component == 1 {
//            let pickMinutes = pickerView.selectedRow(inComponent: 0)
//            return hours[pickMinutes].minutes.count
            return minutes.count
        }
        else {
            return seconds.count
        }
    }
    
    
}
extension ViewController:UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return hours[row]
        }
        if component == 1 {
//            let pickMinutes = pickerView.selectedRow(inComponent: 0)
//            return hours[pickMinutes].minutes.count
            return minutes[row]
        }
        else {
            return seconds[row]
        }    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var timeToHours = hours[pickerView.selectedRow(inComponent: 0)]
        var timeToMinutes = minutes[pickerView.selectedRow(inComponent: 1)]
        var timeToSeconds = seconds[pickerView.selectedRow(inComponent: 2)]
        if component == 0{
            timeToHours = hours[row]}
        
        if component == 1{
            timeToMinutes = minutes[row]}
        
        if component == 2 {
            timeToSeconds = seconds[row]}
        if(timeToHours.count<2){
            timeToHours = "0" + timeToHours
        }
        if(timeToMinutes.count<2){
            timeToMinutes = "0" + timeToMinutes
        }
        if(timeToSeconds.count<2){
            timeToSeconds = "0" + timeToSeconds
        }
        
        secondTimerLabel.text = "\(timeToHours):\(timeToMinutes):\(timeToSeconds)"
    }
}
