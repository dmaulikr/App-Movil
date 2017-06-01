//
//  ExerciesViewController.swift
//  CollectionViewProgram
//
//  Created by Rafael Colon Maldonado on 5/18/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import UIKit

class ExerciesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBOutlet weak var label: UILabel!
    
    var time = 0
    var timer = Timer()
    
    
    @IBAction func playButton(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ExerciesViewController.TimerAction)), userInfo: nil, repeats: true)
    }
    
    
    
    @IBAction func pauseButton(_ sender: Any) {
        
        timer.invalidate()
        
        print("pause")
    }
    
    @IBAction func stopButton(_ sender: Any) {
        print("stop")
        
        
        
    }
    
    func TimerAction()
    {
        time += 1
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        
        let formattedString = formatter.string(from: TimeInterval(time))!
        
      
        label.text = formattedString
        
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
