//
//  RepoViewCell.swift
//  STCChallenge
//
//  Created by assem hakami on 07/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//

//class to connect repisotory cell

import UIKit



class RepoViewCell: UITableViewCell{
    
    
    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var repoDesc: UITextView!
    
    @IBOutlet weak var repoFork: UILabel!
    
    @IBOutlet weak var repoLicenseName: UILabel!
    
    @IBOutlet weak var repoLicenseKey: UILabel!
    
    @IBOutlet weak var repoImage: UIImageView!
    
    @IBOutlet weak var repoLicense: UILabel!
    
    var repo: Repository! {
        didSet{
            
            repoName.text = repo.name
            repoFork.text = "\(repo.forks_count ?? 0) forks"
            repoDesc.text = repo.description
            
            if repo.license?.name != nil {
                repoLicenseName.text = "Name: \(repo.license?.name ?? "")"
            }else{
                repoLicenseName.text = "no License Name"
            }
            
            
            
            if repo.license?.key != nil {
                repoLicenseKey.text = "Key: \(repo.license?.key ?? "")"
            }else{
               repoLicenseKey.text = "no License Key"
            }
            
            repoLicense.text = "License"
            repoImage.image = UIImage(named: "icons8-popeye-50")!
            
        }
    }
    
    
}
