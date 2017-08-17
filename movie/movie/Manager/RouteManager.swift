//
//  RouteManager.swift
//  movie
//
//  Created by NGI-Noman on 15/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import Foundation
import UIKit



enum contrllerType{
  
   case serach
   case result

   
}
private let instance = RouteManager()


class RouteManager {
    
    class var shared: RouteManager{
        return instance
    }
    
    let navController = UINavigationController()
    
    func getRootController() -> UIViewController{
    
        let destViewController = SearchController()
        self.navController.setViewControllers([destViewController as UIViewController], animated: false)
        return self.navController
        
    }
    func pushController(_ viewController: UIViewController) {
        self.navController.pushViewController(viewController, animated: true)
    }
    func setConroller(_ viewController: UIViewController){
        self.navController.setViewControllers([viewController], animated: false)
    }
    func popController(){
        self.navController.popViewController(animated: true)
    }

}
