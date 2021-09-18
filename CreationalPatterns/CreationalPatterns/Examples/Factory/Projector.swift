//
//  Projector.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/17.
//

import Foundation

protocol Projector {

    var currentPage: Int { get }

    func present(info: String)

    func sync(with projector: Projector)

    func update(with page: Int)
}

extension Projector {
    
    func sync(with projector: Projector) {
        projector.update(with: currentPage)
    }
    
}

class WifiProjector: Projector {
    var currentPage: Int = 0
    
    func present(info: String) {
        print("present form Wifi With Info: \(info)")
    }
    
    func update(with page: Int) {
        currentPage = page
    }
}

class BluetoothProjector: Projector {
    var currentPage: Int = 0
    
    func present(info: String) {
        print("present form Bluetooth With Info: \(info)")
    }
    
    func update(with page: Int) {
        
    }
}
