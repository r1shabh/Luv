//
//  ViewController.swift
//  Luv
//
//  Created by Tyler Flesch on 11/20/19.
//  Copyright © 2019 Rishabh Anand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swipeLabel: UILabel!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
        let leftRecognizer = UISwipeGestureRecognizer(target: self, action:
         #selector(swipeMade(_:)))
            leftRecognizer.direction = .left
        let rightRecognizer = UISwipeGestureRecognizer(target: self, action:
         #selector(swipeMade(_:)))
            rightRecognizer.direction = .right
            self.view.addGestureRecognizer(leftRecognizer)
            self.view.addGestureRecognizer(rightRecognizer)
     }
     
    @IBAction func swipeMade(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
           print("left swipe made")
        }
        if sender.direction == .right {
           print("right swipe made")
        }
     }

}
