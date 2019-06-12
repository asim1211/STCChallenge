//
//  People.swift
//  STCChallenge
//
//  Created by assem hakami on 06/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.


// class for the user and the information that the user have

import Foundation


struct People: Codable{
    //username
    var login: String?
    // url to ger user repository
    var repos_url: String?
    // user image
    var avatar_url: String?
    // to get user page
    var url: String?
    // user followers number
    var followers: Int?
    // user following number
    var following:Int?
    // user repos number
    var public_repos: Int?
    // user Email
    var email: String?
    
}
