module Slug
  def self.included(clazz)
    def clazz.from_param(token)
      id = if match = token.match(/.+-(\d+)/)
        match[1]
      else
        token
      end

      found = where("id = ? OR #{slugger} ILIKE ?", id.to_i, token.tr('-', '%')).first
      raise ActiveRecord::RecordNotFound.new("Could not find by slug #{token}") unless found
      found
    end

    def clazz.find_by_slug(token)
      from_param(token)
    end

    def clazz.slugged_by(column)
      @slugger = column
    end

    def clazz.slugger
      @slugger || :name
    end
  end

  def slug
    self.send(self.class.slugger).parameterize
  end

  def to_param
    "#{slug}-#{id}"
  end
end
