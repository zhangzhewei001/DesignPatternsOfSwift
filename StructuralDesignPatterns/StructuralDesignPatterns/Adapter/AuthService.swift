//
//  AuthService.swift
//  StructuralDesignPatterns
//
//  Created by 张哲炜 on 2021/9/23.
//

import UIKit

protocol AuthService {
    func presentAuthFlow(from viewController: UIViewController)
}

class FacebookAuthSDK {
    func presentAuthFlow(from viewController: UIViewController) {
        /// Call SDK methods and pass a view controller
        print("Facebook WebView has been shown.")
    }
}

class TwitterAuthSDK {
    func startAuthorization(with viewController: UIViewController) {
        /// Call SDK methods and pass a view controller
        print("Twitter WebView has been shown. Users will be happy :)")
    }
}

extension TwitterAuthSDK: AuthService {
    func presentAuthFlow(from viewController: UIViewController) {
        self.startAuthorization(with: viewController)
    }
}

extension FacebookAuthSDK: AuthService {}


class AdapterRealWorld {
    
    func testAdapterRealWorld() {
        
        print("Starting an authorization via Facebook")
        startAuthorization(with: FacebookAuthSDK())
        
        print("Starting an authorization via Twitter.")
        startAuthorization(with: TwitterAuthSDK())
    }
    
    func startAuthorization(with service: AuthService) {
        /// The current top view controller of the app
        let topViewController = UIViewController()
        service.presentAuthFlow(from: topViewController)
    }
}
