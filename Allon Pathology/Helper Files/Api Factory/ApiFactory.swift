//
//  ApiFactory.swift
//  Allon Pathology
//
//  Created by Sarmad Ishfaq on 22/05/2021.
//

import Foundation
import Alamofire

class ApiFactory {
    
    static let sharedInstance = ApiFactory()
    func getAllData(completion: @escaping(_ list: AllData?) -> Void){
        
        Alamofire.request(url.getAllData, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { dataResponse in
            print(String(data: dataResponse.data!, encoding: String.Encoding.utf8)!)
            
            switch dataResponse.result {
            case .success:
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(AllData.self, from: dataResponse.data!)
                    completion(responseModel)
                }catch {
                    print("error in parsing")

                }
            case .failure:
                break
            }
        }
    }
    
    func getAllQuestions(completion: @escaping(_ list: QuizModel?) -> Void){
        
        Alamofire.request(url.getAllQuestions, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { dataResponse in
            print(String(data: dataResponse.data!, encoding: String.Encoding.utf8)!)
            
            switch dataResponse.result {
            case .success:
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(QuizModel.self, from: dataResponse.data!)
                    completion(responseModel)
                }catch {
                    print("error in parsing")
                }
            case .failure:
                break
            }
        }
    }
}
