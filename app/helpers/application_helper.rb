module ApplicationHelper
  def full_name(name)
    "#{name.first_name} #{name.last_name}"
  end
end
