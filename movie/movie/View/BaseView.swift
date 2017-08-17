//
//  BaseView.swift
//  NGIPattern
//
//  Created by NGI-Noman on 04/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import Foundation
import UIKit


class BaseView: UIView {
  
    var controller  = BaseController();
    
    //Mark : Initialize UIView With Frame (x,y,width,height)
     override init(frame: CGRect) {
      super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Mark : Initialize All UI Element Here
    func customizeUI(){
        
    }
    
}
