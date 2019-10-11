//
//  ViewController.swift
//  1search
//
//  Created by Mac on 19/09/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit


var name = ["idli","Pav - Bhaji","Pizza","Dhokala","Pani - Puri","Samosa","Sandwitch","Burger","kacchi - Dabeli","Misal - Pav","Udid - Vada","Dahi - Vada","Momos","Dosa","Chinese - Bhel","Pohe"]
var images = [UIImage(named: "idli"), UIImage(named: "pavbhaji"), UIImage(named: "pizzanew"), UIImage(named: "dhokala"),UIImage(named: "panipuri"), UIImage(named: "samosa"),UIImage(named: "sandwitch"),UIImage(named: "bhel"), UIImage(named: "kacchi_dabeli"), UIImage(named: "images"),UIImage(named: "uidvada"),UIImage(named: "dh"),UIImage(named: "momos"),UIImage(named: "dosa"),UIImage(named: "chinese_bhel"),UIImage(named: "pohe")]
var prize = ["Price:50","Price:70","Price:100","Price:50","Price:30","Price:20","Price:80","Price:50","Price:20","Price:60","Price:70","Price:60","Price:120","Price:50","Price:40","Price:30"]

var filteredTableData = [String]()
var imagedata = [String] ()
var resultSearchController = UISearchController()
var searching = false

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        imagedata.removeAll()
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        //let arratn = (images as NSArray).filtered(using:searchPredicate)
        let array = (name as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableview.reloadData()
    }
    
    
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (resultSearchController.isActive) {
            return filteredTableData.count
           
        }
        else {
            return images.count
            return name.count
            return prize.count
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
     
            controller.searchBar.barTintColor = .red
            
            //tableview.reloadData()
            tableview.tableHeaderView = controller.searchBar
            //tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        tableview.reloadData()
        // Reload the table
        //tableView.reloadData()
    }
  
    @IBOutlet weak var searchview: UISearchBar!
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
func numberOfSections(in tableView: UITableView) -> Int {
        // 1
        // return the number of sections
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! viewcontrollerTableViewCell
        
        
        
        
        if (resultSearchController.isActive) {
            cell.labelname?.text = filteredTableData[indexPath.row]
//cell.labelprize?.text = filteredTableData[indexPath.row]
           // cell.nameimg?.image = filteredtable[indexPath.row]
            
            return cell
        }
        else {
    
            cell.labelname?.text = name[indexPath.row]
            cell.labelprize?.text = prize[indexPath.row]
            cell.nameimg?.image = images[indexPath.row]
            print(name[indexPath.row])
            return cell
        }
        
        
        //cell.labelname?.text = name[indexPath.row]
        
        //cell.nameimg?.image = UIImage(named: (name[indexPath.row] + ".jpeg"))
        //cell.spicesimg?.image = UIImage(named: (spices[indexPath.row] + ".jpeg"))
        //return (cell)
    }
}



