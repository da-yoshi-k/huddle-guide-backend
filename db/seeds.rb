3.times.each do
  admin_user = FactoryBot.create(:user, :user_with_teams)
  4.times.each do
    other_user = FactoryBot.create(:user)
    other_user.teams << admin_user.teams.first
  end
end

steps = [:waiting, :being_posted, :presentation, :chatting, :closed]

first_work = FactoryBot.create(:work, :finding_common_interets)
steps.each{|step|
  FactoryBot.create(:work_step, step, work: first_work)
}
second_work = FactoryBot.create(:work, :good_and_new)
steps.each{|step|
  FactoryBot.create(:work_step, step, work: second_work)
}
