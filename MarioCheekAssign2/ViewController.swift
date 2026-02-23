//
//  ViewController.swift
//  MarioCheekAssign2
//
//  Created by Mondrelle Cheek on 2/21/26.
//

import UIKit

class ViewController: UIViewController {
    //IBOutlets
    //Calories
    @IBOutlet weak var caloriesFromMeals: UITextField!
    @IBOutlet weak var caloriesFromSnacks: UITextField!
    //Daily Activities
    @IBOutlet weak var stepsFromToday: UITextField!
    @IBOutlet weak var activityInMins: UITextField!
    //Simulation
    @IBOutlet weak var activityVsEating: UITextField!
    @IBOutlet weak var weightChange: UITextField!
    @IBOutlet weak var stepsRemaining: UITextField!
    //IBAction
    //Simulation
    @IBAction func simulateDay(_ sender: Any) {
        //Variable declarations
        //Calories variable (total)
        let meals = Double(caloriesFromMeals.text ?? "0") ?? 0
        let snacks = Double(caloriesFromSnacks.text ?? "0") ?? 0
        let totalCalories = meals + snacks
        //Steps and Activity variables
        let totalSteps = Double(stepsFromToday.text ?? "0") ?? 0
        let activityMinutes = Double(activityInMins.text ?? "0") ?? 0
        //Burn .05 kcal every step, 8 kcals every minute
        let totalBurn = 1800 + (totalSteps * 0.05) + (activityMinutes * 8)
        
        //Lets determine the balance between activity and calories
        let balance = totalCalories - totalBurn
        //Display it
        if totalCalories > totalBurn {
            activityVsEating.text = "You ate more than you burned today!"
        }else {
            activityVsEating.text = "You burned more than you ate today!"
        }
        
        //Lets determine the weight change
        let lbs = abs(balance) / 3500.0
        //Display it
        //weightChange.text = String
        
        activityVsEating.text = ""
        weightChange.text = ""
        stepsRemaining.text = ""
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

