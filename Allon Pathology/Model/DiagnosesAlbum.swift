

import Foundation
struct DiagnosesAlbum : Codable {
	let success : Bool?
	let data : [Data]?

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
        let description : String?
        let parent_id : String?
        let created_at : String?
        let updated_at : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case image = "image"
            case description = "description"
            case parent_id = "parent_id"
            case created_at = "created_at"
            case updated_at = "updated_at"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            image = try values.decodeIfPresent(String.self, forKey: .image)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            parent_id = try values.decodeIfPresent(String.self, forKey: .parent_id)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        }

    }
    
}
