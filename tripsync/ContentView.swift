import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    @State var myDismiss = false
    @State var selected = 0
    @ObservedObject private var datas = ViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical){
                Spacer()
                VStack(alignment: .leading){
                    ForEach(datas.tripsinfos) { trip in
                        NavigationLink(destination: MainView(trip: trip)) {
                            ZStack(alignment: .topLeading){
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .padding(.trailing, 2.0)
                                    .opacity(0.1)
                                
                                    .frame(maxWidth: .infinity, maxHeight: 100)
                                HStack {
                                    Text(trip.nameTrip)
                                        
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .padding()
                                    Image(systemName: "chevron.right")
                                        .font(.title2)
                                }
                            }
                        }
                        .padding(.horizontal, 8)
                                              .padding(.vertical, 5)
                                              .frame(maxWidth: .infinity, alignment: .leading)
                                              .background(
                                                  RoundedRectangle(cornerRadius: 15)
                                                      .fill(Color.white)
                            )
                        }
                    }
                    
                    
                .padding()
                .navigationTitle("Your trips")
                                .navigationBarItems(
                                    trailing: Button(action: {
                                        isPresented.toggle()
                                        //print(myDismiss)
                                    }) {
                                        ZStack {
                                            Circle()
                                                .foregroundColor(.blue)
                                                .frame(width: 40, height: 40)
                                            
                                            Image(systemName: "plus")
                                                .foregroundColor(.white)
                                                .padding()
                                                .font(.system(size: 15, weight: .bold)) 
                                        }

                                    }.accessibilityLabel("Create a new trip") 
                                    
                                )
                
                
                .fullScreenCover(isPresented: $isPresented) {
                    NewProjectView(dismissed: $myDismiss, datas: datas)
                }
                
                .navigationDestination(isPresented: $myDismiss){
                    MainView(trip: datas.tripsinfos.last ?? Trip() )
                    // MainView(trip: datas.tripsinfos.last ?? Trip()) in this way if it's nil you still have the default value trip, but in my case there is no way that i have a nil value. 
                }
                
            }
                
            }
            
        }
    }

        
    

