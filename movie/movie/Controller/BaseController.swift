//
//  BaseController.swift
//  movie
//
//  Created by NGI-Noman on 15/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadViewWithNib(name: self.getViewName())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark : Modify Controller Name To load View
    func getViewName()->String{
    
        let file = type(of: self).description()
        
       let xibName = file.components(separatedBy: ".").last
        
        guard file.hasSuffix("Controller") else {
          throwException(message: "Invalid class name. Name should end with string 'controller' (e.g. SampleController)")
          return ""
        }
        return xibName!.replacingOccurrences(of: "Controller", with: "View")
      
    }
    //Mark: Load View From Nib
    
    func loadViewWithNib(name:String){
    
        guard (Bundle.main.path(forResource: name, ofType: "nib") != nil) else {
            throwException(message: "\(name) nib/class not found in project")
            return
        }
        
        let nib = UINib(nibName: name, bundle: nil)
        if let view = nib.instantiate(withOwner: nil, options: nil).first as? BaseView {
            view.controller = self;
            self.view       = view;
        }
        else{
            throwException(message: "\(name) nib should be subclass of \(name) -> BaseView (IB error).")
        }
       
    }
    
    
    func throwException(message : String){
        print(message)
    }
    
    func addLeftButton(){
        
        let view = UIView(frame: CGRect(x:0, y:0, width:40, height:40))
        let leftButton = UIButton(frame: CGRect(x:0, y:view.center.y, width:30, height:40))
        leftButton.center.y = view.center.y
        
        print(RouteManager.shared.navController.childViewControllers.count )
        
//        if RouteManager.shared.navController.childViewControllers.count == 1 {
//            leftButton.setImage(UIImage(named: "menu_button.png"), for: UIControlState.normal)
//            leftButton.addTarget(self, action:#selector(self.toggleMenu), for: UIControlEvents.touchUpInside)
//        }else{
//            leftButton.setImage(UIImage(named: "ic_arrow_back_white_24.png"), for: UIControlState.normal)
//            leftButton.addTarget(self, action:#selector(self.popController), for: UIControlEvents.touchUpInside)
//        }
//    
        
        view.addSubview(leftButton)
        let barButton = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = barButton
        
    }
    

     @objc func popController(){
        RouteManager.shared.popController()
    }
    
    

    
}
