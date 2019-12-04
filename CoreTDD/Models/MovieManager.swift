//
//  MovieManager.swift
//  CoreTDD
//
//  Created by Wissa Azmy on 11/22/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int {
        return moviesToSee.count
    }
    var moviesSeenCount: Int {
        return moviesSeen.count
    }
    var moviesToSee = [Movie]()
    var moviesSeen = [Movie]()
    
    func add(movie: Movie) {
        if !moviesToSee.contains(movie) {
            moviesToSee.append(movie)
        }
    }
    
    func movie(atIndex index: Int) -> Movie {
        return moviesToSee[index]
    }
    
    func checkOffMovie(atIndex index: Int) {
        guard index < moviesToSee.count else { return }
        
        moviesSeen.append(moviesToSee.remove(at: index))
    }
    
    func checkedOffMovie(atIndex index: Int) -> Movie {
        return moviesSeen[index]
    }
    
    func uncheckMovie(atIndex index: Int) {
        guard index < moviesSeenCount else { return }
        
        moviesToSee.append(moviesSeen.remove(at: index))
    }
    
    func clearMovies() {
        moviesToSee.removeAll()
        moviesSeen.removeAll()
    }
}
