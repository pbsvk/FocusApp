import SwiftUI
import Combine

struct LauncherItem: Identifiable {
    let id = UUID() // Unique identifier for each item
    let name: String
    let icon: String
    let action: () -> Void
}

struct ContentView: View {
    @State private var currentTime = Date()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let columns = [GridItem(.adaptive(minimum: 100, maximum: 200))]
    
    
    
    let launcherItems = [
        LauncherItem(name: "Mail", icon: "envelope.circle") {
            UIApplication.shared.open(URL(string: "mailto:")!) // Opens Mail app
        },
        LauncherItem(name: "Safari", icon: "safari") {
            UIApplication.shared.open(URL(string: "https://google.com")!) // Opens Safari with Google
        },
        LauncherItem(name: "Phone", icon: "phone") {
            UIApplication.shared.open(URL(string: "tel:")!) // Opens Phone app
        },
        LauncherItem(name: "Notes", icon: "note.text") {
            UIApplication.shared.open(URL(string: "mobilenotes://")!) // Opens Notes app if supported
        },
        LauncherItem(name: "Messages", icon: "message") {
            UIApplication.shared.open(URL(string: "sms:")!) // Opens Messages app
        },
        LauncherItem(name: "Maps", icon: "arrow.triangle.turn.up.right.circle.fill") {
            UIApplication.shared.open(URL(string: "maps://")!) // Opens the Shortcuts app
        }
    ]
  
    
    var body: some View {
        NavigationView {
            ScrollView {
                // Live clock
                Text(formatDate(currentTime))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    .onReceive(timer) { input in
                        self.currentTime = input
                    }
                Text(currentTime.formatted(.dateTime))
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(launcherItems) { item in
                        VStack {
                            Button(action: { item.action() }) {
                                Image(systemName: item.icon)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .padding()
                                    .foregroundColor(.white) // Set icon color to white
                            }
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(.white) // Set text color to white
                        }
                        .padding()
                        .background(Color.black) // Set item background to black
                        .cornerRadius(10) // Optional: Round corners of items
                    }
                }
                .padding()
                
               
            }
            .navigationTitle("Focus")
            .foregroundStyle(Color.white)
            .navigationBarTitleDisplayMode(.inline) // Optional: Adjust navigation title display
            .background(Color.black) // Set the background of the entire view to black
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensure consistent navigation view style
    }
    
    // Format date to show hours and minutes
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a" // Adjust format as needed
        return formatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
