//
//  Factory.swift
//  CreationalPatterns
//
//  Created by 张哲炜 on 2021/9/17.
//

import Foundation

protocol ProjectorFactory {
    
    func createProjector() -> Projector
    
    func syncedProjector(with projector: Projector) -> Projector
}

extension ProjectorFactory {
    func syncedProjector(with projector: Projector) -> Projector {
        let newProjector = createProjector()
        return newProjector
    }
}

class WifiFactory: ProjectorFactory {
    func createProjector() -> Projector {
        return WifiProjector()
    }
}

class BluetoothFactory: ProjectorFactory {
    func createProjector() -> Projector {
        return BluetoothProjector()
    }
}


