require 'csv'

class Curator
  attr_reader :photographs,
              :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def photographs_by_artist
    photos_by_artist ={}
    @artists.each do |artist|
      photos_by_artist[artist] = []
    end
    photos_by_artist.each do |artist, photo_array|
      @photographs.each do |photograph|
        if artist.id == photograph.artist_id
          photo_array << photograph
        end
      end
    end
    photos_by_artist
  end

  def artists_with_multiple_photographs
    artists_with_multiple_photos = []
    photographs_by_artist.each do |artist, photo_array|
      if photo_array.length > 1
        artists_with_multiple_photos << artist.name
      end
    end
    artists_with_multiple_photos
  end

  def photographs_taken_by_artist_from(country)
    photos_from_country = []
    photographs_by_artist.each do |artist, photo_array|
      if artist.country == country
        photos_from_country << photo_array
      end
    end
    photos_from_country.flatten
  end

  def load_photographs(file_location)
    csv = CSV.read("#{file_location}", headers: true, header_converters: :symbol)

    csv.each do |row|
       photo = Photograph.new(row.to_hash)
       @photographs << photo
    end
  end

  def load_artists(file_location)
    csv = CSV.read("#{file_location}", headers: true, header_converters: :symbol)

    csv.each do |row|
       artist = Artist.new(row.to_hash)
       @artists << artist
    end
  end

  def photographs_taken_between(date_range)
    @photographs.find_all do |photograph|
      date_range.include?(photograph.year.to_i)
    end
  end

  def artists_photographs_by_age(artist)

    find_artist_by_id(artist.id)
  end
end
