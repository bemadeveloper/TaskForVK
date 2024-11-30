//
//  RepositoryListViewModel.swift
//  TaskForVK
//
//  Created by Bema on 30/11/24.
//

import Foundation
import Combine

class RepositoryListViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    
    private var currentPage = 1
    private var repositoryService = RepositoryService()
    
    func loadMoreData() {
        guard !isLoading else { return }
        
        isLoading = true
        repositoryService.fetchRepositories(page: currentPage) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let newRepositories):
                    self.repositories.append(contentsOf: newRepositories)
                    self.currentPage += 1
                case .failure:
                    // Handle error here
                    break
                }
            }
        }
    }
}
