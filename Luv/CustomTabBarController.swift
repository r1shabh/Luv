//
//  CustomTabBarController.swift
//  Luv
//
//  Created by Tyler Flesch on 11/20/19.
//  Copyright © 2019 Rishabh Anand. All rights reserved.
//

import UIKit

class CustomTabBarController:  UITabBarController, UITabBarControllerDelegate {
    
    var profileViewController: ProfileViewController!
    var top10ViewController: Top10ViewController!
    var locationsViewController: LocationsViewController!

    override func viewDidLoad(){
        super.viewDidLoad()
        self.delegate = self
        
        profileViewController = ProfileViewController()
        top10ViewController = Top10ViewController()
        locationsViewController = LocationsViewController()
     
        profileViewController.tabBarItem.image = Image(systemName: "person.circle.fill")
        profileViewController.tabBarItem.selectedImage = Image(systemName: "person.circle")
        top10ViewController.tabBarItem.image = Image(systemName: "10.square.fill")
        top10ViewController.tabBarItem.selectedImage = Image(systemName: "10.square")
        locationsViewController.tabBarItem.image = Image(systemName: "mappin")
        locationsViewController.tabBarItem.selectedImage = Image(systemName: "mappin.and.ellipse")
        viewControllers = [profileViewController, top10ViewController, locationsViewController]
        for tabBarItem in tabBar.items! {
          tabBarItem.title = ""
         tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
    //MARK: UITabbar Delegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
      if viewController.isKind(of: ProfileViewController.self) {
         let vc =  ProfileViewController()
         vc.modalPresentationStyle = .overFullScreen
         self.present(vc, animated: true, completion: nil)
         return false
      }
      return true
    }
    
}
