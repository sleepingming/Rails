class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.select do |badge|
      send("#{badge.rule}?", badge.parameter)
    end
  end

  private

  def first_try?(_params)
    @user.test_passages.where(test: @test).count == 1 if @test_passage.success?
  end

  def success_category?(category_id)
    if @test.category.id == category_id.to_i
      test_ids = Test.where(category_id: category_id.to_i).ids
      test_ids.size == success_tests(test_ids)
    else
      false
    end
  end

  def success_by_level?(level_id)
    if @test.level == level_id.to_i
      test_ids = Test.where(level: level_id).ids
      test_ids.size == success_tests(test_ids)
    else
      false
    end
  end

  def success_tests(test_ids)
    @user.test_passages.where(test_id: test_ids).successfully.count
  end
end
