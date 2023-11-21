import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    @State var myDismiss = false
    @State var selected = 0
    
    @State private var tripname: [String] = []
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView(.vertical){
                Spacer()
                VStack{
                    ForEach(tripname.indices, id: \.self) { index in
                        NavigationLink(destination: MainView(dismissed: $myDismiss, index: selected)) {
                            HStack {
                                Text(tripname[index])
                                    .foregroundColor(.black)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.title)
                            }.onTapGesture {
                                selected = index
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
                    NewProjectView(tripname: $tripname, dismissed: $myDismiss)
                }
                
                .navigationDestination(isPresented: $myDismiss){
                    MainView(dismissed: $myDismiss, index: selected)
                }
                
                
                
            }
            
        }
    }
}
        
    
#Preview {
    ContentView()
}
