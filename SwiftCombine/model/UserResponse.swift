//
//  UserResponse.swift
//  SwiftCombine
//
//  Created by Anthony Ebuka Nwudo on 09/10/2022.
//
import Foundation

// MARK: - UserResponse
struct UserResponse: Codable,Hashable {
    let results: [ResultResponse]
    //let info: Info
}

// MARK: - Info
//struct Info: Codable,Hashable  {
//    let seed: String
//    let results,page: Int?
//    let version: String
//}

// MARK: - Result
struct ResultResponse: Codable,Hashable  {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

// MARK: - Dob
struct Dob: Codable,Hashable {
    let date: String
    let age: Int
}

// MARK: - ID
struct ID: Codable,Hashable {
    let name, value: String
}

// MARK: - Location
struct Location: Codable,Hashable {
    let street: Street
    let city, state, country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
}

// MARK: - Coordinates
struct Coordinates: Codable,Hashable {
    let latitude, longitude: String
}

// MARK: - Street
struct Street: Codable,Hashable {
    let number: Int
    let name: String
}

// MARK: - Timezone
struct Timezone: Codable,Hashable {
    let offset, timezoneDescription: String

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

// MARK: - Login
struct Login: Codable,Hashable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}

// MARK: - Name
struct Name: Codable,Hashable {
    let title, first, last: String
}

// MARK: - Picture
struct Picture: Codable,Hashable {
    let large, medium, thumbnail: String
}
