//
//  STCChallengeTests.swift
//  STCChallengeTests
//
//  Created by assem hakami on 06/10/1440 AH.
//  Copyright © 1440 assem hakami. All rights reserved.
//

import XCTest
@testable import STCChallenge

class STCChallengeTests: XCTestCase {
    var sut: MainViewController!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testFetch() {
        let ex = expectation(description: """
{"total_count":1,"incomplete_results":false,"items":[{"login":"Asim12112","id":38713977,"node_id":"MDQ6VXNlcjM4NzEzOTc3","avatar_url":"https://avatars3.githubusercontent.com/u/38713977?v=4","gravatar_id":"","url":"https://api.github.com/users/Asim12112","html_url":"https://github.com/Asim12112","followers_url":"https://api.github.com/users/Asim12112/followers","following_url":"https://api.github.com/users/Asim12112/following{/other_user}","gists_url":"https://api.github.com/users/Asim12112/gists{/gist_id}","starred_url":"https://api.github.com/users/Asim12112/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/Asim12112/subscriptions","organizations_url":"https://api.github.com/users/Asim12112/orgs","repos_url":"https://api.github.com/users/Asim12112/repos","events_url":"https://api.github.com/users/Asim12112/events{/privacy}","received_events_url":"https://api.github.com/users/Asim12112/received_events","type":"User","site_admin":f,"score":22.183418}]}
""")
        
        APIService.shared.fetchAllPeople(searchText: "https://api.github.com/search/users?q=Asim12112") { (result) in
            
            XCTAssertNil(nil)
            XCTAssertNotNil(result)
            ex.fulfill()
            
        }
        
        waitForExpectations(timeout: 30) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }

}
