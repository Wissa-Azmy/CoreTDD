//
//  LibraryDataService.swift
//  CoreTDD
//
//  Created by Wissa Azmy on 11/23/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import Foundation
import UIKit

enum LibrarySection: Int {
    case moviesToSee, moviesSeen
}

class MoviesLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let librarySection = LibrarySection(rawValue: section) else {
            fatalError()
        }
        guard movieManager != nil else { return 0 }
        
        switch librarySection {
        case .moviesToSee:
            return movieManager!.moviesToSeeCount
        case .moviesSeen:
            return movieManager!.moviesSeenCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
