//
//  Data.swift
//  Just get better fitApp
//
//  Created by Andrei Palonski on 20.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import Foundation


class Data {
  
  func getWorkoutsFromServer() -> [Workout]? {
    let diff = Utilities().getGlobalDifficulty()
    
    var wkouts = [Workout]()
    
    for _ in (0..<10) {
      wkouts.append(_testDummyWorkout())
    }
    
    return wkouts
  }
  
  
  // get test workout(data)
  func _testDummyWorkout() -> Workout{
    let name = "workout1"
    let imageUrl = URL(string: "https://httpbin.org/image/png")!
    let desc = "Description"
    let note = "Test note for an exercise"
    let author = "skrj"
    let diff = Int(arc4random_uniform(5) + 1)
    
    let excersise = ["Pushups" : [[1,20], [2,20], [3,17], [4, 20]] ]
    
    let wkout1 = Workout(name: name, imgUrl: imageUrl, diff: diff, note: note, desc: desc, author: author, bounty: 10, exercises: excersise)
    
    return wkout1
    
  }
  
  
}
