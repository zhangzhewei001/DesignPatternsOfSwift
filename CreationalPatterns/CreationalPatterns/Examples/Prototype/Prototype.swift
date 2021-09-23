//
//  Prototype.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/17.
//

import Foundation
import XCTest


class PrototypeRealWorld: XCTest {
    func test() {
        
        let author = Author(id: 1, username: "William Cheung")
        let page = Page(title: "First", contents: "Something else", author: author)
        
        page.add(comment: Comment(message: "This is a comment."))
        
        guard let anotherPage = page.copy() as? Page else { return }
        
        /// Comments should be empty as it is a new page.
        XCTAssert(anotherPage.comments.isEmpty)
        
        /// Note that the author is now referencing two objects.
        XCTAssert(author.pagesCount == 2)
        
        print("Original title: " + page.title)
        print("Copied title: " + anotherPage.title)
        print("Count of pages: " + String(author.pagesCount))
    }
}
