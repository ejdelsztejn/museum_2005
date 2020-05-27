class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @revenue = 0
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
    attend_exhibits(patron)
  end

  def attend_exhibits(patron)
    sorted_exhibits = recommend_exhibits(patron).sort {|a, b| b.cost <=> a.cost }
    sorted_exhibits.each do |exhibit|
      if patron.spending_money >= exhibit.cost
        @revenue += exhibit.cost
        patron.spend_money(exhibit.cost)
      else
        next
      end
    end
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

  def ticket_lottery_contestants(exhibit)
    return nil if patrons_by_exhibit_interest[exhibit].empty?
    lottery_contestants = []
    patrons.each do |patron|
      if patron.interests.include?(exhibit.name)
        lottery_contestants << patron if exhibit.cost > patron.spending_money
      end
    end
    lottery_contestants
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit) == nil
      "No winners for this lottery"
    else
      ticket_lottery_contestants(exhibit).sample
    end
  end
end
