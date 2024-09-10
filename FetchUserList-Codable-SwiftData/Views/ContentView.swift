//
//  ContentView.swift
//  FetchUserList-Codable-SwiftData
//
//  Created by Izaan Saleem on 10/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - @State properties
    @State private var user: [UsersModel] = []
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
                                Color(user.isActive ?? false ? .green : .red)
                                    .frame(width: 10, height: 10)
                                    .clipShape(.circle)
                                Text(user.isActive ?? false ? "Online" : "Offline")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
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
        print("called")
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedOrder = try JSONDecoder().decode([UsersModel].self, from: data)
            self.user = decodedOrder
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
