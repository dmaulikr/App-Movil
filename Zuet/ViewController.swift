//
//  ViewController.swift
//  Zuet
//
//  Created by Rafael Colon Maldonado on 5/31/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import UIKit

class RutineViewController: UITableViewController,madeRutine {
    
    var exercise: [rutine] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exercise.append(rutine(title: "Cardio Rutine", image: #imageLiteral(resourceName: "cardioRutine"), exercise: ["Squats with Arms Overhead", "Bridges", "Plank with Shoulder Touches", "Mountain Climbers", "Burpees","Squat Jumps","Skier Jumps","Pilates 100","Downward Dog","Cat and Cow","Warrior II"]))
        exercise.append(rutine(title: "Arm Rutine", image: #imageLiteral(resourceName: "armsRutine"), exercise: ["Standing V Raise", "Shoulder Press", "Rotating Triceps Kickback", "Plank Ups", "Push Up", "Triceps Dip", "Plank Taps", "Plank Jacks"]))
        exercise.append(rutine(title: "Legs Rutine", image: #imageLiteral(resourceName: "Legs"), exercise: ["Reverse Lunges", "Squats", "Side Lunges", "Curtsy Lunges"]))

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exercise.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "rutines", for: indexPath)
        
        let label = cell.viewWithTag(5) as! UILabel
        let imageView = cell.viewWithTag(2) as! UIImageView
        
        imageView.image = exercise[indexPath.row].image
        label.text = exercise[indexPath.row].title
        
        return cell
    }
    
    func madeRutine(rutines: rutine) {
        print(rutines)
        exercise.append(rutine(title: rutines.title, image: rutines.image, exercise: rutines.exercise))
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: exercise.count-1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "exVC"{
        let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath!
        
            let destinationVC = segue.destination as! ExerciseViewController
            
            var array: rutine
            
            array = exercise[indexPath.row]
            
            destinationVC.exercise = array.exercise
        } else if segue.identifier == "addVC" {
            let addingVC = segue.destination as! AddViewController
            addingVC.delegate = self
        }
        
    }
    
}

