class TitleValidator < ActiveModel::Validator
  def validate(record)
    clickbait = [".*Won't Believe.*", ".*Secret.*", ".*Top \\d+.*", ".*Guess.*"]
    if !clickbait.any? {|bait| record.title && record.title.match?(bait)}
      record.errors[:title] << "title is clickbait"
    end
  end
end