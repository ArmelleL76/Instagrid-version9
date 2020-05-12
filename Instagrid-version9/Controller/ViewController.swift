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

    func changeTexLabel(){
        if UIDeviceOrientation.portrait = true { swipeToShareLabel.text = "Swipe up to share"}
        else if UIDeviceOrientation.landscapeLeft = true {swipeToShareLabel.text = "Swipe left to share"}
        
    }
    
    func changeSwipeImage(){
        if UIDeviceOrientation.portrait = true {swipeToShareButton.currentImage =  }
        else if UIDeviceOrientation.landscapeLeft = true {swipeToShareButton.currentImage = }
    }
    
}

