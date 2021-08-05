require_relative "questions_db.rb"
require_relative "user.rb"
require_relative "question.rb"

class QuestionFollow
  attr_accessor :id, :question_id, :author_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datam| QuestionFollow.new(datam) }
  end

  def initialize(options)
    @id = options["id"]
    @question_id = options["question_id"]
    @follower_id = options["follower_id"]
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

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.id, users.f_name, users.l_name
      FROM
        users
      JOIN
        question_follows ON users.id = question_follows.follower_id
      JOIN
        questions ON questions.id = question_follows.question_id
      WHERE
        questions.id = ?
    SQL
    return nil unless followers.length > 0

    followers.map { |f| User.new(f) }
  end

  def self.followed_questions_for_follower_id(follower_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, follower_id)
      SELECT
        questions.id, questions.title, questions.body, questions.author_id
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      JOIN
        users ON users.id = question_follows.follower_id
      WHERE
        question_follows.follower_id = ?
    SQL
    return nil unless questions.length > 0

    questions.map { |q| Question.new(q) }
  end

  def self.most_followed_questions(n=1)
    question = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.id, questions.title, questions.body, questions.author_id
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_follows.question_id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_follows.follower_id) DESC
      LIMIT
        1
      OFFSET
        ? - 1
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

end