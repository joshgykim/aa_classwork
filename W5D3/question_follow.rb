require_relative "questions_db.rb"

class QuestionFollow
  attr_accessor :id, :question_id, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datam| QuestionFollow.new(datam) }
  end

  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @author_id = options["author_id"]
  end

  def self.find_by_id(id)
    follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil unless follow.length > 0

    QuestionFollow.new(follow.first)
  end

end