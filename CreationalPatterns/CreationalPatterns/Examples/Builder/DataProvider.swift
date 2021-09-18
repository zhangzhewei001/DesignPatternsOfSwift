//
//  Provider.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/18.
//

import Foundation

class RealmProvider {
    
    func fetch<Model: DomainModel>(_ operations: [RealmQueryBuilder<Model>.Query]) -> [Model] {
        
        print("RealmProvider: Retrieving data from Realm...")
        
        for item in operations {
            switch item {
            case .filter(_):
                /// Use Realm instance to filter results.
                print("RealmProvider: executing the 'filter' operation.")
                break
            case .limit(_):
                /// Use Realm instance to limit results.
                print("RealmProvider: executing the 'limit' operation.")
                break
            }
        }
        
        return []
    }
    
}


class CoreDataProvider {
    
    func fetch<Model: DomainModel>(_ operations: [CoreDataQueryBuilder<Model>.Query]) -> [Model] {
        
        /// Create a NSFetchRequest
        
        print("CoreDataProvider: Retrieving data from CoreData...")
        
        for item in operations {
            switch item {
            case .filter(_):
                print("CoreDataProvider: executing the 'filter' operation.")
                /// Set a 'predicate' for a NSFetchRequest.
                break
            case .limit(_):
                print("CoreDataProvider: executing the 'limit' operation.")
                /// Set a 'fetchLimit' for a NSFetchRequest.
                break
            case .includesPropertyValues(_):
                print("CoreDataProvider: executing the 'includesPropertyValues' operation.")
                /// Set an 'includesPropertyValues' for a NSFetchRequest.
                break
            }
        }
        
        /// Execute a NSFetchRequest and return results.
        return []
    }
    
}
