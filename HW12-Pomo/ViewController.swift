//
//  ViewController.swift
//  HW12-Pomo
//
//  Created by Gerbilin Mac on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var infoLable: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
//    let frontProgressLayer = CAShapeLayer()
//    let backProgressLayer = CAShapeLayer()
//    let animation = CABasicAnimation(keyPath: "storkeEnd")
    
    var isStarted = false
    var isWorkTime = true
    
    var timer = Timer()
    var timeCount = Metric.timeCountWork
    
//    var animationStarted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        drawBackLayer()
        infoLable.text = "Work Time"
        infoLable.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        timeLable.text = Strings.timeLableWork
        timeCount = Metric.timeCountWork
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
//        cancelButton.isEnabled = true
//        cancelButton.alpha = 1.0
        
        if !isStarted {
            startTimer()
            isStarted = true
            startButton.setTitle("Pause", for: .normal)
            startButton.setTitleColor(UIColor.orange, for: .normal)
            
        } else {
            timer.invalidate()
            isStarted = false
            startButton.setTitle("Resume", for: .normal)
            startButton.setTitleColor(UIColor.white, for: .normal)
            
            infoLable.text = "Pause"
            infoLable.textColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {

        timer.invalidate()
        cancelButton.isEnabled = false
        cancelButton.alpha = 0.5
        
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(UIColor.systemGreen, for: .normal)
        
        timeCount = Metric.timeCountWork
        timeLable.text = Strings.timeLableWork
        isStarted = false
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if timeCount < 1 {
            
            startButton.setTitle("Start", for: .normal)
            startButton.setTitleColor(UIColor.green, for: .normal)
            timer.invalidate()
            
            isStarted = false
            isWorkTime.toggle()
            
            if isWorkTime {
                infoLable.text = "Work Time"
                infoLable.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
                timeLable.text = Strings.timeLableWork
                timeCount = Metric.timeCountWork
            } else {
                infoLable.text = "Relax"
                infoLable.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                timeLable.text = Strings.timeLableRelax
                timeCount = Metric.timeCountRelax
            }
            
        } else {
            timeCount -= 1
            timeLable.text = timeFormat()
        }
    }
    
    func timeFormat() -> String {
        let minutes = Int(timeCount) / 60 % 60
        let seconds = Int(timeCount) % 60
    
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
}

extension ViewController {

    enum Metric {
        static let timeCountWork = 5
        static let timeCountRelax = 5
    }

    enum Strings {
        static let timeLableWork = "25:00"
        static let timeLableRelax = "5:00"
    }
    
    
}

