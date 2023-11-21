//
//  MainView.swift
//  tripsync
//
//  Created by Bianca Silvestro  on 16/11/23.
//

import SwiftUI

struct MainView: View {
  @Binding var dismissed: Bool
  var index: Int
  @State private var tripname: [String] = []

  @EnvironmentObject var viewModel: ViewModel

  var body: some View {
    if index < viewModel.tripsinfos.count {
      let trip = viewModel.tripsinfos[index]
      VStack {
        Text(trip.nameTrip)
        Text(trip.countryTrip)
        Text("\(trip.datedep)")
        Text("\(trip.datearr)")
      }
    } else {
      Text("Invalid index")
    }
  }
}

#Preview {
  MainView(dismissed: Binding.constant(false), index: 0)
    .environmentObject(ViewModel())
}

