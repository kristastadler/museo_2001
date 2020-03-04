

### Iteration 4

```markdown
There are **3** points possible in Iteration 2:

10. Curator #load_photographs && #load_artists
11. Curator #photographs_taken_between
12. Curator #artists_photographs_by_age
```

Use TDD to add the following methods to your `Curator` class:

* `load_photographs(file)` - This method takes a path to a CSV file containing photographs and adds them to the `Curator`. You may find the included `FileIO` class useful.
* `load_artists(file)` - This method takes a path to a CSV file containing artists and adds them to the `Curator`. You may find the included `FileIO` class useful.
* `photographs_taken_between(range)` - This method takes a range and returns an array of all photographs with a year that falls in that range.
* `artists_photographs_by_age(artist)`- This method takes an `Artist` object and return a hash where the keys are the Artists age when they took a photograph, and the values are the names of the photographs.

````ruby
pry(main)> require './lib/curator'

pry(main)> curator = Curator.new
#=> #<Curator:0x00007fd98685b2b0...>

pry(main)> curator.load_photographs('./data/photographs.csv')

pry(main)> curator.load_artists('./data/artists.csv')

pry(main)> curator.photographs_taken_between(1950..1965)
#=> [#<Photograph:0x00007fd986254740...>, #<Photograph:0x00007fd986254678...>]

pry(main)> diane_arbus = curator.find_artist_by_id("3")    

pry(main)> curator.artists_photographs_by_age(diane_arbus)
=> {44=>"Identical Twins, Roselle, New Jersey", 39=>"Child with Toy Hand Grenade in Central Park"}
```
