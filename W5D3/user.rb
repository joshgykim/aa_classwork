require_relative "questions_db.rb"
require_relative "question.rb"
require_relative "reply.rb"

class User
  attr_accessor :id, :f_name, :l_name

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datam| User.new(datam) }
  end

  def initialize(options)
    @id = options["id"]
    @f_name = options["f_name"]
    @l_name = options["l_name"]
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def self.find_by_name(f_name, l_name)
    user = QuestionsDatabase.instance.execute(<<-SQL, f_name, l_name)
      SELECT
        *
      FROM
        users
      WHERE
        f_name = ? AND l_name = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_replier_id(id)
  end

end