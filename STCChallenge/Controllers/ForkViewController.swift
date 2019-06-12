//
//  ForkViewController.swift
//  STCChallenge
//
//  Created by assem hakami on 08/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//

import UIKit


class ForkViewController:  UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet var forkTable: UITableView!
    var forks = [ForkResult]()
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        forkTable.delegate = self
        forkTable.dataSource = self
        fetchFork()
    }
    
     // call the fetch fork method in API services
    fileprivate func fetchFork(){
        APIService.shared.fetchFork(searchText: self.url) { (f) in
            
            //set the forks users in the variable fork
            self.forks = f
            
            DispatchQueue.main.async {
                self.forkTable.reloadData()
            }
            
        }
    }
    
    
    // table set up
    //MARK:- UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = forkTable.dequeueReusableCell(withIdentifier: "ForkCell", for: indexPath) as! ForkViewCell
  
        
        let fork = self.forks[indexPath.row]
        cell.fork = fork
        return cell
    }
    
    
    
    
    
}
