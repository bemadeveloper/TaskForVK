//
//  RepositoryService.swift
//  TaskForVK
//
//  Created by Bema on 30/11/24.
//

import Foundation

class RepositoryService {
    let baseURL = "https://api.github.com/search/repositories?q=swift&sort=stars&order=asc&page="
    
    func fetchRepositories(page: Int, completion: @escaping (Result<[Repository], Error>) -> Void) {
        let url = URL(string: "\(baseURL)\(page)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid data", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(RepositoryResponse.self, from: data)
                completion(.success(response.items))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

struct RepositoryResponse: Codable {
    var items: [Repository]
}
