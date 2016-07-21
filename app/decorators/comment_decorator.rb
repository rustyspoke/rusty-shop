class CommentDecorator < Draper::Decorator

  delegate :body

  def self.for_shift(shift)
    comments = ActiveAdmin::Comment.where 'created_at between ? and ?', shift.beginning_at, shift.ending_at
    self.decorate_collection comments
  end

  def author_name
    object.author.name
  end

  def resource_name
    object.resource.decorate.name
  end
end
