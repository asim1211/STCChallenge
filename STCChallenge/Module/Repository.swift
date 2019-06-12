//
//  Repository.swift
//  STCChallenge
//
//  Created by assem hakami on 07/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//

//class for the repository and the information that the repository have

import Foundation


struct Repository: Codable{
    
    //repository name
    var name: String?
    //repository describtion
    var description: String?
    //repository fork number
    var forks_count: Int?
    //repository Licenses
    var license: License?
    //url to get user that forked for this repository
    var forks_url:String?
    
}
