module TrackHelper
  def ugly_lyrics(lyrics)
    lyrics_lines = lyrics.split("\n")
    result = lyrics_lines.map { |line| "&#9835 " + h(line) }.join("\n")
    result.html_safe
  end
end
