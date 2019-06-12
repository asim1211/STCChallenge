//
//  MainViewCell.swift
//  STCChallenge
//
//  Created by assem hakami on 06/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//

//class to connect user search cell

import UIKit
import SDWebImage

class MainViewCell: UITableViewCell{
    
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var personNameLabel: UILabel!
    
    
    var person: People! {
        didSet{
            
            
            personNameLabel.text = person.login
             guard let url = URL(string: person.avatar_url ?? "") else { return }
            profileImg.sd_setImage(with: url, completed: nil)
            
        }
    }
    
    
    
    
}
