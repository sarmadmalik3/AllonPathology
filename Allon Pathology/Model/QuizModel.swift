//
//  QuizModel.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 27/06/2021.
//

import Foundation


struct QuizModel: Codable {
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
        let created_at : String?
        let updated_at : String?
        let questions : [Questions]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case created_at = "created_at"
            case updated_at = "updated_at"
            case questions = "questions"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
            updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
            questions = try values.decodeIfPresent([Questions].self, forKey: .questions)
        }

    }
    
    
}

struct Questions : Codable {
    let id : Int?
    let body : String?
    let category_id : Int?
    let created_at : String?
    let updated_at : String?
    let answers : [Answers]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case body = "body"
        case category_id = "category_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
        case answers = "answers"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        body = try values.decodeIfPresent(String.self, forKey: .body)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
        answers = try values.decodeIfPresent([Answers].self, forKey: .answers)
    }

}
struct Answers : Codable {
    let id : Int?
    let body : String?
    let is_correct : Int?
    let question_id : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case body = "body"
        case is_correct = "is_correct"
        case question_id = "question_id"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        body = try values.decodeIfPresent(String.self, forKey: .body)
        is_correct = try values.decodeIfPresent(Int.self, forKey: .is_correct)
        question_id = try values.decodeIfPresent(Int.self, forKey: .question_id)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

