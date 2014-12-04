require 'pry'

# This is a named ruby structure that allows
# multiple attributes to be bundled together
# and have accessor methods without defining
# a class
HashEntry = Struct.new(:key, :value)

class HashTable

  # define two instance variables that can be accessed (read & write)
  attr_accessor :bins
  attr_accessor :bin_count

  # Initialze the instance variables
  # Sets bins to empty, and the number of bins to 11
  def initialize
    self.bins = []
    self.bin_count = 11
  end

  # determines bin number for a given key
  # this is essentially the hash function
  # it leverages the ruby .hash method
  def bin_for(key)
    key.hash % self.bin_count
  end

  # defines a shovel operator for the HashTable class
  # that takes an entry and puts the entry into
  # the correct bin
  def <<(entry)
    index = bin_for(entry.key)
    self.bins[index] ||= []
    self.bins[index] << entry
  end

  # Look for an entry by a key
  # call this like so:
  # Given `table = HashTable.new`,
  # initiate this search by specifying `table[key]`
  def [](key)
    # get the index of he bin for the given key
    index = bin_for(key)

    # Goes element by elemnt in the bin that
    # is at the index to see if we can find
    # an entry that matches the given key
    # and return a boolean
    self.bins[index].detect do |entry|
      entry.key == key
    end
  end
end

# Create an entry
entry = HashEntry.new :foo, :bar
#create the hash table
table = HashTable.new
# put the entry into the table
table << entry

# search for as key as follows:
found = table[:foo] #==> true
found = table[:bar] #==> true
found = table[:notthere] #==> false
