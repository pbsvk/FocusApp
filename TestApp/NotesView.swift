import SwiftUI

struct NotesView: View {
    @State private var notes: [String] = []
    @State private var newNote: String = ""
    @State var activeView: currentView
    var body: some View {
        VStack {
            Text("Notes")
                .font(.largeTitle)
                .padding()

            TextField("New Note", text: $newNote)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Note") {
                if !newNote.isEmpty {
                    notes.append(newNote)
                    newNote = ""
                }
            }
            .padding()

            List {
                ForEach(notes, id: \.self) { note in
                    Text(note)
                }
            }
        }
        .padding()
        .navigationTitle("Notes")
        .frame(width: .infinity, height: .infinity, alignment: .center)
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView(activeView: .center)
    }
}
