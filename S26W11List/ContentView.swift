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
        HStack(spacing: 16) {
            ImageAlbum(albumUrl: makeAlbumUrl(song.id))
            
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

//func makeAlbumUrl(_ id: UUID) -> URL {
//    URL(string: "https://picsum.photos/80/80?random=\(id)")!
//}
let makeAlbumUrl: (UUID) -> URL = {
    URL(string: "https://picsum.photos/80/80?random=\($0)")!
}

struct ImageAlbum: View {
    let albumUrl: URL
    
    var body: some View {
        AsyncImage(url: albumUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
        }
    }
}

#Preview {
    ContentView()
}
