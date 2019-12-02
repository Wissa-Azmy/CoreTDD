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
        
        class func initMockTable(dataSource: MoviesLibraryDataService) -> TableViewMock {
            let mockTable = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mockTable.dataSource = dataSource
            mockTable.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellID")
            
            return mockTable
        }
        
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
