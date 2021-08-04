require_relative "questions_db.rb"
require_relative "user.rb"

class Reply
  attr_accessor :id, :body, :parent_id, :question_id, :replier_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datam| Reply.new(datam) }
  end

  def initialize(options)
    @id = options["id"]
    @body = options["body"]
    @parent_id = options["parent_id"]
    @question_id = options["question_id"]
    @replier_id = options["replier_id"]
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_replier_id(replier_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, replier_id)
      SELECT
        *
      FROM
        replies
      WHERE
        replier_id = ?
    SQL
    return nil unless reply.length > 0

    reply.map { |r| Reply.new(r) }
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless reply.length > 0

    reply.map { |r| Reply.new(r) }
  end

  def author
    User.find_by_id(replier_id)
  end

  def question
    Question.find_by_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(parent_id)
  end

  def child_replies
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
    return nil unless reply.length > 0

    reply.map { |r| Reply.new(r) }
  end

end