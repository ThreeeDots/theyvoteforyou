class Distance
  # absents have low weighting, except where it is a strong vote
  STRONG_WEIGHT = 5.0
  ABSENT_WEIGHT = 0.2

  attr_reader :same, :samestrong, :differ, :differstrong, :absent, :absentstrong

  def initialize(same, samestrong, differ, differstrong, absent, absentstrong)
    @same, @samestrong, @differ, @differstrong, @absent, @absentstrong =
      same, samestrong, differ, differstrong, absent, absentstrong
  end

  def distance
    1 - agreement
  end

  def score
    same + STRONG_WEIGHT * samestrong + ABSENT_WEIGHT / 2 * absent + STRONG_WEIGHT / 2 * absentstrong
  end

  def weight
    same + STRONG_WEIGHT * samestrong + differ + STRONG_WEIGHT * differstrong +
          ABSENT_WEIGHT * absent + STRONG_WEIGHT * absentstrong
  end

  # TODO: Need to make this formula more clear
  def agreement
    if weight > 0
      score / weight
    else
      2
    end
  end

  def self.calculate(same, samestrong, differ, differstrong, absent, absentstrong)
    Distance.new(same, samestrong, differ, differstrong, absent, absentstrong).distance
  end
end
