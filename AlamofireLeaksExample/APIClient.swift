//
//  APIClient.swift
//  AlamofireLeaksExample
//
//  Created by ivan.gnatyuk on 15.12.2020.
//

import Foundation
import Alamofire

class APIClient {
    
    func testAF(url: String, params: [String: Any]?, completion: @escaping (Result<[TestItemDto], NSError>)->()) {

        AF.request(url,
                   method: .get,
                   parameters: params,
                   headers: nil)
            .responseData { dataResponse in
                
                switch dataResponse.result {
                
                case .success(let data):
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        
                        let dto = try decoder.decode([TestItemDto].self, from: data)
                        completion(.success(dto))
                    } catch {
                        print("Decoding error: \(error)")
                        completion(.failure(error as NSError))
                    }
                    
                case .failure(let error):
                    completion(.failure(error as NSError))
                }
            }
    }
    
}


// MARK: - Dto

struct TestItemDto: Decodable {
    let userId: Int
    let id: Int
    let title: String
}
