//
//  ContentView.swift
//  FetchUserList-Codable-SwiftData
//
//  Created by Izaan Saleem on 10/09/2024.
//

import Foundation

//MARK: - UsersModel
struct UsersModel : Codable {
    let id : String?
    let isActive : Bool?
    let name : String?
    let age : Int?
    let company : String?
    let email : String?
    let address : String?
    let about : String?
    let registered : String?
    let tags : [String]?
    let friends : [Friends]?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case isActive = "isActive"
        case name = "name"
        case age = "age"
        case company = "company"
        case email = "email"
        case address = "address"
        case about = "about"
        case registered = "registered"
        case tags = "tags"
        case friends = "friends"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
        company = try values.decodeIfPresent(String.self, forKey: .company)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        about = try values.decodeIfPresent(String.self, forKey: .about)
        registered = try values.decodeIfPresent(String.self, forKey: .registered)
        tags = try values.decodeIfPresent([String].self, forKey: .tags)
        friends = try values.decodeIfPresent([Friends].self, forKey: .friends)
    }
    
    init(id: String?, isActive: Bool?, name: String?, age: Int?, company: String?, email: String?, address: String?, about: String?, registered: String?, tags: [String]?, friends: [Friends]?) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
}

//MARK: - Friends
struct Friends : Codable {
    let id : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }

}
