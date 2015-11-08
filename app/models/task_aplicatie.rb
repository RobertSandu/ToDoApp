class TaskAplicatie < ActiveRecord::Base
	validates_presence_of :title, :description, :startDate, :endDate
	validates_length_of :title, :within => 5..50
	validates_length_of :description, :within => 10..50
	#validate :startDate_and_endDate_are_valid

  #def startDate_and_endDate_are_valid
   # errors.add(:startDate, 'data de inceput trebuie sa fie valida') if ((DateTime.parse(:startDate) rescue ArgumentError) == ArgumentError)
    #errors.add(:endDate, 'data de final trebuie sa fie valida') if ((DateTime.parse(:endDate) rescue ArgumentError) == ArgumentError)

  #end
end
