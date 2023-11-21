import SwiftUI

struct NewProjectView: View {
    @Environment(\.dismiss) var dismiss
    //@Binding var tripname: [String]
    @State  var newTripName = ""
    @State  var selectedCountryIndex = 0
    @State  var startDate = Date()
    @State  var endDate = Date() 
    @Binding var dismissed: Bool
    
     @State var datas = ViewModel()
    
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
                        print("vuoto")
                        let newTrip = tripinfo(nameTrip: String(datas.tripsinfos.count))
                        datas.tripsinfos.append(newTrip)
                    }else{
                        print("qui")
                        let newTrip = tripinfo(nameTrip: newTripName, countryTrip: countries[selectedCountryIndex], datedep: startDate, datearr: endDate)
                        datas.tripsinfos.append(newTrip)}
                    dismiss()
                    dismissed=true
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
