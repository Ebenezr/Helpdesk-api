class QuestionTest < ActiveSupport::TestCase
    test "should not save question without title" do
        question = Question.new
        assert_not question.save, "Saved the question without a title"
    end

    test "should not save question without description" do
        question = Question.new
        assert_not question.save, "Saved the question without a description"
    end

    test "should not save question without user_id" do  
        question = Question.new
        assert_not question.save, "Saved the question without a user_id"
    end
    
    test "should not save question without votes" do
        question = Question.new
        assert_not question.save, "Saved the question without votes"
    end

    test "should save question with title, description, user_id, and votes" do
        question = Question.new
        question.title = "Test Title"
        question.description = "Test Description"
        question.user_id = 1
        question.votes = 0
        assert question.save, "Did not save question with title, description, user_id, and votes"
    end

    test "should not save question with duplicate title" do
        question = Question.new
        question.title = "Test Title"
        question.description = "Test Description"
        question.user_id = 1
        question.votes = 0
        question.save
        question2 = Question.new
        question2.title = "Test Title"
        question2.description = "Test Description"
        question2.user_id = 1
        question2.votes = 0
        assert_not question2.save, "Saved question with duplicate title"
    end
end

# The test will fail because the question does not have a title. The test will pass when we add