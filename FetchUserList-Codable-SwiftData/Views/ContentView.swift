//
//  ContentView.swift
//  FetchUserList-Codable-SwiftData
//
//  Created by Izaan Saleem on 10/09/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //MARK: - @State properties
    //@State private var user: [UsersModel] = []
    @Environment(\.modelContext) var modelContext
    @Query var user: [UsersModel_SwiftData]
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    //MARK: - body
    var body: some View {
        NavigationStack {
            List {
                ForEach(self.user, id: \.id) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        HStack {
                            Text(user.name ?? "")
                                .fontWeight(.medium)
                            Spacer()
                            VStack {
                                Text(user.isActive ?? false ? "🟢" : "🔴")
                                Text(user.isActive ?? false ? "Online" : "Offline")
                                    .font(.caption)
                                    .foregroundStyle(.primary)
                            }
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    if self.user.count <= 0 {
                        await self.getUsers()
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
    
    //MARK: - Helper methods
    func getUsers() async {
        print("API called")
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try decoder.decode([UsersModel_SwiftData]?.self, from: data) {
                for decoded in decodedResponse {
                    modelContext.insert(decoded)
                }
                //self.user = decodedResponse
            } else {
                print("if let block not working")
            }
        } catch {
            self.alertTitle = "Oops!"
            self.alertMessage = "Fetch failed: \(error.localizedDescription)"
            self.showingAlert = true
        }
    }
}

#Preview {
    ContentView()
}
