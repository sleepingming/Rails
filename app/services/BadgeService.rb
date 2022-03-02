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

  def success_category?(category)
    return false unless @test.category.title == category

    test_ids = Test.tests_by(category).ids
    test_ids.size == success_tests(test_ids)
  end

  def success_by_level?(level)
    return false unless @test.level == level.to_i
    
    test_ids = Test.where(level: level).ids
    test_ids.size == success_tests(test_ids)
  end

  def success_tests(test_ids)
    @user.test_passages.where(test_id: test_ids).successfully.uniq.count
  end

  def set_test_passages
    @test_passages = @user.test_passages.where(test: @test)
  end
end
