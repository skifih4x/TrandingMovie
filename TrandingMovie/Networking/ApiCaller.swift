//
//  ApiCaller.swift
//  TrandingMovie
//
//  Created by Артем Орлов on 21.03.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class ApiCaller {
    
    static func getTrandingMovie(completion: @escaping(_ result: Result<TrendingMovieModel, NetworkError>) -> Void) {
        let  urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil,
               let data = data,
               let result = try? JSONDecoder().decode(TrendingMovieModel.self, from: data) {
                completion(.success(result))
            } else {
                completion(.failure(.canNotParseData))
            }
        }.resume()
    }
}
