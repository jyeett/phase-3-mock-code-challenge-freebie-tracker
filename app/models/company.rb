class Company < ActiveRecord::Base

    def self.oldest_company
        self.all.min{|a, b| a.founding_year <=> b.founding_year}
    end

    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
    end
end
