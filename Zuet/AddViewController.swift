//
//  AddViewController.swift
//  Zuet
//
//  Created by Rafael Colon Maldonado on 6/11/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import UIKit
protocol madeRutine {
    func madeRutine(rutines: rutine)
}
class AddViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITableViewDelegate, UITableViewDataSource {
    
    struct checkedExercise {
        var move: String
        var isChecked: Bool
    }
    
    var exercise: [checkedExercise] = []
    var exercisesToAdd: [String] = []
    var rutineToMake: rutine = rutine(title: "", image: #imageLiteral(resourceName: "defaultPhoto"), exercise: [])
    
    var delegate: madeRutine? = nil

    @IBOutlet weak var rutinePhoto: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exercise.append(checkedExercise(move: "Reverse Lunges", isChecked: false))
        exercise.append(checkedExercise(move: "Squats", isChecked: false))
        exercise.append(checkedExercise(move: "Side Lunges", isChecked: false))
        exercise.append(checkedExercise(move: "Plank Jacks", isChecked: false))
        exercise.append(checkedExercise(move: "Push Up", isChecked: false))
        exercise.append(checkedExercise(move: "Plank Taps", isChecked: false))
        exercise.append(checkedExercise(move: "Cat and Cow", isChecked: false))
        exercise.append(checkedExercise(move: "Rotating Triceps Kickback", isChecked: false))

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return exercise.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "exCell", for: indexPath)
        
        let label = cell.viewWithTag(20) as! UILabel
        
        label.text = exercise[indexPath.row].move
        
        return cell
    }
    
    //Para que el usuario seleccione cual es el ejercicio que tendra la rutina
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
                exercise[indexPath.row].isChecked = false
                print(exercise[indexPath.row].isChecked)
            }
            else{
                cell.accessoryType = .checkmark
                exercise[indexPath.row].isChecked = true
                print(exercise[indexPath.row].isChecked)
            }
        }
        
       if let selectionIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectionIndexPath, animated: true)
        }
    }
    
    //MARK: imagePickerDelegate Methods
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        rutinePhoto.image = resizeImage(image: selectedImage, newWidth: 200)
        
        dismiss(animated: true, completion: nil)
    }
    //MARK: Image resize 
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }

    
    //MARK: Action Methods
    
    //Funcion para cancelar la adicion de rutinas
    @IBAction func cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    //Funcion para añadir rutinas creadas por el usuario
    @IBAction func done(_ sender: Any) {
        //rutineToMake//Vacia el arreglo para posible contenido que tenga
        exercisesToAdd.removeAll()//Vacia el arreglo para posible contenido que tenga
        
        for i in 0..<exercise.count {
            if exercise[i].isChecked == true {
                exercisesToAdd.append(exercise[i].move)
            }
        }
        
        if delegate != nil {
            if titleTextField != nil && rutinePhoto.image != #imageLiteral(resourceName: "defaultPhoto") && exercisesToAdd.count > -1{
                rutineToMake = rutine(title: titleTextField.text!,image: rutinePhoto.image!, exercise: exercisesToAdd)
                delegate?.madeRutine(rutines: rutineToMake)
                self.navigationController?.popViewController(animated: true)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    //Funcion permite al usuario seleccionar imagenes para sus rutinas
    @IBAction func openPhotos(_ sender: UITapGestureRecognizer) {
        //Esconde el teclado si esta presente en pantalla
        titleTextField.resignFirstResponder()
        
        //Permite al usuario seleccionar una imagen de su libreria
        //que se usara para su rutina
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
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
