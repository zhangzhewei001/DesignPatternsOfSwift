//
//  AuthViewController.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/17.
//

import UIKit

class AuthViewController: UIViewController {
    
    fileprivate var contentView: AuthView
    
    init(contentView: AuthView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        return nil
    }
    
}

class StudentAuthViewController: AuthViewController {

    /// Student-oriented features
}

class TeacherAuthViewController: AuthViewController {

    /// Teacher-oriented features
}
