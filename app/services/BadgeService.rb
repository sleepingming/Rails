class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    set_test_passages
    @badges = Badge.where.not(id: @user.badges.ids)
  end

  def call
    @badges.select do |badge|
      send(badge.rule, badge.parameter)
    end
  end

  private

  def first_try?(_params)
    @test_passages.count == 1 if @test_passage.success?
  end

  def success_category?(_params)
    tests_by_category = Test.where(category_id: @parameter).count
    !tests_by_category.zero? && (TestPassage.where(success_passed?: true, user: @user, test: Test.where(category_id: @parameter)).to_a.uniq(&:test_id).count == tests_by_category)
  end

  def success_by_level?(level)
    tests_by_level = Test.where(level: level.to_i).count
    !tests_by_level.zero? && (TestPassage.where(success_passed?: true, user: @user, test: Test.by_level(level.to_i)).to_a.uniq(&:test_id).count == tests_by_level)
  end

  def set_test_passages
    @test_passages = @user.test_passages.where(test: @test)
  end
end
