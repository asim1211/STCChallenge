//
//  ViewController.swift
//  STCChallenge
//
//  Created by assem hakami on 06/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//

import UIKit
import Alamofire


class MainViewController: UITableViewController, UISearchBarDelegate  {
    
    // table view variable
    @IBOutlet var PeopleTable: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    //the next two variables for the loading indicator creation
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    
    // to make the alert massage come after search done
    var check = false

    var people = [People]()
    let cellId = "cellId"
    
   
    
    override func viewDidLoad() {
       super.viewDidLoad()
      self.searchBar.delegate = self
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

   
    // function that triggered after the user search for a user
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
     
        // to set up the loading indicator
        self.loadingIndicator.hidesWhenStopped = true
        self.loadingIndicator.style = UIActivityIndicatorView.Style.gray
        self.loadingIndicator.startAnimating();
        self.alert.view.addSubview(self.loadingIndicator)
        
        //showing the loading indicator
        self.present(self.alert, animated: true, completion: nil)
        
        // call the fetch user method in API services
        APIService.shared.fetchPeople(searchText: searchBar.text ?? "") { (people) in
            
            //set the users in the variable people
            self.people = people
            self.check = true
            self.PeopleTable.reloadData()
        }
        
    }
    

    // table set up
    //MARK:- UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
            
        if people.count == 0 {
            dismiss(animated: false, completion: nil)
            let noUserAlert = UIAlertController(title: "No User", message: "There is no user with this username", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            noUserAlert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
            
            // show the alert
            if check == true{
            self.present(noUserAlert, animated: true, completion: nil)
            
            }
        }
        return people.count
    }
    
    
 
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PeopleTable.dequeueReusableCell(withIdentifier: "PeopleCell", for: indexPath) as! MainViewCell
        
        let person = self.people[indexPath.row]
        cell.person = person
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        dismiss(animated: false, completion: nil)
        
    }
    
    
    // sending data to the destination storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfile" {
            
            if let indexPath = PeopleTable.indexPathForSelectedRow {
                let destination = segue.destination as! ProfileViewController
                destination.url = people[indexPath.row].url ?? ""
              
            }
        }
    }
    
    
    
    
}

