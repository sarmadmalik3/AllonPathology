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
    
    func getDiagnosesAlbumList(completion : @escaping (_ DiagnosesAlbum : DiagnosesAlbum?) -> ()){
        
        Alamofire.request(url.getDiagnosesAlbum, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (dataResponse) in
            switch dataResponse.result {
            case .success:
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(DiagnosesAlbum.self, from: dataResponse.data!)
                    completion(responseModel)
                }catch {
                    
                }
            case .failure:
                break
            }
        }
    }
    
    func getDiseaseList(albumId : Int  ,completion : @escaping (_ DiseaseList : DiseaseList?) -> ()){
        
        Alamofire.request(String(format: url.getDiseaseList, albumId), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (dataResponse) in
            
            print(String(data: dataResponse.data!, encoding: String.Encoding.utf8)!)
            
            switch dataResponse.result {
            case .success:
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(DiseaseList.self, from: dataResponse.data!)
                    completion(responseModel)
                }catch {
                    
                }
            case .failure:
                break
            }
            print(dataResponse.result)
        }
    }
    
    func getDiseaseDetail(diseaseId : Int  ,completion : @escaping (_ DiseaseDetail : DiseaseDetail?) -> ()){
        
        Alamofire.request(String(format: url.getDiseaseDetail, diseaseId), method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (dataResponse) in
            
            print(String(data: dataResponse.data!, encoding: String.Encoding.utf8)!)
            switch dataResponse.result {
            case .success:
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(DiseaseDetail.self, from: dataResponse.data!)
                    completion(responseModel)
                }catch {
                    
                }
            case .failure:
                break
            }
        }
    }
    
}
