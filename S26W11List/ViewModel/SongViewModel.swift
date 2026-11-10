import Foundation

@Observable
@MainActor
final class SongViewModel {
    private var model: SongModel
    
    init(_ model: SongModel? = nil) {
        self.model = model ?? SongModel()
    }
    
    var songs: [Song] { model.songs }
    
    func addSong(_ song: Song) {
        model.addSong(song)
    }
}
