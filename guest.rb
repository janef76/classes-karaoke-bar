class Guest
  attr_reader :name, :money, :song
  def initialize(name, money, song)
    @name = name
    @money = money
    @song = song
  end

  def enough_money?(entry)
    return money >= entry.entry_fee()
  end

  def pay_entry(fee)
    if enough_money?(fee)
      @money -= fee.entry_fee
    end
  end
end
