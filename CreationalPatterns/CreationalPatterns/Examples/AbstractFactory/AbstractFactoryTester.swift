//
//  AbstractFactoryTester.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/17.
//

import UIKit
import XCTest

class AFClientCode {
    private var currentController: AuthViewController?
    
    private lazy var navigationController: UINavigationController = {
            guard let vc = currentController else { return UINavigationController() }
            return UINavigationController(rootViewController: vc)
        }()
    
    private let factoryType: AuthViewFactory.Type
    
    init(factoryType: AuthViewFactory.Type) {
        self.factoryType = factoryType
    }
    
    func presentLogin() {
        let controller = factoryType.authViewController(for: .login)
        navigationController.pushViewController(controller, animated: false)
    }
    
    func presentSignUp() {
        let controller = factoryType.authViewController(for: .signUp)
        navigationController.pushViewController(controller, animated: false)
    }
}


class AbstractFactoryTestCase: XCTestCase {
    
    func test() {
        #if teacherMode
        let afClientCode = AFClientCode(factoryType: TeacherAuthViewFactory.self)
        #else
        let afClientCode = AFClientCode(factoryType: TeacherAuthViewFactory.self)
        #endif
        
        afClientCode.presentLogin()
        afClientCode.presentSignUp()
    }
}
