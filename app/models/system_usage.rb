class SystemUsage < ActiveRecord::Base

  def as_json options={}
    {
      x: created_at,
      y: used_bikes,
      free_bikes: free_bikes
    }
  end

  def self.create_with(free_bikes, used_bikes, minute)
    su = SystemUsage.order(:created_at).last
    if (su.blank? || (Time.now > su.created_at && Time.now.min != su.minute_created))
      SystemUsage.create(free_bikes: free_bikes, used_bikes: used_bikes, minute_created: Time.now.min)
    end
  end
end
