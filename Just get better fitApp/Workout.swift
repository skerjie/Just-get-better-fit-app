//
//  Workout.swift
//  Just get better fitApp
//
//  Created by Andrei Palonski on 20.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import Foundation


struct Workout {
  var name : String!
  var imgUrl : URL!
  var difficulty : Int!
  var note : String!
  var description : String!
  var author : String!
  
  var exercises : [String : [[Int]] ]!
  // var set : [Int : Int]?
  
  init(name: String, imgUrl : URL, diff: Int, note: String, desc: String, author : String, exercises: [String : [[Int]] ]) {
    self.name = name
    self.imgUrl = imgUrl
    self.difficulty = diff
    self.note = note
    self.description = desc
    self.author = author
    self.exercises = exercises
  }
  
}
