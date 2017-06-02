//
//  ActivityViewController.swift
//  Zuet
//
//  Created by Rafael Colon Maldonado on 5/31/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var time = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startTimer(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ActivityViewController.TimerAction)), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
        
        print("pause")
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        
        print("stop")
        
        timer.invalidate()
        time = 0
        timerLabel.text = "0"
    }
    
    func TimerAction()
    {
        time += 1
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        
        let formattedString = formatter.string(from: TimeInterval(time))!
        
        timerLabel.text = formattedString
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
