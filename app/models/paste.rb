class Paste < ActiveRecord::Base
  unloadable

  def self.purge_old

    @items = Paste.where("accessed_at < :month", {:month => 1.month.ago}).destroy_all


  end

  def self.touch(id)
    item = Paste.find(id)
    item.accessed_at = Time.now
    item.save
  end

end
