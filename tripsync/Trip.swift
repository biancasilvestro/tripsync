//
//  Trip.swift
//  tripsync
//
//  Created by Bianca Silvestro  on 20/11/23.
//

import Foundation

import SwiftUI

struct Trip: Identifiable {
    var id: UUID = UUID()
    var nameTrip: String = ""
    var countryTrip: String = ""
    var datedep: Date = Date()
    var datearr: Date = Date()
}
