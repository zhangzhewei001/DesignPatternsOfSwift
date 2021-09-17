//
//  FactoryTestCase.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/17.
//

import Foundation
import XCTest

private class ClientCode {
    private var currentProjector: Projector?
    
    func present(info: String, with factory: ProjectorFactory) {
        guard let projector = currentProjector else {
            let projector = factory.createProjector()
            projector.present(info: info)
            self.currentProjector = projector
            return
        }
        
        self.currentProjector = factory.syncedProjector(with: projector)
        self.currentProjector?.present(info: info)
    }
}

class FactoryTestCase: XCTestCase {
    
    func test() {
        let clientCode = ClientCode()
        clientCode.present(info: "present Wifi Factory", with: WifiFactory())
        clientCode.present(info: "present Bluetooth Factory", with: BluetoothFactory())
    }
}
