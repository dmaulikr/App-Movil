//
//  ViewController.swift
//  CollectionViewProgram
//
//  Created by Rafael Colon Maldonado on 3/25/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    let itemsPerRow: CGFloat = 2
    
    var rutineTitle: String = "Yessy Rutine"
    
    //MARK:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView Methods
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",for: indexPath)
        cell.backgroundColor = UIColor.black
        
        let label = cell.viewWithTag(100) as! UILabel
        
        if indexPath.row == 0 {
            label.text = "Cardio"
        } else if indexPath.row == 1 {
            label.text = "Legs"
        } else if indexPath.row == 2 {
            label.text = "Arms"
        } else if indexPath.row == 3 {
            label.text = "Body"
        }
        // Configure the cell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            rutineTitle = "Cardio Rutine"
        } else if indexPath.row == 1 {
            rutineTitle = "Legs Rutine"
        } else if indexPath.row == 2 {
            rutineTitle = "Arms Rutine"
        } else if indexPath.row == 3 {
            rutineTitle = "Body Rutine"
        }

    }
    
    //MARK: Segue Method
    //This method is used to acces any variable that is in the RutinesTableViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "rutinesVC" {
            let rutinesVC = segue.destination as? RutinesTableViewController
            
                rutinesVC?.rutineTitle = rutineTitle
                rutinesVC?.viewDidLoad()
        }
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        
        // add the required height, if you want to fill the whole screen it should be 'screenSize.height / 2'
        return CGSize(width: screenSize.width / 2, height: 100)
    }
}

