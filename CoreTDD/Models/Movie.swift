//
//  Movie.swift
//  CoreTDD
//
//  Created by Wissa Azmy on 11/22/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

func==(lhs: Movie, rhs: Movie) -> Bool {
    var isEqual = lhs.title == rhs.title ? true : false
    isEqual = (isEqual && lhs.releaseDate == rhs.releaseDate) ? true : false
    
    return isEqual
}
