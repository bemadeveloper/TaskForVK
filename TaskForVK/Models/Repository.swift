//
//  Repository.swift
//  TaskForVK
//
//  Created by Bema on 30/11/24.
//

import Foundation

struct Repository: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String?
    var owner: Owner
}
