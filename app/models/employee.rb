class Employee < ApplicationRecord
  validates :emp_id, :presence => {:message => ERROR_NOTIFIER['employee_id_blank']}
  validates :name,:presence => {:message => ERROR_NOTIFIER['name_blank']}
  validates :salary, :presence => {:message => ERROR_NOTIFIER['salary_blank']}
  validates :age, :presence => {:message => ERROR_NOTIFIER['age']}
  validates_numericality_of :age,:salary
  validates :emp_id, :uniqueness => {:message => ERROR_NOTIFIER['employee_id_repeated']}
end
