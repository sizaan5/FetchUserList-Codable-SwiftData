//
//  DetailView.swift
//  FetchUserList-Codable-SwiftData
//
//  Created by Izaan Saleem on 10/09/2024.
//

import SwiftUI

struct DetailView: View {
    
    //MARK: - Properties
    var user: UsersModel
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
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
                    
                    VStack(alignment: .center) {
                        Text("Friends")
                            .font(.title2)
                            .fontWeight(.semibold)
                        List(self.user.friends ?? [], id: \.id) { friend in
                            VStack {
                                Text(friend.name ?? "")
                            }
                            .listRowBackground(Color.clear)
                        }
                        .listStyle(.plain)
                    }
                    .frame(height: 350)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.title2)
            }
            .navigationTitle(user.isActive ?? false ? "Online" : "Offline")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    let friends = [(Friends(id: "100", name: "Friend1")), (Friends(id: "200", name: "Friend2")), (Friends(id: "300", name: "Friend3")), (Friends(id: "400", name: "Friend4"))]
    let user = UsersModel(id: "1", isActive: true, name: "Izaan Saleem", age: 25, company: "M3 Technologies Pakistan Pvt. Ltd.", email: "izaan.saleem@m3tech.com.pk", address: "Powerhouse, North Karachi, Karachi", about: "iOS Developer", registered: "2024-08-10T01:47:18-00:00", tags: ["aa", "bb", "cc", "dd", "ff"], friends: friends)
    return DetailView(user: user)
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
