//
//  ViewController.swift
//  AlamofireLeaksExample
//
//  Created by ivan.gnatyuk on 15.12.2020.
//

import UIKit

class ViewController: UIViewController {
    let apiClient = APIClient()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        executeRequest()
    }
    
}


private extension ViewController {
    
    func executeRequest() {
        let url = "http://jsonplaceholder.typicode.com" + "/posts"
        let params = ["foo": "bar"]
        
        apiClient.testAF(url: url, params: params) { result in
            switch result {
            case .success(let dtos):
                print(dtos)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
