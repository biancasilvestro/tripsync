//
//  viewModel.swift
//  tripsync
//
//  Created by Bianca Silvestro  on 20/11/23.
//
import Foundation

class ViewModel: ObservableObject {
    @Published var tripsinfos: [tripinfo] = [tripinfo(nameTrip: "Barcellona", countryTrip: "Ciao"), tripinfo(nameTrip: "Naboli", countryTrip: "hola")]
}
