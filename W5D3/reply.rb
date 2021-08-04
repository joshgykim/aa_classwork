require_relative "questions_db.rb"

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


end