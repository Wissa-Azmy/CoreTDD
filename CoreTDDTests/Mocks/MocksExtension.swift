//
//  MocksExtension.swift
//  CoreTDDTests
//
//  Created by Wissa Azmy on 11/27/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import Foundation
import UIKit

@testable import CoreTDD

extension MoviesLibraryDataServiceTest {
    class TableViewMock: UITableView {
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell {
        var movieData: Movie?
        
        override func configCell(movie: Movie) {
            movieData = movie
        }
    }
}
