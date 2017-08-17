//
//  MovieDetailController.swift
//  movie
//
//  Created by NGI-Noman on 15/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import UIKit

class MovieListController: BaseController {
    
    var movieCollection : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        (view as? MovieListView)?.setData(array: movieCollection)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refreshDataFromServer(){
        
        let urlStr = "\(searchQueryUrl)\(AppHelper.shared.currentSearchStr)"
        
        print( urlStr)
        Servicelayer.requestWithGet(apiName: urlStr) { (status, response, error) in
            
            if status {
                
                var movieData : [Movie] = []
                
                guard let result = response?["results"] as? Array<Dictionary<String,Any>> else {
                    self.throwException(message: NotFoundText)
                    return
                }
                
                print(result)
                
                for dict in result{
                    let movie = Movie()
                    movie.setDataFromServer(dict: dict )
                    movieData.append(movie)
                }
                
                (self.view as? MovieListView)?.setData(array: movieData)
                
            }else{
                
                self.throwException(message: NotFoundText)
                
            }
            
        }
    }
        
        func fetchDataFromServer(){
        
        
            if !isDataAvaiable(){
              //Mark : Prevent To Data call is not available
                (self.view as? MovieListView)?.startStopIndicator(state: false)
                Alert.showToast(message: "No more data to fetch")
                return
            }
        
            AppHelper.shared.pageNumber += 1
            let urlStr = "\(searchQueryUrl)\(AppHelper.shared.currentSearchStr)&page=\(AppHelper.shared.pageNumber)"
            
            print( urlStr)
            Servicelayer.requestWithGet(apiName: urlStr) { (status, response, error) in
                
                if status {
                    
                    if let result = response?["results"] as? Array<Dictionary<String,Any>> {
                       
                        for dict in result{
                            let movie = Movie()
                            movie.setDataFromServer(dict: dict )
                            (self.view as? MovieListView)?._movieCollection.append(movie)
                        }
                        
                        (self.view as? MovieListView)?.appendMoreDataInList()
                        
                    
                    }else {
                        self.throwException(message: NotFoundText)
                    }
                    
                }else{
                    
                    self.throwException(message: NotFoundText)
                    
                }
           
            
        }
        
        
    }
    
    func isDataAvaiable() -> Bool{
       
        if  AppHelper.shared.pageNumber < AppHelper.shared.totalPages{
            return true
        }
        return false
    }

    

}
