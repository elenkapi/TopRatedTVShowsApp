//
//  NetworkService.swift
//  Elene_Kapanadze_22
//
//  Created by Ellen_Kapii on 13.08.22.
//

import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    
    let session = URLSession.shared
    
    func getData<T: Decodable>(urlString: String, completion: @escaping (T) -> (Void)) {
        
        var urlComponent = URLComponents(string: urlString)
        urlComponent?.queryItems = [
            URLQueryItem.init(name: "api_key", value: "faaad98c5d2f17fcf553bf4e1141ee8c")
        ]
        
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        session.dataTask(with: (urlComponent?.url!)!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let response = response as? HTTPURLResponse else {
                return
            }
            guard (200...299).contains(response.statusCode) else {
                print("wrong response")
                return
            }
            guard let data = data  else {
                return
            }
            do {
                let object = try JSONDecoder().decode(T.self, from: data)

                completion(object)
                
            } catch {
                print("Decoding Error")
            }
        }.resume()
    }
}
