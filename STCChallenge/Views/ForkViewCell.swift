//
//  ForkViewCell.swift
//  STCChallenge
//
//  Created by assem hakami on 08/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//


// class to connect fork user cell

import UIKit



class ForkViewCell: UITableViewCell{

    
    @IBOutlet weak var forkImage: UIImageView!
    
    @IBOutlet weak var forkName: UILabel!
    
    
    var fork: ForkResult! {
        didSet{
            guard let url = URL(string: fork.owner?.avatar_url ?? "") else { return }
            forkImage.sd_setImage(with: url, completed: nil)
            
            forkName.text = fork.owner?.login
        }
        
    }
    
}
