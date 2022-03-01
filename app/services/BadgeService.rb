class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.find_each do |badge|
      @user.badges.push(badge) if done_condition?(badge)
    end
  end

  private

  def done_condition?(badge)
    @parameter = badge.parameter
    case badge.rule
    when 'first_try' then first_try?
    when 'success_category' then success_category?
    else
      'success_by_level'
    end
  end

  def first_try?
    TestPassage.where(user_id: @user.id, test_id: @test_passage.test.id).count == 1
  end

  def success_category?
    Test.where(category: Category.where(title: @parameter)).count == TestPassage.where(success_passed?: true, user: @user, test: Test.tests_by(@parameter)).to_a.uniq(&:test_id).count
  end

  def success_by_level?
    Test.where(level: @parameter.to_i).count == TestPassage.where(success_passed?: true, user: @user, test: Test.where(level: @parameter.to_i)).count
  end
end
