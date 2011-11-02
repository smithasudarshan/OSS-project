require 'test_helper'

class QuestionnaireHelperTest < ActionView::TestCase
  def test_copy(questionnaire)
  #test if the questionnaire which is supposed to be copied exists
    questionnaire = 47288103
    orig_questionnaire = 47288103

    @questionnaire = orig_questionnaire.clone
    assert orig_questionnaire.clone
  end
end
