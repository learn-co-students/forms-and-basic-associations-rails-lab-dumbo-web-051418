require 'pry'
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by(name: artist_name)
  end

  def note_contents
    self.notes.map { |note| note.content }
  end

  def note_contents=(array_of_content)
    array_of_content.each do |content|
      if !content.empty?
        self.notes << Note.create(content: content)
      end
    end
  end

  def genre_name
    self.genre.name
  end

  def genre_name=(genre_text)
    self.genre = Genre.create(name: genre_text)
  end
end
