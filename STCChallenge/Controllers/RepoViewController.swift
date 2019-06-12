//
//  RepoViewController.swift
//  STCChallenge
//
//  Created by assem hakami on 07/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//


import UIKit





class RepoViewController:  UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet var repoTabel: UITableView!
    var repos = [Repository]()
    var url: String = ""
    
    override func viewDidLoad() {
       // changing the color of navigation controller
        self.navigationController?.navigationBar.tintColor = UIColor(red: 222/255, green: 77/255, blue: 79/255, alpha: 1.0)
        
        super.viewDidLoad()
        repoTabel.delegate = self
        repoTabel.dataSource = self
        fetchRepo()
        
    }
    
    // call the fetch repository method in API services
    fileprivate func fetchRepo(){
        APIService.shared.fetchRepo(searchText: self.url) { (r) in
            
            //set the repository in the variable repos
            self.repos = r
            DispatchQueue.main.async {
                self.repoTabel.reloadData()
            }
            
        }
    }
    
    
    // table set up
    //MARK:- UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return repos.count
    }
    
         
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repoTabel.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as! RepoViewCell
        
        
        let repo = self.repos[indexPath.row]
        cell.repo = repo
        return cell
    }
    
    
    // sending data to the destination storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFork" {
            if let indexPath = repoTabel.indexPathForSelectedRow {
                let destination = segue.destination as! ForkViewController
                destination.url = repos[indexPath.row].forks_url ?? ""
                
            }
        }
    }

    
    
    
    
}
