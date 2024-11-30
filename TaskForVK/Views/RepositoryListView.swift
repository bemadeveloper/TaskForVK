//
//  RepositoryListView.swift
//  TaskForVK
//
//  Created by Bema on 30/11/24.
//

import Foundation
import SwiftUI

struct RepositoryListView: View {
    @StateObject var viewModel = RepositoryListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.repositories) { repository in
                RepositoryCell(repository: repository)
            }
            
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear {
            viewModel.loadMoreData()
        }
        .onChange(of: viewModel.repositories.count) { _ in
            viewModel.loadMoreData()
        }
    }
}

struct RepositoryCell: View {
    var repository: Repository
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(repository.name)
                .font(.headline)
            if let description = repository.description {
                Text(description)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}
