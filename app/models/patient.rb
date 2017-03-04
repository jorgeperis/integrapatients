class Patient < ApplicationRecord
  scope :search, -> (query) {
    searchable_fields = %i(name email history)
      where(searchable_fields.map { |field| "#{field} LIKE ?" }.join(' OR '),
            *(Array.new(searchable_fields.size, "%#{query}%")))
  }

  def updated_info
    "#{updated_at.localtime.strftime("%d/%m/%Y %H:%M")}, #{updated_by}"
  end
end
