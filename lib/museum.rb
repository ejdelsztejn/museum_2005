class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    recommendations = []
    patron.interests.each do |interest|
      exhibits.each do |exhibit|
        recommendations << exhibit if interest == exhibit.name
      end
    end
    recommendations
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    exhibits.each do |exhibit|
      patrons_by_exhibit[exhibit] = []
    end
    patrons_by_exhibit.each do |exhibit, patron_array|
      patrons.each do |patron|
        patron_array << patron if recommend_exhibits(patron).include?(exhibit)
      end
    end
    patrons_by_exhibit
  end
end
