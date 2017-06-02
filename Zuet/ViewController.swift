//
//  ViewController.swift
//  Zuet
//
//  Created by Rafael Colon Maldonado on 5/31/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import UIKit

class RutineViewController: UITableViewController {
    
    var exercise: [rutine] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exercise.append(rutine(title: "Cardio Rutine", image: #imageLiteral(resourceName: "cardioRutine"), exercise:["Spot Jogging", "Squat Jumps", "Jumping Jacks", "Burpees", "Cross Crawl"]))
        exercise.append(rutine(title: "Arm Rutine", image: #imageLiteral(resourceName: "armsRutine"), exercise: ["Plank Ups", "Inchworm", "Push Up", "Plank Taps", "Lateral Plank Walks", "Plank Jacks", "Burpee With Push Up"]))
       // exercise.append(rutine(title: "Legs Rutine", ))
        
        
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        
        let destinationVC = segue.destination as! ExerciseViewController
        
        var array: rutine
        
        array = exercise[indexPath.row]
        
        destinationVC.exercise = array.exercise
        
        
    }

}

