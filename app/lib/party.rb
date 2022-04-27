# frozen_string_literal: true

class Party
  attr_accessor :name

  def initialize(params)
    @name = params[:name]
  end

  def long_name
    case name
    when "SPK"
      "Speaker"
    when "CWM"
      "Deputy Speaker"
    when "PRES"
      "President"
    when "DPRES"
      "Deputy President"
    else
      name
    end
  end

  # Does this party not have a whip?
  def whipless?
    name == "XB" ||
      name == "Other" ||
      name[0..2] == "Ind" ||
      name == "None" ||
      name == "SPK" ||
      name == "CWM" ||
      name == "DCWM" ||
      name == "PRES" ||
      name == "DPRES"
  end

  def subject_to_whip?
    !whipless?
  end
end
