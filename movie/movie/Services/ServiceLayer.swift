///
//  ServiceLayer.swift
//  ServicesIntegration
//
//  Created by NGI-Noman on 02/10/2015.
//  Copyright © 2015 NGI-Noman. All rights reserved.
//

import Foundation
import Alamofire


class Servicelayer: NSObject {
    


    /**
    ** GET Method for calling API
    *  Services gateway
    *  Method  get response from server
    *  @parameter              -> requestObject: request josn object ,apiName: api endpoint
    *  @returm                 -> void
    *  @compilationHandler     -> success: status of api, response: respose from server, error: error handling
    **/
    static func requestWithGet( apiName : String,
        completionHandler:
        @escaping (_ success : Bool, _ response : Dictionary<String,Any>?, _ error : AnyObject?) -> Void) {
        
        if !ConnectionHelper.shared.isConnectedToNetwork(){
        Alert.hideLoader()
        Alert.showAlert(title: "No Internet Connection", message: "Make sure your device is connected to internet");
        return;
        }
        
        print(apiName);
    
        let manager = Alamofire.SessionManager.default
        
        //Mark : Set Session To Timeout if response take more time to comes
        manager.session.configuration.timeoutIntervalForRequest = 5
        
        manager.request(apiName, method: .get, parameters: ["":""], encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
             Alert.hideLoader();
            switch(response.result) {
            case .success(let json):
                
                guard let data = json as? Dictionary<String, Any> else {
                  completionHandler(false, nil, response.result.error as AnyObject)
                  return
                }
                
                print(data)
                completionHandler(true, data, nil)


            case .failure(_):
                Alert.hideLoader()
                print("Request failed with error: \(response.result.error!)")
                print((response.result.error! as NSError).localizedDescription)
                self.showAlertView(message: (response.result.error!).localizedDescription as NSString, title: "")
                completionHandler(false, nil, response.result.error as AnyObject)
                break
                
            }
           
        }

    }
    
    // Shoe the alert View
    static func showAlertView (message:NSString,title:NSString) {
        
        Alert.showAlert(title: title as String, message: message as String)

    }
    
}
