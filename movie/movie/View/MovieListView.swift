//
//  MovieListView.swift
//  movie
//
//  Created by NGI-Noman on 15/08/2017.
//  Copyright © 2017 NGI-Noman. All rights reserved.
//

import UIKit

class MovieListView: BaseView ,UITableViewDataSource,UITableViewDelegate{


     var _movieCollection = Array<Movie>()
     let _cellIdentifier : String = "ListCell"
    let _refreshCellIdentifier  : String = "RefreshCell"

    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    

    func setupUI(){
        // Register custom cell
        let nib = UINib(nibName: "ListViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier:_cellIdentifier)
        let nib2 = UINib(nibName: "RefreshCellView", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier:_refreshCellIdentifier)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 202.0
        

    }
    
    func setData(array:[Movie]){
        _movieCollection = array
        tableView.reloadData()
    }
    func appendMoreDataInList(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(_movieCollection.count)
        return _movieCollection.count + 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if((indexPath as NSIndexPath).row < _movieCollection.count)
        {
            // Code for show your data set
            return listCellAtIndexPath(indexPath: indexPath as NSIndexPath)
        }
        else{
            // Code to show Refersh cell
            return refreshCellAtIndexPath(indexPath: indexPath as NSIndexPath)
        }
        
        
    }
    
    func listCellAtIndexPath(indexPath:NSIndexPath) -> ListViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: _cellIdentifier) as! ListViewCell
        setCellData(tableCell: cell,indexPath : indexPath)
        return cell
    }
    
    func refreshCellAtIndexPath(indexPath:NSIndexPath) -> RefreshCellView {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: _refreshCellIdentifier) as! RefreshCellView
        cell.startStopLoading(false)
        return cell
    }
    
    func setCellData(tableCell:ListViewCell,indexPath:NSIndexPath){
        
        let movie = _movieCollection[indexPath.row]
        tableCell.lblTitle.text = movie.title
        tableCell.lblReleaseDate.text = movie.releaseDate
        tableCell.lblOverView.text = movie.overView
        tableCell.imgThumb.setImageFromUrl(urlStr: "\(imageBaseUrl)\(movie.posterUrl!)")
        tableCell.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool){
        
        // UITableView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 10.0 {
             startStopIndicator(state: true)
            (controller as? MovieListController)?.fetchDataFromServer()
        }
    }
    
    func startStopIndicator(state:Bool){
        
        DispatchQueue.main.async {
            let lastCellIndexPath = IndexPath(row:self._movieCollection.count , section: 0)
            
            guard let refreshCell = self.tableView.cellForRow(at: lastCellIndexPath) as? RefreshCellView else {
                return
            }
            refreshCell.startStopLoading(state)
    
        }
        
    }



}
