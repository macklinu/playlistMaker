import ddf.minim.*;

class Queue {
  Minim minim;
  AudioPlayer player;
  ArrayList<Song> songs;
  
  Queue() {
    minim = new Minim(playlistMaker.this);
    songs = new ArrayList<Song>();
    println(songs.size());
  }
  
  void add(File f) {
    songs.add(new Song(f));
    println("# songs in queue: " + songs.size());
  }
}

