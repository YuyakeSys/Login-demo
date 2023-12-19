class Project < ApplicationRecord
    def self.all_labels
    distinct.pluck(:labels).flatten.compact.uniq
  end
end
