class Exhibit
  attr_reader :name,
              :cost
              
  def initialize(info_hash)
    @name = info_hash[:name]
    @cost = info_hash[:cost]
  end
end
