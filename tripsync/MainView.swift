//
//  MainView.swift
//  tripsync
//
//  Created by Bianca Silvestro  on 16/11/23.
//

import SwiftUI

struct MainView: View {
    
    var trip: tripinfo

  var body: some View {
      VStack{
          Text(trip.nameTrip)
          Text(trip.countryTrip)
      }
     
  }
}
