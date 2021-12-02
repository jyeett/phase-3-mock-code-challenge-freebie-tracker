class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.map{|free| free.item_name == item_name}.include?(true)
    end

    def give_away(dev, freebie)
        if (self.received_one?(freebie.item_name))
            freebie.update({dev_id: dev.id})
        else
            "dev doesn't have this item"
        end
    end
end
