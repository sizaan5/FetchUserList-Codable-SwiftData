//
//  FetchUserList_Codable_SwiftDataApp.swift
//  FetchUserList-Codable-SwiftData
//
//  Created by Izaan Saleem on 10/09/2024.
//

import SwiftUI
import SwiftData

@main
struct FetchUserList_Codable_SwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: UsersModel_SwiftData.self)
    }
}
