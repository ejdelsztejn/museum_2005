class Exhibit
  attr_reader :name,
              :cost

  def initialize(info_hash)
    @name = info_hash[:name]
    @cost = info_hash[:cost]
  end

  def patrons(patron_list)
    patrons = []
    patron_list.each do |patron|
      if patron.interests.include?(@name)
        patrons << patron
      end
    end
    patrons
  end

end
