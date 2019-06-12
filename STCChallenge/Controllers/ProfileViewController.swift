//
//  ProfileViewController.swift
//  STCChallenge
//
//  Created by assem hakami on 08/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//

import UIKit

class ProfileViewController:  UIViewController{
    
    //set up and connect to the UI
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var profileFollowers: UILabel!
    @IBOutlet weak var profileFollowing: UILabel!
    @IBOutlet weak var profileReopNum: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    
    var person = People()
    var url: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProfile()
        

    }


     // call the fetch profile method in API services
    fileprivate func fetchProfile(){
        APIService.shared.fetchPeopleProfile(searchText: self.url) { (p) in
            self.person = p
            
            DispatchQueue.main.async{
                self.profileName.text = "Name: \(p.login ?? "No Name")"
            self.profileEmail.text = "Email: \(p.email ?? "No Email")"
            self.profileFollowers.text = "\(p.followers ?? 0) followers"
            self.profileFollowing.text = "\(p.following ?? 0) following"
            self.profileReopNum.text = "\(p.public_repos ?? 0) repository"
            guard let url = URL(string: p.avatar_url ?? "") else {return}
            self.profileImage.sd_setImage(with: url)
            }
            
        }
    }
    
    // sending data to the destination storyboard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRepo" {
                    
                let destination = segue.destination as! RepoViewController
                destination.url = self.person.repos_url ?? ""
        }
    }

    
    
    
    
}
