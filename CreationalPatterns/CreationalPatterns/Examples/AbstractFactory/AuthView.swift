//
//  AuthView.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/17.
//

import UIKit

protocol AuthView {
    typealias AuthAction = (AuthType) -> ()
    var contentView: UIView { get }
    var description: String { get }
    var action: AuthAction? { get set }
}

class StudentSignUpView: UIView, AuthView {
    
    private class StudentSignUpContentView: UIView {
        var titleLabel: UILabel = UILabel()
    }
   
    var contentView: UIView = StudentSignUpContentView()
    override var description: String { "Student SignUp View" }
    var action: AuthAction?
}

class StudentLoginView: UIView, AuthView {
    
    private class StudentLoginContentView: UIView {
        var loginBtn = UIButton()
        var emailTextField = UIButton()
        var passwordTextField = UIButton()
        var titleLabel: UILabel = UILabel()
    }
    
    var contentView: UIView = StudentLoginContentView()
    override var description: String { "Student Login View" }
    var action: AuthAction?
    
}

class TeacherSignUpView: UIView, AuthView {
    
    private class TeacherSignUpContentView: UIView {
        var titleLabel: UILabel = UILabel()
    }
    
    var contentView: UIView = TeacherSignUpContentView()
    override var description: String { "Teacher SignUp View" }
    var action: AuthAction?
}

class TeacherLoginView: UIView, AuthView {
    private class TeacherLoginContentView: UIView {
        var loginBtn = UIButton()
        var emailTextField = UIButton()
        var passwordTextField = UIButton()
        var titleLabel: UILabel = UILabel()
    }
    
    var contentView: UIView = TeacherLoginContentView()
    override var description: String { "Teacher Login View" }
    var action: AuthAction?
}
