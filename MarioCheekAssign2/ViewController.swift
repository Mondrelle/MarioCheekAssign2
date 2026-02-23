//  ViewController.swift
//  MarioCheekAssign2

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
        if (balance > 0){
            weightChange.text = String(format: "You will gain %.2f lb today.", lbs)
        }else if balance < 0 {
            weightChange.text = String(format: "You will lose %.2f lb today.", lbs)
        }else {
            weightChange.text = String(format: "You have neither gained nor lost weight today.")
        }
        //Lets determine steps remaining
        var extraSteps = 0.0
        var tempBalance = balance
        while tempBalance > 0 {
            tempBalance -= 0.05
            extraSteps += 1
        }
        //Convert the steps into miles
        let miles = extraSteps / 2000.0
        //Display it
        stepsRemaining.text = String(format:"Extra steps:  %.0f (~%.1f miles)", extraSteps, miles)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

