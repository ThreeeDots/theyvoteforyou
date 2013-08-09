require 'spec_helper'
# Compare results of rendering pages via rails and via the old php app

describe DivisionsController do
  include HTMLCompareHelper
  fixtures :electorates, :offices, :members, :member_infos, :divisions, :division_infos, :whips, :votes
  
  it "#show" do
    compare("/division.php?date=2013-03-14&number=1")
    compare("/division.php?date=2013-03-14&number=1&house=representatives")
    compare("/division.php?date=2013-03-14&number=1&house=senate")
    compare("/division.php?date=2013-03-14&number=1&display=allvotes")
    compare("/division.php?date=2013-03-14&number=1&house=representatives&display=allvotes")
    compare("/division.php?date=2013-03-14&number=1&house=senate&display=allvotes")
    compare("/division.php?date=2013-03-14&number=1&display=allpossible")
    compare("/division.php?date=2013-03-14&number=1&house=representatives&display=allpossible")
    compare("/division.php?date=2013-03-14&number=1&house=senate&display=allpossible")
    compare("/division.php?date=2013-03-14&number=1&display=policies")
    compare("/division.php?date=2013-03-14&number=1&house=representatives&display=policies")
    compare("/division.php?date=2013-03-14&number=1&house=senate&display=policies")
    compare("/division.php?date=2013-03-14&number=1&sort=name")
    compare("/division.php?date=2013-03-14&number=1&house=representatives&sort=name")
    compare("/division.php?date=2013-03-14&number=1&house=senate&sort=name")
    compare("/division.php?date=2013-03-14&number=1&display=allvotes&sort=name")
    compare("/division.php?date=2013-03-14&number=1&house=representatives&display=allvotes&sort=name")
    compare("/division.php?date=2013-03-14&number=1&house=senate&display=allvotes&sort=name")
    compare("/division.php?date=2013-03-14&number=1&display=allpossible&sort=name")
    compare("/division.php?date=2013-03-14&number=1&house=representatives&display=allpossible&sort=name")
    compare("/division.php?date=2013-03-14&number=1&house=senate&display=allpossible&sort=name")
    compare("/division.php?date=2013-03-14&number=1&sort=vote")
    compare("/division.php?date=2013-03-14&number=1&house=representatives&sort=vote")
    compare("/division.php?date=2013-03-14&number=1&house=senate&sort=vote")
    compare("/division.php?date=2013-03-14&number=1&display=allvotes&sort=vote")
    compare("/division.php?date=2013-03-14&number=1&house=representatives&display=allvotes&sort=vote")
    compare("/division.php?date=2013-03-14&number=1&house=senate&display=allvotes&sort=vote")
    compare("/division.php?date=2013-03-14&number=1&display=allpossible&sort=vote")
    compare("/division.php?date=2013-03-14&number=1&house=representatives&display=allpossible&sort=vote")
    compare("/division.php?date=2013-03-14&number=1&house=senate&display=allpossible&sort=vote")
  end

  it "#index" do
    compare("/divisions.php")
    compare("/divisions.php?rdisplay=2007")
    compare("/divisions.php?rdisplay=2004")
    compare("/divisions.php?rdisplay=all")
    compare("/divisions.php?rdisplay2=rebels")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels")
    compare("/divisions.php?house=representatives")
    compare("/divisions.php?rdisplay=2007&house=representatives")
    compare("/divisions.php?rdisplay=2004&house=representatives")
    compare("/divisions.php?rdisplay=all&house=representatives")
    compare("/divisions.php?rdisplay2=rebels&house=representatives")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=representatives")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=representatives")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&house=representatives")
    compare("/divisions.php?house=senate")
    compare("/divisions.php?rdisplay=2007&house=senate")
    compare("/divisions.php?rdisplay=2004&house=senate")
    compare("/divisions.php?rdisplay=all&house=senate")
    compare("/divisions.php?rdisplay2=rebels&house=senate")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=senate")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=senate")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&house=senate")

    compare("/divisions.php?sort=subject")
    compare("/divisions.php?rdisplay=2007&sort=subject")
    compare("/divisions.php?rdisplay=2004&sort=subject")
    compare("/divisions.php?rdisplay=all&sort=subject")
    compare("/divisions.php?rdisplay2=rebels&sort=subject")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&sort=subject")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&sort=subject")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&sort=subject")
    compare("/divisions.php?house=representatives&sort=subject")
    compare("/divisions.php?rdisplay=2007&house=representatives&sort=subject")
    compare("/divisions.php?rdisplay=2004&house=representatives&sort=subject")
    compare("/divisions.php?rdisplay=all&house=representatives&sort=subject")
    compare("/divisions.php?rdisplay2=rebels&house=representatives&sort=subject")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=representatives&sort=subject")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=representatives&sort=subject")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&house=representatives&sort=subject")
    compare("/divisions.php?house=senate&sort=subject")
    compare("/divisions.php?rdisplay=2007&house=senate&sort=subject")
    compare("/divisions.php?rdisplay=2004&house=senate&sort=subject")
    compare("/divisions.php?rdisplay=all&house=senate&sort=subject")
    compare("/divisions.php?rdisplay2=rebels&house=senate&sort=subject")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=senate&sort=subject")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=senate&sort=subject")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&house=senate&sort=subject")

    compare("/divisions.php?sort=rebellions")
    compare("/divisions.php?rdisplay=2007&sort=rebellions")
    compare("/divisions.php?rdisplay=2004&sort=rebellions")
    compare("/divisions.php?rdisplay=all&sort=rebellions")
    compare("/divisions.php?rdisplay2=rebels&sort=rebellions")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&sort=rebellions")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&sort=rebellions")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&sort=rebellions")
    compare("/divisions.php?house=representatives&sort=rebellions")
    compare("/divisions.php?rdisplay=2007&house=representatives&sort=rebellions")
    compare("/divisions.php?rdisplay=2004&house=representatives&sort=rebellions")
    compare("/divisions.php?rdisplay=all&house=representatives&sort=rebellions")
    compare("/divisions.php?rdisplay2=rebels&house=representatives&sort=rebellions")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=representatives&sort=rebellions")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=representatives&sort=rebellions")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&house=representatives&sort=rebellions")
    compare("/divisions.php?house=senate&sort=rebellions")
    compare("/divisions.php?rdisplay=2007&house=senate&sort=rebellions")
    compare("/divisions.php?rdisplay=2004&house=senate&sort=rebellions")
    compare("/divisions.php?rdisplay=all&house=senate&sort=rebellions")
    compare("/divisions.php?rdisplay2=rebels&house=senate&sort=rebellions")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=senate&sort=rebellions")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=senate&sort=rebellions")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&house=senate&sort=rebellions")

    compare("/divisions.php?sort=turnout")
    compare("/divisions.php?rdisplay=2007&sort=turnout")
    compare("/divisions.php?rdisplay=2004&sort=turnout")
    compare("/divisions.php?rdisplay=all&sort=turnout")
    compare("/divisions.php?rdisplay2=rebels&sort=turnout")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&sort=turnout")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&sort=turnout")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&sort=turnout")
    compare("/divisions.php?house=representatives&sort=turnout")
    compare("/divisions.php?rdisplay=2007&house=representatives&sort=turnout")
    compare("/divisions.php?rdisplay=2004&house=representatives&sort=turnout")
    compare("/divisions.php?rdisplay=all&house=representatives&sort=turnout")
    compare("/divisions.php?rdisplay2=rebels&house=representatives&sort=turnout")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=representatives&sort=turnout")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=representatives&sort=turnout")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&house=representatives&sort=turnout")
    compare("/divisions.php?house=senate&sort=turnout")
    compare("/divisions.php?rdisplay=2007&house=senate&sort=turnout")
    compare("/divisions.php?rdisplay=2004&house=senate&sort=turnout")
    compare("/divisions.php?rdisplay=all&house=senate&sort=turnout")
    compare("/divisions.php?rdisplay2=rebels&house=senate&sort=turnout")
    compare("/divisions.php?rdisplay=2007&rdisplay2=rebels&house=senate&sort=turnout")
    compare("/divisions.php?rdisplay=2004&rdisplay2=rebels&house=senate&sort=turnout")
    compare("/divisions.php?rdisplay=all&rdisplay2=rebels&house=senate&sort=turnout")

    compare("/divisions.php?rdisplay2=Australian%20Labor%20Party_party&house=representatives")
    compare("/divisions.php?rdisplay2=Liberal%20Party_party&house=representatives")
    compare("/divisions.php?rdisplay2=Australian%20Greens_party&house=senate")
  end
end
