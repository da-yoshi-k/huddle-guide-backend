require 'factory_bot_rails'

3.times.each do
  admin_user = FactoryBot.create(:user, :user_with_teams)
  4.times.each do
    other_user = FactoryBot.create(:user)
    other_user.teams << admin_user.teams.first
  end
end

steps = %i[waiting being_posted presentation chatting closed]

FactoryBot.create(:work, :finding_common_interets)
FactoryBot.create(:work, :good_and_new)
steps.each { |step| FactoryBot.create(:work_step, step) }
