import SwiftUI
struct HomeScreenLoggedIn: View {
    @Binding var isDarkMode: Bool
    @State private var selectedTab = "SmartBin"
    let navyBlue: Color = Color(red: 45/255, green: 45/255, blue: 108/255)
    let whiteBlue: Color = Color(red: 245/255, green: 247/255, blue: 255/255)
    let teal: Color = Color(red: 0/255, green: 151/255, blue: 178/255)
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        selectedTab = "SmartBin"
                    }) {
                        Text("SmartBin")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .background(selectedTab == "SmartBin" ? (isDarkMode ? Color.white.opacity(0.2) : Color.gray.opacity(0.2)) : Color.clear)
                            .cornerRadius(10)
                    }
                    Spacer()
                    NavigationLink(destination: HistoryView(isDarkMode: $isDarkMode, selectedTab: $selectedTab)) {
                        Text("History")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .background(selectedTab == "History" ? (isDarkMode ? Color.white.opacity(0.2) : Color.gray.opacity(0.2)) : Color.clear)
                            .cornerRadius(10)
                    }
                }
                .padding()
                if selectedTab == "SmartBin" {
                    ScrollView {
                        VStack {
                            HStack{
                                Image("SmartBinAILogo1").resizable()
                                    .aspectRatio(contentMode: .fit).frame(width: 24, height: 24, alignment: .topLeading).cornerRadius(10)
                                
                                Text("Welcome to SmartBin!")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding()                .listRowInsets(EdgeInsets(top: 10, leading: -15, bottom: 5, trailing: 0))
                                    .lineLimit(1)
                                    .truncationMode(.tail) // Options: .head, .middle, .tail
                            }
                            
                            Text("Recycling made easy. Know your climate impact.")
                                .font(.title2)
                                .padding().frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("AI-Powered Waste Classification").font(.system(size:15)).padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Capture an image to classify waste and learn about proper recycling methods.")
                                .font(.system(size:15))
                                .padding().frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                    }
                } else {
                    HistoryView(isDarkMode: $isDarkMode, selectedTab: $selectedTab)
                }
                Spacer()
                CustomNavigationBar(isDarkMode: $isDarkMode)
            }
            .background(isDarkMode ? navyBlue : whiteBlue)
            .foregroundColor(isDarkMode ? .white : .black)
        }
        .navigationBarHidden(true)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
struct HistoryView: View {
    @Binding var isDarkMode: Bool
    @Binding var selectedTab: String
    
    let navyBlue: Color = Color(red: 45/255, green: 45/255, blue: 108/255)
    let whiteBlue: Color = Color(red: 245/255, green: 247/255, blue: 255/255)
    let teal: Color = Color(red: 0/255, green: 151/255, blue: 178/255)
    
    
    var body: some View {
        VStack {
            Text("History View")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Your recycling history and statistics will be displayed here.")
                .font(.title2)
                .padding()
            
            Spacer()
        }
        .onAppear {
            selectedTab = "History"
        }
        CustomNavigationBar(isDarkMode: $isDarkMode)
        
            .background(isDarkMode ? .black : whiteBlue)
            .foregroundColor(isDarkMode ? .white : .black)
        //    }.navigationBarHidden(true)
        //    .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}


