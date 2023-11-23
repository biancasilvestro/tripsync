import SwiftUI

struct NewProjectView: View {
    @Environment(\.dismiss) var dismiss
    //If the value dismiss changes, SwiftUI updates any parts of your view that depend on the value.When the create button is pressed and so the dimiss of the modal is presented,  it triggers the dismiss in the environment and returns to the previous view
    
    @State  var newTripName = ""
    @State  var selectedCountryIndex = 0
    @State  var startDate = Date()
    @State  var endDate = Date() 
    @Binding var dismissed: Bool
    
    @ObservedObject var datas : ViewModel
    
    let countries = [
            "Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda",
            "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain",
            "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bhutan", "Bolivia",
            "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina Faso",
            "Burundi", "Côte d'Ivoire", "Cabo Verde", "Cambodia", "Cameroon", "Canada", "Central African Republic",
            "Chad", "Chile", "China", "Colombia", "Comoros", "Congo (Congo-Brazzaville)", "Costa Rica",
            "Croatia", "Cuba", "Cyprus", "Czechia (Czech Republic)", "Democratic Republic of the Congo",
            "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador",
            "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji",
            "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada",
            "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Holy See", "Honduras", "Hungary",
            "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan",
            "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon",
            "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Madagascar", "Malawi",
            "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico",
            "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar",
            "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria",
            "North Korea", "North Macedonia", "Norway", "Oman", "Pakistan", "Palau", "Palestine State",
            "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar",
            "Romania", "Russia", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", "Saint Vincent and the Grenadines",
            "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles",
            "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa",
            "South Korea", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland",
            "Syria", "Tajikistan", "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago",
            "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates",
            "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela",
            "Vietnam", "Yemen", "Zambia", "Zimbabwe"
        ]
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading) {
                    TextField("Name of the trip", text: $newTripName)
                        .font(.title)
                        .accessibilitySortPriority(8)
                    Spacer().frame(height: 90)
                    
                    Text("Insert the destination of your trip:")
                        .accessibilityHint("Enter the name of the trip")
                        .accessibilitySortPriority(7)
                    
                    
                    Picker(selection: $selectedCountryIndex, label: Text("Country")) {
                        ForEach(countries.indices, id: \.self) { index in
                            Text(countries[index])
                                .accessibility(label: Text("\(self.countries[index])"))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .padding(.horizontal,30)
                    .accessibilitySortPriority(6)
                   
                    
                    Spacer().frame(height: 90)
                    
                    HStack {
                        VStack(alignment: .center, spacing: 8) {
                            Text("Departure date:")
                                .bold()
                            DatePicker("",
                                       selection: $startDate,
                                       in: Date()...,
                                       displayedComponents: .date)
                            .datePickerStyle(DefaultDatePickerStyle())
                        }.accessibilitySortPriority(5)
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.gray)
                            .accessibility(hidden: true)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 8) {
                            Text("Return date: ")
                                .bold()
                            DatePicker("",
                                       selection: $endDate,
                                       in: startDate...,
                                       displayedComponents: .date)
                            .datePickerStyle(DefaultDatePickerStyle())
                        }.accessibilitySortPriority(4)
                        .padding(.horizontal)
                    }
                    
                    
                }.padding(.bottom,150)
                    .padding(.horizontal)
                    .navigationBarItems(
                        trailing: Button(action: {
                            let selectedCountry = countries[selectedCountryIndex]
                            
                            if newTripName.isEmpty {
                                let newTrip = Trip(
                                    nameTrip: "Trip #\(datas.tripsinfos.count + 1)",
                                    countryTrip: selectedCountry,
                                    datedep: startDate,
                                    datearr: endDate
                                )
                                datas.tripsinfos.append(newTrip)
                            } else {
                                let newTrip = Trip(
                                    nameTrip: newTripName,
                                    countryTrip: selectedCountry,
                                    datedep: startDate,
                                    datearr: endDate
                                )
                                datas.tripsinfos.append(newTrip)
                            }
                            
                            dismiss()
                            dismissed = true
                        }) {
                            Text("Create")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 15)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                        }.accessibilityLabel("Done")
                            .accessibilitySortPriority(3)
                        
                    )
                    .onTapGesture {
                        hideKeyboard()
                    }
            }
        }
    }
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


