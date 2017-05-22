//
//  ViewController.swift
//  CollectionViewProgram
//
//  Created by Rafael Colon Maldonado on 3/25/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories: [String] = ["Cardio", "Legs", "Arms", "Body"]
    
    struct rutines {
        var title: String
        var exercise: [String]
    }
    
    var defaultRutines: [rutines] = []
    
    //MARK:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let collectionViewLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        collectionViewLayout.minimumLineSpacing = 15
//        collectionViewLayout.minimumInteritemSpacing = 13
//        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/2)
        
        
        defaultRutines.append(rutines(title: "Cardio Rutine", exercise: ["Running", "Strech"]))
        defaultRutines.append(rutines(title: "Legs Rutine", exercise: ["Jumping Jacks", "Something"]))
        defaultRutines.append(rutines(title: "Arms Rutine", exercise: ["Push up", "ex. #2"]))
        defaultRutines.append(rutines(title: "Body Rutine", exercise: ["Plank", "Crunch"]))
        
        
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
        self.performSegue(withIdentifier: "rutinesVC", sender: sender)
    }
    
    
    
    //MARK: Segue Method
    //This method is used to acces any variable that is in the RutinesTableViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "rutinesVC" {
            
            let sender = sender as! UIButton
            let rutinesVC = segue.destination as! RutinesTableViewController
            
            rutinesVC.rutineTitle = defaultRutines[sender.tag].title
            rutinesVC.exercise = defaultRutines[sender.tag].exercise
        }
    }
}

