//
//  WorkoutCollectionViewCell.swift
//  Just get better fitApp
//
//  Created by Andrei Palonski on 20.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var workoutNameLabel: UILabel!
  @IBOutlet weak var workoutImageView: UIImageView!
  @IBOutlet weak var fistImage1: UIImageView!
  @IBOutlet weak var fistImage2: UIImageView!
  @IBOutlet weak var fistImage3: UIImageView!
  @IBOutlet weak var fistImage4: UIImageView!
  @IBOutlet weak var fistImage5: UIImageView!
  @IBOutlet weak var fistImage6: UIImageView!
  
  func update(wkout: Workout) {
    var diff = wkout.difficulty
    setFists(i: diff!)
    workoutImageView.image = UIImage(named: "defaultWorkout")
    workoutNameLabel.text = wkout.name + ". " + wkout.author
    
  }
  
  func setFists(i: Int) {
    if i == 1 {
      toggleImageAlpha(imageV: fistImage1, alpha: 1)
      toggleImageAlpha(imageV: fistImage2, alpha: 0)
      toggleImageAlpha(imageV: fistImage3, alpha: 0)
      toggleImageAlpha(imageV: fistImage4, alpha: 0)
      toggleImageAlpha(imageV: fistImage5, alpha: 0)
      toggleImageAlpha(imageV: fistImage6, alpha: 0)
    } else if i == 2 {
      toggleImageAlpha(imageV: fistImage1, alpha: 1)
      toggleImageAlpha(imageV: fistImage2, alpha: 1)
      toggleImageAlpha(imageV: fistImage3, alpha: 0)
      toggleImageAlpha(imageV: fistImage4, alpha: 0)
      toggleImageAlpha(imageV: fistImage5, alpha: 0)
      toggleImageAlpha(imageV: fistImage6, alpha: 0)
    } else if i == 3 {
      toggleImageAlpha(imageV: fistImage1, alpha: 1)
      toggleImageAlpha(imageV: fistImage2, alpha: 1)
      toggleImageAlpha(imageV: fistImage3, alpha: 1)
      toggleImageAlpha(imageV: fistImage4, alpha: 0)
      toggleImageAlpha(imageV: fistImage5, alpha: 0)
      toggleImageAlpha(imageV: fistImage6, alpha: 0)
    } else if i == 4 {
      toggleImageAlpha(imageV: fistImage1, alpha: 1)
      toggleImageAlpha(imageV: fistImage2, alpha: 1)
      toggleImageAlpha(imageV: fistImage3, alpha: 1)
      toggleImageAlpha(imageV: fistImage4, alpha: 1)
      toggleImageAlpha(imageV: fistImage5, alpha: 0)
      toggleImageAlpha(imageV: fistImage6, alpha: 0)
    } else if i == 5 {
      toggleImageAlpha(imageV: fistImage1, alpha: 1)
      toggleImageAlpha(imageV: fistImage2, alpha: 1)
      toggleImageAlpha(imageV: fistImage3, alpha: 1)
      toggleImageAlpha(imageV: fistImage4, alpha: 1)
      toggleImageAlpha(imageV: fistImage5, alpha: 1)
      toggleImageAlpha(imageV: fistImage6, alpha: 0)
    } else if i == 6 {
      toggleImageAlpha(imageV: fistImage1, alpha: 1)
      toggleImageAlpha(imageV: fistImage2, alpha: 1)
      toggleImageAlpha(imageV: fistImage3, alpha: 1)
      toggleImageAlpha(imageV: fistImage4, alpha: 1)
      toggleImageAlpha(imageV: fistImage5, alpha: 1)
      toggleImageAlpha(imageV: fistImage6, alpha: 1)
    }
    
  }
  
  func toggleImageAlpha(imageV: UIImageView, alpha : Float) {
    imageV.alpha = CGFloat(alpha)
  }
}
