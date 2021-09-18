//
//  Builder.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/17.
//

import Foundation

protocol DomainModel {}

public struct User: DomainModel {
    let id: Int
    let age: Int
    let email: String
}

class BaseQueryBuilder<Model: DomainModel> {
    typealias Predicate = (Model) -> (Bool)
    
    func limit(_ limit: Int) -> BaseQueryBuilder<Model> {
        return self
    }
    
    func filter(_ predicate: @escaping Predicate) -> BaseQueryBuilder<Model> {
        return self
    }
    
    func fetch() -> [Model] {
        preconditionFailure("Should be overridden in subclasses.")
    }
}

class RealmQueryBuilder<Model: DomainModel>: BaseQueryBuilder<Model> {
    enum Query {
        case filter(Predicate)
        case limit(Int)
    }
    
    fileprivate var operations = [Query]()
    
    @discardableResult
    override func limit(_ limit: Int) -> BaseQueryBuilder<Model> {
        operations.append(Query.limit(limit))
        return self
    }
    
    @discardableResult
    override func filter(_ predicate: @escaping BaseQueryBuilder<Model>.Predicate) -> BaseQueryBuilder<Model> {
        operations.append(Query.filter(predicate))
        return self
    }
    
    //func includesPropertyValues(_ toggle: Bool) -> CoreD
}


class CoreDataQueryBuilder<Model: DomainModel>: BaseQueryBuilder<Model> {

    enum Query {
        case filter(Predicate)
        case limit(Int)
        case includesPropertyValues(Bool)
        /// ...
    }

    fileprivate var operations = [Query]()

    override func limit(_ limit: Int) -> CoreDataQueryBuilder<Model> {
        operations.append(Query.limit(limit))
        return self
    }

    override func filter(_ predicate: @escaping Predicate) -> CoreDataQueryBuilder<Model> {
        operations.append(Query.filter(predicate))
        return self
    }

    func includesPropertyValues(_ toggle: Bool) -> CoreDataQueryBuilder<Model> {
        operations.append(Query.includesPropertyValues(toggle))
        return self
    }

    override func fetch() -> [Model] {
        print("CoreDataQueryBuilder: Initializing CoreDataProvider with \(operations.count) operations.")
        return CoreDataProvider().fetch(operations)
    }
}
