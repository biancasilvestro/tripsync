import SwiftUI

struct NewProjectView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tripname: [String]
    @State private var newTripName = ""
    @State private var selectedCountryIndex = 0
    @State private var startDate = Date()
    @State private var endDate = Date()
    @Binding var dismissed: Bool
    
 
    
    let countries = ["Country 1", "Country 2", "Country 3"]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Barcelona here we come, etc...", text: $newTripName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    
                
                Picker(selection: $selectedCountryIndex, label: Text("Paese")) {
                    ForEach(countries.indices, id: \.self) { index in
                        Text(countries[index])
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                
                DatePicker("Departure", selection: $startDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(DefaultDatePickerStyle())
                    .padding()
                
                DatePicker("Return", selection: $endDate, in: startDate..., displayedComponents: .date)
                    .datePickerStyle(DefaultDatePickerStyle())
                    .padding()
                
                Spacer()
            }
            .navigationBarTitle("New Project", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: {
                    if newTripName == "" {
                        tripname.append("trip \(tripname.count)")
                    }else{
                        tripname.append(newTripName)}
                    dismiss()
                    dismissed=true
                    //print(dismissed)
                }) {
                    Text("Create")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                }
                .padding()
            )
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    NewProjectView(tripname: .constant([ ]), dismissed: .constant(false))
}
