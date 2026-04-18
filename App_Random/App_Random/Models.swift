import Foundation

struct RandomUserResponse: Codable {
    let results: [User]
}

struct User: Codable, Identifiable {
    var id: String { login.uuid }
    let name: Name
    let location: Location
    let dob: Dob
    let gender: String
    let phone: String
    let picture: Picture
    let login: Login

    struct Name: Codable { let first, last: String }
    struct Location: Codable {
        let city, state, country: String
        let nat: String?
    }
    struct Dob: Codable { let age: Int }
    struct Picture: Codable { let large: String }
    struct Login: Codable { let uuid: String }
}
