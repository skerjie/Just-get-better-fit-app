//
//  DoWorkoutViewController.swift
//  JustGetBetterFitAppTests
//
//  Created by Andrei Palonski on 20.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit

class DoWorkoutViewController: UIViewController {

  @IBOutlet weak var numberOfRepsLabel: UILabel!
  @IBOutlet weak var numberOfSetsLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var workoutImageView: UIImageView!
  @IBOutlet weak var workoutNameLabel: UILabel!
  @IBOutlet weak var doneBtn: UIButton!
  var workout : Workout!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func markDoneBtnTapped(_ sender: UIButton) {
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
