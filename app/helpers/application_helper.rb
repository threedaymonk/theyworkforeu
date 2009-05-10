# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  def memberLink(member)
    "<span class=\"memberLink\">" +
    link_to(image_tag(member.photo) + h(member.name), member, :class=>"memberName") +
    " - " +
#    link_to(h(member.party.name), member.party, :class=>"memberParty") +
    "</span>"
  end


  def make_para_pairs(orig,trans)
    a = orig.gsub(/\A<p>|<\/p>\Z/i,'').split("</p><p>")
    b = trans.gsub(/\A<p>|<\/p>\Z/i,'').split("</p><p>")
    a.zip(b)
  end


end
