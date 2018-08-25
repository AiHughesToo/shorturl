class Link < ApplicationRecord

  def gen_short_url
    # save the link first to get a record id
    self.save
    # convert the given id to a string base 36 to allow for very large numbers.
    self.short_url = self.id.to_s(36)
  end
end
