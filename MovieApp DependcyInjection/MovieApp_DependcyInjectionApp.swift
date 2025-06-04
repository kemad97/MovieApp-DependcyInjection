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
 
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: DIContainer.shared.resolve(MovieListViewModel.self))        }
    }
}
