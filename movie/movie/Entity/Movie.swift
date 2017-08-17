//
//  Movie.swift
//  movie
//
//  Created by NGI-Noman on 15/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import Foundation


class Movie {
    
    var posterUrl : String?
    var title : String?
    var releaseDate : String?
    var overView : String?
    
     func setDataFromServer(dict : Dictionary<String,Any>){
        
        if let obj =  dict["original_title"] as? String{
            title = obj
        }
        if let obj =  dict["release_date"] as? String{
            releaseDate = obj
        }
        if let obj =  dict["overview"] as? String{
            overView = obj
        }
     
        if let obj =  dict["poster_path"] as? String{
            posterUrl = obj
        }else{
            posterUrl = "/2DtPSyODKWXluIRV7PVru0SSzja.jpg"
        }

        
    }

    
}
