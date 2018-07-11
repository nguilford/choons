export default class SongsList {
  constructor(songList) {
    this.songs = songList;
  }

  getObjectAt(index) {
    return this.songs[index];
  }

  getSize() {
    return this.songs.length;
  }

  getAll() {
    return this.songs;
  }
}
