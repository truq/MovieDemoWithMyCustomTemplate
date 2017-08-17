//
//  Alert.swift
//  FeelingBless
//
//  Created by NGI-NOMAN on 10/7/15.
//  Copyright (c) 2015 NGI-NOMAN. All rights reserved.
//

import Foundation
import MBProgressHUD

class Alert: NSObject {
    
   static var loadingAlert : MBProgressHUD!
    
    static func showLoader(message : String){
        
        loadingAlert = MBProgressHUD.showAdded(to: AppDelegate.getInstatnce().window!, animated: true)
        loadingAlert.label.text = message
        
        
    }
    static func hideLoader(){
        
        MBProgressHUD.hide(for: AppDelegate.getInstatnce().window!, animated: true)
        
    }
    
    static func showAlert(title : String,message : String){
        
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) -> Void in
            // do something after completation
        }
        alert.addAction(alertAction)
        AppDelegate.getInstatnce().window?.rootViewController!.present(alert, animated: true, completion: nil)
            
    }
    static func showToast(message:String){
        
        loadingAlert = MBProgressHUD.showAdded(to: AppDelegate.getInstatnce().window!, animated: true)
        loadingAlert.label.text = message
        loadingAlert.label.font = UIFont(name:"Arial", size: SizeUtil.iphone6SizeToOtherPhonesRespectively(size: 13))!
        loadingAlert.mode = MBProgressHUDMode.text
        loadingAlert.margin = 15
        loadingAlert.offset.y = 200
        loadingAlert.removeFromSuperViewOnHide = true
        loadingAlert.hide(animated:true, afterDelay: 1.5)
        
    }
}



