//
//  ViewController.swift
//  CollectionViewProgram
//
//  Created by Rafael Colon Maldonado on 3/25/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories: [String] = ["Cardio", "Legs", "Arms", "Body"]
    
    struct rutines {
        var title: String
        var exercise: [String]
    }
    
    var defaultRutines: [rutines] = []
    
    //MARK: Loading Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
                              
        defaultRutines.append(rutines(title: "Cardio Rutine", exercise: ["Running", "Walking", "Cycling"]))
        
        defaultRutines.append(rutines(title: "Legs Rutine", exercise: ["Squats", "Side Lunges", "Reverse Lunges", "Curtsy Lunges"]))
        
        defaultRutines.append(rutines(title: "Arms Rutine", exercise: ["Push Up", "Plank Ups", "Inchworm", "Plank Taps", "Lateral Plank Walks", "Diamond Push Up", "Plank Jacks"]))
        
        defaultRutines.append(rutines(title: "Body Rutine", exercise: ["Plank", "Crunch", ]))
        
        
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: CollectionView Methods
     func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",for: indexPath) as! CategoriesCollectionViewCell

        // Configure the cell
        cell.categorieTitle.setTitle(categories[indexPath.item], for: .normal)
        cell.categorieTitle.tag = indexPath.item
        cell.categorieTitle.addTarget(self, action: #selector(didGoToRutines), for: .touchUpInside)
        
        return cell
    }
    
    func didGoToRutines(sender: UIButton){
        self.performSegue(withIdentifier: "rutineVC", sender: sender)
    }
    
    
    
    //MARK: Segue Method
    //This method is used to acces any variable that is in the RutinesTableViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "rutineVC" {
            
            let sender = sender as! UIButton
            let rutinesVC = segue.destination as! RutineTableViewController
            
            
            print(sender.tag)
            rutinesVC.rutineTitle = defaultRutines[sender.tag].title
            rutinesVC.exercise = defaultRutines[sender.tag].exercise
            rutinesVC.index = sender.tag
        }
    }
}

