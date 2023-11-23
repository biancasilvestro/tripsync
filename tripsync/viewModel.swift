//
//  viewModel.swift
//  tripsync
//
//  Created by Bianca Silvestro  on 20/11/23.
//
import Foundation

class ViewModel: ObservableObject {
    @Published var tripsinfos: [Trip] = [Trip(nameTrip: "Disneyland🎢", countryTrip: "France"), 
                                         Trip(nameTrip: "Forza Napoli🩵", countryTrip: "Naboli")]
}
