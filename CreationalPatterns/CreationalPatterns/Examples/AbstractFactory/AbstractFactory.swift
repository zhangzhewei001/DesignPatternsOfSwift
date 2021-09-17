//
//  AbstractFactory.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/17.
//

import UIKit

enum AuthType {
    case signUp
    case login
}

protocol AuthViewFactory {
    static func authView(for type: AuthType) -> AuthView
    static func authViewController(for type: AuthType) -> AuthViewController
}

class StudentAuthViewFactory: AuthViewFactory {
    static func authView(for type: AuthType) -> AuthView {
        switch type {
        case .signUp:
            return StudentSignUpView()
        case .login:
            return StudentLoginView()
        }
    }
    
    static func authViewController(for type: AuthType) -> AuthViewController {
        return StudentAuthViewController(contentView: authView(for: type))
    }
}

class TeacherAuthViewFactory: AuthViewFactory {
    static func authView(for type: AuthType) -> AuthView {
        switch type {
        case .signUp:
            return TeacherSignUpView()
        case .login:
            return TeacherLoginView()
        }
    }
    
    static func authViewController(for type: AuthType) -> AuthViewController {
        return TeacherAuthViewController(contentView: authView(for: type))
    }
}

