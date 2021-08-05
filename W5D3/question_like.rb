require_relative "questions_db.rb"

class QuestionLike
  attr_accessor :id, :liker_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datam| QuestionLike.new(datam) }
  end

  def initialize(options)
    @id = options["id"]
    @liker_id = options["liker_id"]
    @question_id = options["question_id"]
  end

  def self.find_by_id(id)
    like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil unless like.length > 0

    QuestionLike.new(like.first)
  end

end