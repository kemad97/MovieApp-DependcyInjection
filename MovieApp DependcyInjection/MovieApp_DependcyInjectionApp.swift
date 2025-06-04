//
//  MovieApp_DependcyInjectionApp.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import SwiftUI
import SwiftData

@main
struct MovieApp_DependcyInjectionApp: App {
 
    
    private let coordinator = AppCoordinator()
    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
}
