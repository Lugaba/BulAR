//
//  TableSearchWorkerImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import FirebaseStorage
import UIKit

class TableSearchWorkerImpl: TableSearchWorker {
    func fetchMedicineList(completion: @escaping ([Bula]?, Error?) -> Void) {
        let urlString = "https://tcc-bula.herokuapp.com/bulas"
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data returned from API", code: 0, userInfo: nil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let bulas = try decoder.decode([Bula].self, from: data)
                completion(bulas, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func fetchMedicineImage(imageURL: String, completion: @escaping (UIImage?, Error?) -> Void) {
        let reference = Storage.storage().reference(withPath: imageURL)
        DispatchQueue.global(qos: .utility).async {
            reference.getData(maxSize: (1 * 1024 * 1024)) { data, error in
                if let err = error {
                    print(err)
                    completion(nil, err)
                } else {
                    if let image = data {
                        let myImage: UIImage! = UIImage(data: image)
                        completion(myImage, nil)
                    }
                }
            }
        }
    }
        
        
    }
