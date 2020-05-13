//
//  ViewController.swift
//  Instagrid-version9
//
//  Created by macmini-Armelle on 04/05/2020.
//  Copyright © 2020 armellelecerf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swipeToShareLabel: UILabel!
    @IBOutlet weak var swipeToShareButton: UIButton!
    @IBOutlet weak var layoutOneButton: UIButton!
    @IBOutlet weak var layoutTwoButton: UIButton!
    @IBOutlet weak var layoutThreeButton: UIButton!
    @IBOutlet weak var topLeftGridButton: UIButton!
    @IBOutlet weak var TopRightGridButton: UIButton!
    @IBOutlet weak var bottomLeftGridButton: UIButton!
    @IBOutlet weak var bottomRightGridButton: UIButton!
    @IBOutlet weak var bottomRectangleGridButton: UIButton!
    @IBOutlet weak var topRectangleGridButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK : Display Layout 1 , 2 or 3
    @IBAction func selectFourSquaresLayout(_ sender: UIButton) {
        displayFourSquaresLayout(sender: sender)
    }
    
    @IBAction func selectBottomRectangleLayout(_ sender: UIButton) {
        displayBottomRectangleLayout(sender : sender)
    }
    @IBAction func selectTopRectangleLayout(_ sender: UIButton) {
        displayTopRectangleLayout(sender: sender)
    }
   func displayTopRectangleLayout(sender: UIButton) {
          topLeftGridButton.isHidden = true
          bottomLeftGridButton.isHidden = false
          bottomRightGridButton.isHidden = false
    layoutOneButton.isSelected = true
   
          sender.isSelected = true
         
      }
      

    func displayBottomRectangleLayout(sender: UIButton) {
          topLeftGridButton.isHidden = false
          TopRightGridButton.isHidden = false
          bottomLeftGridButton.isHidden = true
        layoutTwoButton.isSelected = true
          sender.isSelected = true
         
      }
      
      func displayFourSquaresLayout(sender: UIButton) {
         topLeftGridButton.isHidden = false
         TopRightGridButton.isHidden = false
        bottomLeftGridButton.isHidden = false
        bottomRightGridButton.isHidden = false
        layoutThreeButton.isSelected = true
          sender.isSelected = true
          
      }
    
    
    // MARK : Collect photos
     @IBAction func collectPhotoInTopLeftSquare(_ sender: UIButton) {
          collectPhotoFromLibrary(for: sender)
     }
    
    @IBAction func collectPhotoInTopRightSquare(_ sender: UIButton) {
         collectPhotoFromLibrary(for: sender)
    }
    
    
    @IBAction func collectPhotoInBottomLeftSquare(_ sender: UIButton) {
        collectPhotoFromLibrary(for: sender)
    }
    
    
    @IBAction func collectPhotoInBottomRightSquare(_ sender: UIButton) {
       collectPhotoFromLibrary(for: sender)
    }
    
      private func collectPhotoFromLibrary(for sender: UIButton) {
           
           
         let imagePickerController = UIImagePickerController()
          if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
              imagePickerController.sourceType = .photoLibrary
          } else {
             return
         }
           
          
   
    
    func changeTextSwipeLabel(){
        if UIDevice.current.orientation.isPortrait  { swipeToShareLabel.text = "Swipe up to share"}
        else if UIDevice.current.orientation.isLandscape {swipeToShareLabel.text = "Swipe left to share"}
        
    }
    
   // func changeImageSwipeButton(){
   //     if UIDevice.current.orientation.isPortrait { swipeToShareButton.currentBackgroundImage = UIImage(named: "Arrow Up") }
  //      else if UIDevice.current.orientation.isLandscape{ swipeToShareButton.currentBackgroundImage = UIImage(named: "Arrow Left")}
    // }
    

}
}
