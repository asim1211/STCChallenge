//
//  Fork.swift
//  STCChallenge
//
//  Created by assem hakami on 08/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//

//class for the Fork users for a repository and the information that the Fork users have

import Foundation


struct Fork: Codable{
    //username
    var login: String?
    // user image
    var avatar_url: String?
    // url to ger user repository
    var repos_url:String?
    
}
