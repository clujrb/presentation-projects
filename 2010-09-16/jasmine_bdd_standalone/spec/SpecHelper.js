beforeEach(function() {
  this.addMatchers({
    toBePlaying: function(expectedSong) {
      var player = this.actual;
      return player.currentlyPlayingSong === expectedSong
          && player.isPlaying;
    }
  });
  
  jQuery('<div id="fixtures"/>').appendTo("body");
});

afterEach(function() { jQuery("#fixtures").remove(); });

function fixture(element) {
  if (jQuery.isArray(element)) {
    jQuery('#fixtures').haml(element);
  } else {
    jQuery('#fixtures').append(element);
  }
}
