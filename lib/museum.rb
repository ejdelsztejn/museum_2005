class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
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
end
