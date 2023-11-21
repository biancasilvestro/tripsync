//
//  modelinfo.swift
//  tripsync
//
//  Created by Bianca Silvestro  on 20/11/23.
//

import Foundation

import SwiftUI

struct tripinfo: Identifiable {
    var id = UUID()
    var nameTrip: String
    var countryTrip: String
    var datedep: Date
    var datearr: Date
    
}
