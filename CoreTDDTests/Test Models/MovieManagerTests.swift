//
//  MovieManagerTests.swift
//  CoreTDDTests
//
//  Created by Wissa Azmy on 11/22/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import XCTest

@testable import CoreTDD
class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    let movie1 = Movie(title: "Wissa")
    let movie2 = Movie(title: "Michael")
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Initial Values
    func testInit_MoviesToSee_ReturnZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: - Add & Query
    func testAdd_MovieToSee_ReturnsOne() {
        let testMovie = Movie(title: "Sci-Fi")
        sut.add(movie: testMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        let testMovie = Movie(title: "Arthouse Drama")
        sut.add(movie: testMovie)
        let movieQueried = sut.movie(atIndex: 0)
        
        XCTAssertEqual(movieQueried.title, testMovie.title)
    }
    
    // MARK: - Checking Off Movies
    func testCheckOffMovie_UpdateMovieManagerCounts() {
        sut.add(movie: Movie(title: "Avengers: End Game"))
        sut.checkOffMovie(atIndex: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemoveMovieFromArray() {
        sut.add(movie: Movie(title: "Iron Man 1"))
        sut.add(movie: Movie(title: "Iron Man 2"))
        sut.checkOffMovie(atIndex: 0)
        
        XCTAssertEqual(sut.movie(atIndex: 0).title, "Iron Man 2")
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.add(movie: Movie(title: "Black Panther"))
        sut.checkOffMovie(atIndex: 0)
        
        let queriedMovie = sut.checkedOffMovie(atIndex: 0)
        XCTAssertEqual(queriedMovie.title, "Black Panther")
    }
    
    // MARK: - Clear & Reset
    func testClearArray_ReturnsArrayCountOfZero() {
        sut.add(movie: movie1)
        sut.add(movie: movie2)
        
        sut.checkOffMovie(atIndex: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearMovies()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        sut.add(movie: movie1)
        sut.add(movie: movie1)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }

}
