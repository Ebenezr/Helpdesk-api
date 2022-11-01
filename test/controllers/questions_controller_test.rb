require "./test/test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
    # test "the truth" do
    #   assert true
    # end

    # setup do
    #     @question = questions(:one)
    # end



    test "should get index" do
        get questions_url, as: :json
        assert_response :success
    end

    test "should create question" do
        assert_difference('Question.count') do
            post questions_url, params: { question: { description: @question.description, title: @question.title, user_id: @question.user_id, votes: @question.votes } }, as: :json
        end

        assert_response 201
    end

    test "should show question" do
        get question_url(@question), as: :json
        assert_response :success
    end

    test "should update question" do
        patch question_url(@question), params: { question: { description: @question.description, title: @question.title, user_id: @question.user_id, votes: @question.votes } }, as: :json
        assert_response 200
    end
    
    test "should destroy question" do
        assert_difference('Question.count', -1) do
            delete question_url(@question), as: :json
        end

        assert_response 204
    end


    
end

