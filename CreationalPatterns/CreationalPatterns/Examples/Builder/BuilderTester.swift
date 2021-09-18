//
//  BuilderTester.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/18.
//

import Foundation
import XCTest


class BuilderTeseCase: XCTestCase {
    
    func testBuilderRealWorld() {
        print("Client: Start fetching data from Realm")
        clientCode(builder: RealmQueryBuilder<User>())

        print()

        print("Client: Start fetching data from CoreData")
        clientCode(builder: CoreDataQueryBuilder<User>())
    }
    
    func clientCode(builder: BaseQueryBuilder<User>) {
        
        let results = builder
            .filter { $0.age > 20 }
            .limit(1)
            .fetch()
        
        print("Client code Have fetched: \(results.count) records")
    }
    
}
