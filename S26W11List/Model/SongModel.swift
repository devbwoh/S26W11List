struct SongModel {
    private(set) var songs: [Song] = []
    
    mutating func addSong(_ song: Song) {
        songs.append(song)
    }
}
