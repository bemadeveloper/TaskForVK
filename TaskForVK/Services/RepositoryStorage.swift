//
//  RepositoryStorage.swift
//  TaskForVK
//
//  Created by Bema on 30/11/24.
//

import Foundation
import RealmSwift

class RepositoryStorage {
    let realm = try! Realm()
    
    func add(repository: Repository) {
        try! realm.write {
            realm.add(repository)
        }
    }
    
    func delete(repository: Repository) {
        try! realm.write {
            realm.delete(repository)
        }
    }
    
    func fetchRepositories() -> Results<Repository> {
        return realm.objects(Repository.self)
    }
}
