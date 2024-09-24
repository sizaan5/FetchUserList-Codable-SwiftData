//
//  DetailView.swift
//  FetchUserList-Codable-SwiftData
//
//  Created by Izaan Saleem on 10/09/2024.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    //MARK: - Properties
    var user: UsersModel_SwiftData
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.25), Color.gray.opacity(0.85)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(user.name ?? "")
                                .font(.title2)
                        }
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Email")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(user.email ?? "")
                                .font(.title2)
                        }
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Company")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(user.company ?? "")
                                .font(.title2)
                        }
                        .padding()
                        VStack(alignment: .leading) {
                            Text("About")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(user.about ?? "")
                                .font(.title2)
                        }
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Address")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text(user.address ?? "")
                                .font(.title2)
                        }
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Registration date")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Text((user.registered ?? "").toDate())
                                .font(.title2)
                        }
                        .padding()
                        
                        Text("Friends")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(self.user.friends ?? [], id: \.self.id) { friend in
                                    VStack {
                                        Text(friend.name ?? "N/A")
                                            .padding()
                                    }
                                    .background(Color.gray.opacity(0.45))
                                    .clipShape(
                                        .rect(
                                            topLeadingRadius: 0,
                                            bottomLeadingRadius: 20,
                                            bottomTrailingRadius: 0,
                                            topTrailingRadius: 20
                                        )
                                    )
                                    .padding()
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.title2)
                }
                .navigationTitle(user.isActive ?? false ? "🟢 Online" : "🔴 Offline")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: UsersModel_SwiftData.self, configurations: config)
        let friends = [(Friends_SwiftData(id: "100", name: "Friend1")), (Friends_SwiftData(id: "200", name: "Friend2")), (Friends_SwiftData(id: "300", name: "Friend3")), (Friends_SwiftData(id: "400", name: "Friend4"))]
        let user = UsersModel_SwiftData(id: "1", isActive: true, name: "Izaan Saleem", age: 25, company: "M3 Technologies Pakistan Pvt. Ltd.", email: "izaan.saleem@m3tech.com.pk", address: "Powerhouse, North Karachi, Karachi", about: "iOS Developer", registered: "2024-08-10T01:47:18-00:00", tags: ["aa", "bb", "cc", "dd", "ff"], friends: friends)
        return DetailView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}

//MARK: - Extensions
extension String {
    func toDate() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        
        if let date = isoDateFormatter.date(from: self) {
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "MMM dd, yyyy - hh:mm a"
            newDateFormatter.timeZone = TimeZone.current
            let newDateString = newDateFormatter.string(from: date)
            return newDateString
        } else {
            return "Invalid date format"
        }
    }
}
