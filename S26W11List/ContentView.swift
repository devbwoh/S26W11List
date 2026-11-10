import SwiftUI

struct ContentView: View {
    var body: some View {
        MyList()
    }
}

struct MyList: View {
    @State private var viewModel = SongViewModel(
        SongModel(songs: [
            Song(id: 1, title: "Supernova Blue", artist: "NEXUS"),
            Song(id: 2, title: "밤하늘 비행 (Night Flight)", artist: "민서 (MINSEO)"),
            Song(id: 3, title: "Heart Lock", artist: "CHERRY BOMB")
        ])
    )
    
    var body: some View {
        List {
            ForEach(viewModel.songs, id: \.id) { song in
                VStack(
                    alignment: .leading,
                    spacing: 16,
                ) {
                    Text(song.title)
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text(song.artist)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
