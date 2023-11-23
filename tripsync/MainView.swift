//
//  MainView.swift
//  tripsync
//
//  Created by Bianca Silvestro  on 16/11/23.
//

import SwiftUI

struct MainView: View {
    
    var trip: Trip
    
    var body: some View {
        
        
        VStack(alignment: .center, spacing: 8)  {
            Text((trip.nameTrip))
                .font(.title)
                .accessibilitySortPriority(9)
            Spacer().frame(height: 30)
            
            Text("Get ready to go to: \(trip.countryTrip)")
                .accessibilitySortPriority(8)
            
            Spacer().frame(height: 30)
            
            HStack {
                VStack(alignment: .center) {
                    Text("From")
                        .accessibilitySortPriority(7)
                    Text("\(formatDate(trip.datedep))")
                        .bold()
                        .padding(.horizontal)
                        .accessibilitySortPriority(6)
                }
                    
                    
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.gray)
                        .accessibility(hidden: true)
                    
                    
                    VStack(alignment: .center) {
                        Text("To")
                            .accessibilitySortPriority(5)
                        Text("\(formatDate(trip.datearr))")
                            .bold()
                            .accessibilitySortPriority(4)
                        
                    }
                    .padding(.horizontal)
                }
                
                
            }.padding(.bottom,200)
                .padding(.horizontal)
            
            
    }
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: date)
    
}
    }

        


