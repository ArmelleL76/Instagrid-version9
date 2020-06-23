//
//  ViewController.swift
//  Instagrid-version9
//
//  Created by macmini-Armelle on 04/05/2020.
//  Copyright © 2020 armellelecerf. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    //  MARK : properties
    
    var tapButton = UIButton()
    
    @IBOutlet weak var myPhotoGrid: UIView!
    
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
   
    // Create an optional UISwipeGestureRecognizer
    private var swipeGestureRecognizer: UISwipeGestureRecognizer?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TopRightGridButton.imageView?.contentMode = .scaleAspectFill
        bottomRightGridButton.imageView?.contentMode = .scaleAspectFill
       
        
        // Initialize the swipeGestureRecognizer, and add action (a method: presentActivityController) to be trigger when swipe is used
       
        swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(presentActivityController))
        // Add a second action (a method: myPhotoGridTranslation) to be trigger when swipe is used
       
        swipeGestureRecognizer?.addTarget(self, action: #selector(myPhotoGridTranslation))
        
        // Unwrap optional value of swipeGestureRecognizer
        guard let swipeGestureRecognizer = swipeGestureRecognizer else { return }
        
        // Add the gesture to the object
       
        myPhotoGrid.addGestureRecognizer(swipeGestureRecognizer)
        
        // NotificationCenter is gonna be notified everytime the device orientation change ( UIDevice.orientationDidChangeNotification )
        // And is gonna trigger the selected method ( handleSwipeDirection ) everytime the NotificationCenter is notified
       
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        swipeToShareButton.imageView?.contentMode = .center
    }
    
    
    
    
    // MARK : méthods
    
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
        layoutTwoButton.isSelected = false
        layoutThreeButton.isSelected = false
    }
    
    
    func displayBottomRectangleLayout(sender: UIButton) {
        topLeftGridButton.isHidden = false
        TopRightGridButton.isHidden = false
        bottomLeftGridButton.isHidden = true
        layoutTwoButton.isSelected = true
        sender.isSelected = true
        layoutOneButton.isSelected = false
        layoutThreeButton.isSelected = false
        
    }
    
    func displayFourSquaresLayout(sender: UIButton) {
        topLeftGridButton.isHidden = false
        TopRightGridButton.isHidden = false
        bottomLeftGridButton.isHidden = false
        bottomRightGridButton.isHidden = false
        layoutThreeButton.isSelected = true
        sender.isSelected = true
        layoutOneButton.isSelected = false
        layoutTwoButton.isSelected = false
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
        
        tapButton = sender
        let imagePickerController = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
            imagePickerController.sourceType = .photoLibrary
        } else {
            return
        }
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func changeTextSwipeLabel(){
        if UIDevice.current.orientation.isPortrait  { swipeToShareLabel.text = "Swipe up to share"}
        else if UIDevice.current.orientation.isLandscape {swipeToShareLabel.text = "Swipe left to share"}
        
    }
    
    /// Une super fonction
    func changeImageSwipeButton() {
        if UIDevice.current.orientation.isPortrait { swipeToShareButton.setBackgroundImage(UIImage(named: "Arrow Up"), for: UIControl.State.normal)  }
        else if UIDevice.current.orientation.isLandscape{ swipeToShareButton.setBackgroundImage(UIImage(named: "Arrow Left"), for: UIControl.State.normal)}
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    
    // Modify the swipeGestureRecognizer direction and change imaage of swipe button ans text of swipeLabel
    @objc func rotated() {
        changeImageSwipeButton()
        changeTextSwipeLabel()
        if UIDevice.current.orientation.isLandscape {
            swipeGestureRecognizer?.direction = .left
            print("Landscape")
            
        } else {
            swipeGestureRecognizer?.direction = .up
            print("Portrait")
        }
    }
    
    
    
    @objc
    func presentActivityController() {
        // Initialize an UIActivityViewController with the item you want to share (myPhotoGrid.image)
        let activityController = UIActivityViewController(activityItems: [myPhotoGrid.image], applicationActivities: nil)
        // Display the activityController
        present(activityController, animated: true)
        
        // Define code you want to execute as soon as the activityController is dismissed
        // completionWithItemsHandler property accepts a closure with 4 parameters (That we're not gonna use here, so instead of naming them just "name" them "_")
        activityController.completionWithItemsHandler = { _, _, _, _ in
            // "Animate" the UIView translation
            UIView.animate(withDuration: 0.5, animations: {
                // Bring back the gridView to his initial coordinates
                self.myPhotoGrid.transform = .identity
            })
        }
        
    }
    
    @objc
    func myPhotoGridTranslation() {
        if UIDevice.current.orientation.isPortrait {
            // "Animate" the UIView translation
            UIView.animate(withDuration: 0.5, animations: {
                // Transform myPhotoGrid coordinates
                self.myPhotoGrid.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.myPhotoGrid.transform = CGAffineTransform(translationX: -self.view.frame.width, y: 0)
            })
        }
    }
    // Modify the swipeGestureRecognizer direction
    @objc
    func handleSwipeDirection() {
        if UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown {
            swipeGestureRecognizer?.direction = .up
        } else {
            swipeGestureRecognizer?.direction = .left
        }
    }
}





extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("expected a library of images, but was provided the following: \(info)")
        }
        tapButton.setImage(selectedImage, for: .normal)
        dismiss(animated: true, completion: nil)
    }
}
extension UIView {
    /// transform the gridView to an UImage
    var image: UIImage {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = renderer.image { _ in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        return image
    }
}
