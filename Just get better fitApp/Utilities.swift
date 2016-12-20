//
//  Utilities.swift
//  Just get better fitApp
//
//  Created by Andrei Palonski on 20.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
  func getStorage() -> UserDefaults {
    return UserDefaults.standard
  }
  
  func setGlobalDifficulty(value: Int) {
    let defaults = getStorage()
    defaults.set(value, forKey: Difficulty.difficulty)
    defaults.synchronize()
  }
  
  func getGlobalDifficulty() -> Int {
    let defaults = getStorage()
    let diff = defaults.integer(forKey: Difficulty.difficulty)
    if diff == 0 {
      return 3
    } else {
      return diff
    }
  }
  
  var green : UIColor = UIColor(red: 150/255, green: 219/255, blue: 55/255, alpha: 0.5)

}

struct Difficulty {
  static let difficulty = "globalDifficulty"
}
