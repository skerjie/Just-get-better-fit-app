//
//  FirstViewController.swift
//  Just get better fitApp
//
//  Created by Andrei Palonski on 18.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var dailyBountyLabel: UILabel!
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var totalEndorfinsEarnLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func workoutStartButtonTapped(_ sender: UIButton) {
  }

  @IBAction func facebookShareTapped(_ sender: UIButton) {
  }
  @IBAction func twitterShareTapped(_ sender: UIButton) {
  }
  @IBAction func instagramShareTapped(_ sender: UIButton) {
  }
}

