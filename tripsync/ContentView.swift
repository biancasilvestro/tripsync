import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    @State var myDismiss = false
    @State var selected = 0
    @State private var datas = ViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical){
                Spacer()
                VStack{
                    ForEach(datas.tripsinfos) { trip in
                        NavigationLink(destination: MainView(trip: trip)) {
                            HStack {
                                Text(trip.nameTrip)
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.title)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white)
                            )
                        }}
                    
                }
                .navigationBarItems(
                    trailing: Button("New Project") {
                        print(myDismiss)
                        isPresented.toggle()
                    })
                .fullScreenCover(isPresented: $isPresented) {
                    
                    NewProjectView(dismissed: $myDismiss)
                }
                
                .navigationDestination(isPresented: $myDismiss){
                    MainView(trip: datas.tripsinfos.last ?? tripinfo())
                }
                
                
                
            }
            
        }
    }
}
        
    

