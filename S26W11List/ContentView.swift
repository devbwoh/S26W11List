import SwiftUI

struct ContentView: View {
    var body: some View {
        SongListView()
    }
}

struct SongListView: View {
    @State private var viewModel = SongViewModel(
        SongModel(songs: [
            Song(title: "Supernova Blue", artist: "NEXUS"),
            Song(title: "밤하늘 비행 (Night Flight)", artist: "민서 (MINSEO)"),
            Song(title: "Heart Lock", artist: "CHERRY BOMB")
        ])
    )
    
    var body: some View {
        List {
            ForEach(viewModel.songs) { song in
                SongItem(song: song)
            }
        }
    }
}

struct SongItem: View {
    let song: Song
    
    var body: some View {
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

#Preview {
    ContentView()
}
