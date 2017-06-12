//
//  ActivityViewController.swift
//  Zuet
//
//  Created by Rafael Colon Maldonado on 5/31/17.
//  Copyright © 2017 Rafael Colon Maldonado. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {

    var exerciseDescription = [String: String]()
    var exercisePicture = [String: AnyObject]()
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var timerLabel: UILabel!
    var exercise: [String] = []
    var time = 0
    var timer = Timer()
    var start = false
    var element = 1
    var count = 0
    
    @IBOutlet weak var playbtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var navBar: UINavigationItem!
    override func viewDidLoad() {
        
        //descriptions
        exerciseDescription["Reverse Lunges"] =  "Take a big step back with your left foot. Bend both knees to lower into a lunge, making sure your right knee is above the ankle and does not go too far beyond your toes. Drive off the ball of your right big toe to return to standing. Repeat, this time stepping back with your right leg. That's one rep. Do 10 reps total, keeping your chest up the whole time."
        exerciseDescription["Squats with Arms Overhead"] =  "Stand with feet hip-width apart and arms up, palms facing each other. Bend both knees and shift your hips back as though you are sitting in a chair. Draw shoulder blades down and back. Use your glutes to return to standing. That's one rep. Do 10 reps total."
        exerciseDescription["Bridges"] =  "Lie faceup on the floor (mat optional) with your feet directly below your knees. Keep your hands by your sides and engage your glutes to lift your hips off the ground. Slowly lower back to the floor. Keep your neck and back relaxed as you use your glutes and hamstrings to lift up and down 10 times total."
        exerciseDescription["Plank with Shoulder Touches"] =  "Come into a straight-arm plank position with hands directly under shoulders, forming a straight line from neck to feet. Without moving hips, touch right hand to left shoulder. Bring hand back underneath shoulder. Touch left hand to right shoulder. Repeat 10 times each side."
        exerciseDescription["Mountain Climbers"] =  "Come into a straight-arm plank position with your hands directly below your shoulders. Your body should form a straight line from neck to your ankles. Lift your right foot and drive your right knee up into the center of your body. Quickly switch legs, driving left knee up into the center of your body. Try to keep your hips level and your shoulders directly above your wrists. Do as many as possible for 1 minute."
        exerciseDescription["Burpees"] =  "Stand tall with your feet hip-width apart. Bend both knees, swing arms back, and drive off ground as high as possible. Land softly and immediately bend your knees, place hands on the floor in front of you, and jump your feet all the way back so you end up in a plank position. Lower your chest to perform a pushup. Jump both feet back in and stand. Immediately jump up to repeat. Continue to do as many reps as possible for 1 minute."
        exerciseDescription["Squat Jumps"] =  "Stand with your feet hip-width apart. Push your hips back and bend your knees to lower into a squat (in preparation to leap). Explosively jump as high as you can. Land softly, and then immediately squat down to jump again. Imagine that you're pushing the floor away from you as you leap. You can use your arms to help you jump higher. Do as many squat jumps as possible for 1 minute."
        exerciseDescription["Skier Jumps"] =  "Stand tall with your feet, ankles, and knees glued together. Jump from side to side as fast as possible, keeping your chest lifted and landing softly. The height of the jump does not matter. Focus on the speed. Do as many jumps as possible for 1 minute."
        exerciseDescription["Pilates 100"] =  "Lie faceup with your knees and hips bent 90 degrees, hands by your side. Lift your head, shoulders, and upper back off the ground, and begin to pulse your arms, taking long, deep breaths (inhale for 10 counts, exhale for 10 counts). Your core should be engaged the entire time so that everything but your arms stays completely still. Continue taking deep breaths until you get to 100 arms pulses."
        exerciseDescription["Downward Dog"] =  "Come onto your hands and knees with hands directly below your shoulders and knees directly below hips. Spread your fingers wide and tuck your toes under. Inhale and lift your knees off the floor, pressing your hips up toward the ceiling. Draw your heels down to the floor or keep a slight bend in your knees. Press your hands firmly into the mat and draw your shoulder blades down. Keep the head between the arms (don't let it hang). Take 5 deep breaths or as many as desired."
        exerciseDescription["Cat and Cow"] =  "Come onto your hands and knees with hands directly below your shoulders and knees directly below your hips. Inhale to lengthen your spine. Without bending elbows or moving hips, roll your spine forward to arch your back. Lift your chin, chest, and hips to the ceiling, allowing your stomach to sink toward the floor. Once you've reached the fullest expression of your arch, round your spine toward the ceiling and release your head toward the floor. Move in a fluid motion for 5 deep breaths or as many as desired"
        exerciseDescription["Warrior II"] =  "Stand with your feet wider than hip-width apart. Turn your right toes out and left toes slightly inward. Bend your right knee and lower your hips down. Make sure your right knee is directly above your ankle. Extend your arms straight out from your shoulders and press the outside of the left foot into the mat. Continue to sink lower into your hips as spine stays long. Take 5 deep breaths or as many as desired."
        exerciseDescription["STANDING V RAISE"] =  "Hold a dumbbell in each hand and stand with your feet shoulder-width apart, arms at your sides, palms in (a). With arms straight but not locked, raise the weights diagonally in front of you, so that your arms form a V shape, until your arms are parallel to the floor (b). Hold for one second, then return to the starting position. Do 12 to 15 reps."
        exerciseDescription["SHOULDER PRESS"] =  "Holding a pair of dumbbells just above your shoulders, palms facing each other, stand with your feet shoulder-width apart, knees slightly bent (a). Press the weights until your arms are straight overhead (b). Hold for one second, then take three seconds to lower the dumbbellsback to your shoulders. Do six to eight reps."
        exerciseDescription["ROTATING TRICEPS KICKBACK"] =  "Stand with your knees bent and lean forward slightly, with a dumbbell in each hand. Bend your right elbow to bring the dumbbell to your side, making your upper arm parallel with the floor (a). Press the dumbbell back, and as you straighten your arm, rotate it so that your palm faces the ceiling (b). Rotate it back so that your palm faces in, and return your arm to the bent position. Do 12 to 15 reps with each arm."
        //exerciseDescription["Spot Jogging"] =  "blah blah spot jogging"
       

        
        
        
        //pictures 
        exercisePicture["Reverse Lunges"] = #imageLiteral(resourceName: "reverseLunges")
        exercisePicture["Squats with Arms Overhead"] = #imageLiteral(resourceName: "SquatsArms")
        exercisePicture["Bridges"] = #imageLiteral(resourceName: "bridges")
        exercisePicture["Plank with Shoulder Touches"] = #imageLiteral(resourceName: "plankShoulder")
        exercisePicture["Mountain Climbers"] = #imageLiteral(resourceName: "montainClimbers")
        exercisePicture["Burpees"] = #imageLiteral(resourceName: "Burpees ")
        exercisePicture["Squat Jumps"] = #imageLiteral(resourceName: "squatJumps")
        exercisePicture["Skier Jumps"] = #imageLiteral(resourceName: "skierJumps")
        exercisePicture["Pilates 100"] = #imageLiteral(resourceName: "pilates")
        exercisePicture["Downward Dog"] = #imageLiteral(resourceName: "downwardDog")
        exercisePicture["Cat and Cow"] = #imageLiteral(resourceName: "catCow")
        exercisePicture["Warrior II"] = #imageLiteral(resourceName: "warrior")
        exercisePicture["STANDING V RAISE"] = #imageLiteral(resourceName: "standingRaise")
        exercisePicture["SHOULDER PRESS"] = #imageLiteral(resourceName: "shoulderPress")
        exercisePicture["ROTATING TRICEPS KICKBACK"] = #imageLiteral(resourceName: "rotatingTriceps")
        
        //exercisePicture["Mountain Climbers"] = #imageLiteral(resourceName: "armsRutine")
        
        
        super.viewDidLoad()
        print("from the activity view controller")
        print(exercise)
        navBar.title = exercise[0]
        count = exercise.count
        descriptionLabel.text = exerciseDescription[exercise[0]]
        imageView.image = exercisePicture[exercise[0]] as? UIImage
        
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if playbtn.currentImage == #imageLiteral(resourceName: "play"){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ActivityViewController.TimerAction)), userInfo: nil, repeats: true)
            
            start = true
            playbtn.setImage(UIImage(named: "pause.png"), for: .normal)
        } else {
            timer.invalidate()
            playbtn.setImage(UIImage(named: "play.png"), for: .normal)
        }
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        print("next")
        if start == true
        {
            print("entro al if de next, despues de haberle dado start")
            if element < count
            {
                
                print("entro al if de presentar")
                navBar.title = exercise[element]
                descriptionLabel.text = exerciseDescription[exercise[element]]
                imageView.image = exercisePicture[exercise[element]] as? UIImage
                element += 1
                
                
            }
            //poner aqui el else para guardar tiempo, luego enviar tiempo a reporte
            
        }

        
        
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
        element = 1
        navBar.title = exercise[0]
        start = false
        navBar.title = exercise[0]
        descriptionLabel.text = exerciseDescription[exercise[0]]
        imageView.image = exercisePicture[exercise[0]] as? UIImage
        
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
