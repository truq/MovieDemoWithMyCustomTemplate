//
//  SearchController.swift
//  movie
//
//  Created by NGI-Noman on 15/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import UIKit

class SearchController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppHelper.shared.pageNumber = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchMovie(searchString : String){

        guard searchString.characters.count > 1 else {
            Alert.showAlert(title: "", message: EmptyText)
            return
        }
        self.searchAtServer(searchString: searchString)
    }


    func fetchRecentSearch(){
        
        AppHelper.shared.loadRecentSearched()
        
        guard AppHelper.shared.suggestionArray != nil && AppHelper.shared.suggestionArray.count > 0 else {
         (view as? SearchView)?.hideSuggestionList()
          return
        }
        
        (view as? SearchView)?.showSuggestionList()
        (view as? SearchView)?.setData(array: AppHelper.shared.suggestionArray)
        
    }
    
    
    func searchAtServer(searchString : String){
        
      AppHelper.shared.currentSearchStr = searchString
      let urlStr = "\(searchQueryUrl)\(searchString)&page=\(AppHelper.shared.pageNumber)"
      
     let urlwithPercentEscapes = urlStr.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
      print( urlStr)
       Servicelayer.requestWithGet(apiName: urlwithPercentEscapes!) { (status, response, error) in
        
        if status {
            
            var movieData : [Movie] = []
            
            guard let result = response?["results"] as? Array<Dictionary<String,Any>> else {
             self.throwException(message: NotFoundText)
             return
            }
            AppHelper.shared.totalPages = (response?["total_pages"] as! Int)

            for dict in result{
                let movie = Movie()
                movie.setDataFromServer(dict: dict )
                movieData.append(movie)
            }
            
            
            if movieData.count == 0 {
                self.throwException(message: NotFoundText)
                return
            }
            
            RecentSearched.saveSearchRecord(searchStr: searchString)
            self.navigateToMovieList(data: movieData)
            
        }else{
          
          self.throwException(message: NotFoundText)
            
        }
        
       }
      
    }

    func navigateToMovieList(data : [Movie]){

      (view as? SearchView)?.resetSearchBar()
       let controller = MovieListController()
       controller.movieCollection = data
       RouteManager.shared.pushController(controller)
        
    }
    
    override func throwException(message: String) {
        Alert.showToast(message: message)
    }
    
    

    
    

}
