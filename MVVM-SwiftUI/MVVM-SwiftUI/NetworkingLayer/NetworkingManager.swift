//
//  NetworkingManager.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//

import Foundation

class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    func fetchLandmarks(completed: @escaping (Result<[Landmark], NetworkingError>) -> Void) {
        
        loadJSONFromMainBundle("landmarkData.json", completed: completed)
        
        /*
        // NOTE: You must host the .json file on your own server to recieve a successful response
        fetchData(fromUrl: "→ myRemoteURl/landmarkData.json") { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let landmarks: [Landmark] = try decoder.decode([Landmark].self, from: data)
                    completed(.success(landmarks))
                } catch {
                    completed(.failure(.unableToParseData))
                }
            case .failure(let error):
                completed(.failure(error))
            }
        }
        */
    }
    
    private func loadJSONFromMainBundle<T: Decodable>(_ filename: String, completed: (Result<T, NetworkingError>) -> Void) {
        
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            completed(.failure(.resourceNotFound))
            return
        }
                    
        do {
            data = try Data(contentsOf: file)
        } catch {
            completed(.failure(.unableToLoadResource))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let decodedValues = try decoder.decode(T.self, from: data)
            completed(.success(decodedValues))
        } catch {
            completed(.failure(.unableToParseData))
        }
    }
    
    private func fetchData(fromUrl urlString: String, completed: @escaping (Result<Data, NetworkingError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completed(.failure(.unableToCreateURL))
            return
        }
               
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.urlSessionError))
                return
            }
                        
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.httpFailureResponseCode))
                return
            }
            
            guard let data = data else {
                completed(.failure(.noDataRecieved))
                return
            }
            
            completed(.success(data))
        }
        
        task.resume()
    }
    
}
