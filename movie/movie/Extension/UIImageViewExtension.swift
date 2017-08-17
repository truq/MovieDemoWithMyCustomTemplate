//
//  UIImageViewExtension.swift
//  movie
//
//  Created by NGI-Noman on 16/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import Kingfisher


extension UIImageView{

    
    func setImageFromUrl(urlStr:String){
        
        let url2 = URL(string: urlStr)!
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url2,
                              placeholder: nil,
                              options: [.transition(.fade(1))],
                              progressBlock: nil,
                              completionHandler: nil)
        
    }
    
    
}
