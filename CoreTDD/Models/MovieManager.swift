//
//  MovieManager.swift
//  CoreTDD
//
//  Created by Wissa Azmy on 11/22/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import Foundation

class MovieManager {
    var moviesToSeeCount = 0
    var moviesSeenCount = 0
    var movies = [Movie]()
    
    func add(movie: Movie) {
        moviesToSeeCount += 1
        movies.append(movie)
    }
    
    func movie(atIndex index: Int) -> Movie {
        return movies[index]
    }
}
