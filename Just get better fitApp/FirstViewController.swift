//
//  FirstViewController.swift
//  Just get better fitApp
//
//  Created by Andrei Palonski on 18.12.16.
//  Copyright © 2016 Andrei Palonski. All rights reserved.
//

import UIKit
import Social

class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIDocumentInteractionControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  
  let imagePicker = UIImagePickerController()
  var imagePicked = false
  var shareNetwork = ""
  var docController = UIDocumentInteractionController()
  var workouts : [Workout] = [Workout]()
  var selectedWorkout : Workout?
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var dailyBountyLabel: UILabel!
  @IBOutlet weak var profileImageView: UIImageView!
  @IBOutlet weak var collectButton: UIButton!
  @IBOutlet weak var totalEndorfinsEarnLabel: UILabel!
  @IBOutlet weak var bountyLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePicker.delegate = self
    initialiseData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destVC = segue.destination as? DoWorkoutViewController {
      destVC.workout = selectedWorkout
    }
  }
  
  @IBAction func workoutStartButtonTapped(_ sender: UIButton) {
  }
  
  // MARK - Share Buttons tapped

  @IBAction func facebookShareTapped(_ sender: UIButton) {
    shareNetwork = "f"
    openImgPicker()
    
  }
  
  @IBAction func twitterShareTapped(_ sender: UIButton) {
    shareNetwork = "t"
    openImgPicker()
    
  }
  
  @IBAction func instagramShareTapped(_ sender: UIButton) {
    shareNetwork = "i"
    openImgPicker()
    
  }
  
  func imageSharingComplete() {
    imagePicked = false
  }

  func openImgPicker() {
    if !imagePicked {
    imagePicker.allowsEditing = true
    imagePicker.sourceType = .camera
    present(imagePicker, animated: true, completion: nil)
    imagePicked = true
    }
  }
  
  // MARK - image picker return image
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage {
      profileImageView.image = imagePicked
    }
    dismiss(animated: true, completion:  { // отпускаем пикер после фотографии
      if self.shareNetwork == "f" {
        self.shareFacebook()
      } else if self.shareNetwork == "t" {
        self.shareTwitter()
      } else if self.shareNetwork == "i" {
        self.shareInstagram()
      }
    })
  }
  
  // MARK - sharing
  
  
  
  func shareFacebook() {
    if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
      share(vc: vc)
    }

  }
  
  func shareTwitter() {
    if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
      share(vc: vc)
    }
  }
  
  func share(vc: SLComposeViewController) {
    vc.setInitialText(totalEndorfinsEarnLabel.text)
    if let img = profileImageView.image {
      vc.add(img)
    }
    // vc.add(<#T##url: URL!##URL!#>)
    present(vc, animated: true, completion: nil)
    imageSharingComplete()
  }
  
  func shareInstagram() {
    let instagramURL = URL(string: "instagram://app")
    if (UIApplication.shared.canOpenURL(instagramURL!)) {
      let imageData = UIImageJPEGRepresentation(profileImageView.image!, 90)
      let captionStr = ""
      let writePath = (NSTemporaryDirectory() as NSString).appending("instagram.igo")
      do {
        try imageData?.write(to: URL(fileURLWithPath: writePath), options: [.atomicWrite])
        let fileURL = URL(fileURLWithPath: writePath)
        docController = UIDocumentInteractionController(url: fileURL)
        docController.delegate = self
        docController.uti = "com.instagram.exlusivegram"
        docController.annotation = NSDictionary(object: totalEndorfinsEarnLabel.text!, forKey: "Instagramaption" as NSCopying)
        docController.presentOpenInMenu(from: self.view.frame, in: self.view, animated: true)
      } catch let error {
        print("\(error.localizedDescription)")
      }
    }
  }
  
  // MARK - collectionView
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return workouts.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! WorkoutCollectionViewCell
    
    
    // furnish cell TODO
    
    cell.update(wkout: workouts[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(" tapped \(workouts[indexPath.row])")
    collectButton.isEnabled = true
    var cell = collectionView.cellForItem(at: indexPath)
    let bgColor = Utilities().green
    UIView.animate(withDuration: 0.4, animations: {
      cell?.backgroundColor = bgColor
    }) { (Bool) in
      cell?.backgroundColor = UIColor.white
    }
    
    
    selectedWorkout = workouts[indexPath.row]
    loadWorkout()
  }
  
  
  // loads workout into class var and collect / bounty view
  func loadWorkout() {
    dailyBountyLabel.text = (selectedWorkout?.name)!
    bountyLabel.text = String(describing: (selectedWorkout?.bounty)!) + " E"
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = collectionView.frame.height * 0.95
    return CGSize(width: height, height: height)
  }
  
  // MARK - get data
  
  func initialiseData() {
    if let wkouts = Data().getWorkoutsFromServer() {
      self.workouts = wkouts
    }
  }
  
}

