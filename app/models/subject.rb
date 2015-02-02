# == Schema Information
#
# Table name: subjects
#
#  id            :integer          not null, primary key
#  name          :text
#  professor_id  :integer
#  department_id :integer
#  descricao     :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Subject < ActiveRecord::Base
 has_and_belongs_to_many :questions
end
