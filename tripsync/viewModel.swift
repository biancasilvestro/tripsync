//
//  viewModel.swift
//  tripsync
//
//  Created by Bianca Silvestro  on 20/11/23.
//
import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var tripsinfos: [tripinfo] = []
    
    func addTrip(trip: tripinfo) {
        tripsinfos.append(trip)
    }
}
