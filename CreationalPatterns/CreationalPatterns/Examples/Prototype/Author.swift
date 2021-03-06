//
//  Author.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/23.
//

import Foundation

class Author {
    private var id: Int
    private var username: String
    private var pages = [Page]()
    
    init(id: Int, username: String) {
        self.id = id
        self.username = username
    }
    
    func add(page: Page) {
        pages.append(page)
    }
    
    var pagesCount: Int {
        return pages.count
    }
    
}

class Page: NSCopying {
    
    private(set) var title: String
    private(set) var contents: String
    private weak var author: Author?
    private(set) var comments = [Comment]()
    
    init(title: String, contents: String, author: Author?) {
        self.title = title
        self.contents = contents
        self.author = author
        author?.add(page: self)
    }
    
    func add(comment: Comment) {
        comments.append(comment)
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Page(title: "Copy of '" + title + "'", contents: contents, author: author)
    }
}

struct Comment {
    let date = Date()
    let message: String
}
