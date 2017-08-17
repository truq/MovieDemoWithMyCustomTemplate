//
//  SizeUtil.swift
//  FeelingBless
//
//  Created by NGI-NOMAN on 10/6/15.
//  Copyright (c) 2015 NGI-NOMAN. All rights reserved.
//

import Foundation
import UIKit


class SizeUtil {
    
    private init() {
        print("AAA");
    }
    class func iphone6SizeToOtherPhonesRespectively(size : CGFloat) -> CGFloat{
        
        /*
             Resize View to thier Canvas area
        */
        
        var tempSize = size;
        
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 480:
                //print("iPhone Classic")
                tempSize = ( size * 72.3 ) / 100 ;
            case 960:
               // print("iPhone 4 or 4S")
                tempSize = ( size * 72.3 ) / 100 ;
            case 1136:
                //print("iPhone 5 or 5S or 5C")
                tempSize = ( size * 85.3 ) / 100 ;
            case 1334:
                //print("iPhone 6 or 6S")
                tempSize = size;
            case 2208:
               // print("iPhone 6+ or 6S+")
                tempSize = ( size * 110.47 ) / 100 ;
            default:
                break
            }
        }
        
        
        return tempSize
    }
    
}

