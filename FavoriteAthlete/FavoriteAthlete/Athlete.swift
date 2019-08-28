//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by doris on 27/08/2019.
//

import UIKit

struct Athlete {
    var name: String
    var age: String
    var team: String
    var league: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}



