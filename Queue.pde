class Queue {
  ArrayList<Song> songs;
  
  Queue() {
    songs = new ArrayList<Song>();
    println(songs.size());
  }
  
  void add(File f) {
    songs.add(new Song(f));
    println("# songs in queue: " + songs.size());
  }
}

