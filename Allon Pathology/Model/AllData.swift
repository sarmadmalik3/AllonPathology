//
//  AllData.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 27/06/2021.
//

import Foundation

struct AllData : Codable {
    let success : Bool?
    let data : [Data]!

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
    }
    
    
    struct Data : Codable {
        let id : Int?
        let name : String?
        let image : String?
        let created_at : String?
        let updated_at : String?
        let diseasealbums : [Diseasealbums]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case image = "image"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case diseasealbums = "diseasealbums"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            image = try values.decodeIfPresent(String.self, forKey: .image)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            diseasealbums = try values.decodeIfPresent([Diseasealbums].self, forKey: .diseasealbums)
        }

    }
    
    struct Diseasealbums : Codable {
        let id : Int?
        let name : String?
        let diagnosis_album_id : Int?
        let created_at : String?
        let updated_at : String?
        let disease_list : [Disease_list]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case diagnosis_album_id = "diagnosis_album_id"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case disease_list = "disease_list"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            diagnosis_album_id = try values.decodeIfPresent(Int.self, forKey: .diagnosis_album_id)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            disease_list = try values.decodeIfPresent([Disease_list].self, forKey: .disease_list)
        }

    }
    struct Disease_list : Codable {
        let id : Int?
        let name : String?
        let disease_album_id : Int?
        let diagnosis_album_id : Int?
        let created_at : String?
        let updated_at : String?
        let disease_detail : [Disease_detail]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case disease_album_id = "disease_album_id"
            case diagnosis_album_id = "diagnosis_album_id"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case disease_detail = "disease_detail"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            disease_album_id = try values.decodeIfPresent(Int.self, forKey: .disease_album_id)
            diagnosis_album_id = try values.decodeIfPresent(Int.self, forKey: .diagnosis_album_id)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            disease_detail = try values.decodeIfPresent([Disease_detail].self, forKey: .disease_detail)
        }

    }
    
    struct Disease_detail : Codable {
        let id : Int?
        let description : String?
        let image : String?
        let created_at : String?
        let updated_at : String?
        let disease_list_id : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case description = "description"
            case image = "image"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case disease_list_id = "disease_list_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            image = try values.decodeIfPresent(String.self, forKey: .image)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            disease_list_id = try values.decodeIfPresent(Int.self, forKey: .disease_list_id)
        }

    }
}
