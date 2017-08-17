//
//  SearchView.swift
//  movie
//
//  Created by NGI-Noman on 15/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import UIKit

class SearchView: BaseView,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnSearch: UIButton!
    
    let _cellIdentifier : String = "SearchedCell"
    var _suggestions = Array<RecentSearched>()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        // Register custom cell
        let nib = UINib(nibName: "RecentSearchViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier:_cellIdentifier)
    }
    
    func setData(array : Array<RecentSearched>){
        _suggestions = array
        tableView.reloadData()
    }
    
    @IBAction func didTapOnSearchBtn(_ sender: UIButton) {

        (controller as? SearchController)?.searchMovie(searchString: searchBar.text!)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if _suggestions.count > 10 {
            return 10
        }
        return _suggestions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return menuCellAtIndexPath(indexPath: indexPath as NSIndexPath)
    }
    
    func menuCellAtIndexPath(indexPath:NSIndexPath) -> RecentSearchViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: _cellIdentifier) as! RecentSearchViewCell
        setCellData(tableCell: cell,indexPath : indexPath)
        return cell
    }
    
    func setCellData(tableCell:RecentSearchViewCell,indexPath:NSIndexPath){
        
        let recentSearched = _suggestions[indexPath.row]
        tableCell.lblTitle.text = recentSearched.title!
        tableCell.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! RecentSearchViewCell
        
        (controller as? SearchController)?.searchAtServer(searchString: cell.lblTitle.text!)
        
    }
    
    
    func showSuggestionList(){
        self.tableView.isHidden = false
    }
    func hideSuggestionList(){
        self.tableView.isHidden = true
    }
    
    
    //  UISearchBar-Delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidBeginEditing", terminator: "")
        searchBar.showsCancelButton = true
        
        (controller as? SearchController)?.fetchRecentSearch()
        
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidEndEditing", terminator: "")
        searchBar.showsCancelButton = false
        self.hideSuggestionList()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarCancelButtonClicked", terminator: "")
        self.resetSearchBar()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("searchBarSearchButtonClicked", terminator: "")
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("textDidChange", terminator: "")
        
    }
    
    func resetSearchBar(){
        self.searchBar.resignFirstResponder()
        self.searchBar.text = ""
        self.searchBar.placeholder = "Enter Movie Name"
    }

}
