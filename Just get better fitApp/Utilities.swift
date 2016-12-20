//
//  Utilities.swift
//  Just get better fitApp
//
//  Created by Andrei Palonski on 20.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import Foundation

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

}

struct Difficulty {
  static let difficulty = "globalDifficulty"
}
