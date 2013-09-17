require 'nokogiri'
require 'open-uri'



namespace :scrape do
  desc "Rake task to scrape game schedule"
  task :schedule => :environment do

    @games = []
    doc = Nokogiri::HTML(open('http://www.nfl.com/schedules'))
    doc.css('div.schedules-list ul.schedules-table li.schedules-list-matchup').each do |x|
    # old ---> doc.css('div.schedules-list:nth-child(even) ul.schedules-table li.schedules-list-matchup').each do |x|
      

      game = {
        start_time: x.css('span.time').text,
        game_date: x.css('.schedules-list-content')[0]['data-gameid'].chop.chop,
        home_team: x.css('.list-matchup-row-team .team-name.home').text,
        home_score: x.css('.list-matchup-row-team .team-score.home').text,
        away_team: x.css('.list-matchup-row-team .team-name.away').text,
        away_score: x.css('.list-matchup-row-team .team-score.away').text
      }

      

      #saves weekly games to the database
      Game.create(
                  start_time: game[:start_time],
                  game_date: game[:game_date],
                  home_team: game[:home_team],
                  # home_score: game[:home_score],
                  away_team: game[:away_team],
                  # away_score: game[:away_score]
                  )

    end
  end
end


namespace :scrape do
  desc "Rake task to update game schedule"
  task :update => :environment do 

    @all_games = Game.all
    doc = Nokogiri::HTML(open('http://www.nfl.com/schedules'))
    doc.css('div.schedules-list ul.schedules-table li.schedules-list-matchup').each do |x| 
      game = {
        start_time: x.css('span.time').text,
        home_team: x.css('.list-matchup-row-team .team-name.home').text,
        home_score: x.css('.list-matchup-row-team .team-score.home').text,
        away_score: x.css('.list-matchup-row-team .team-score.away').text
      }
         
      teams = [[game[:home_team], game[:home_score]], [game[:away_team], game[:away_score]]]
      @winner = teams.max {|a,b| a[1] <=> b[1] }

      @game = Game.find_by_home_team(game[:home_team])
        @game.start_time = game[:start_time]
        @game.home_score = game[:home_score]
        @game.away_score = game[:away_score]
        @game.winner = @winner[0]
        @game.save
        
        if(@game.questions == [])
          false
        else
          quest_1 = @game.questions[0]
          quest_1.update_attributes(
            correct_answer: @winner[0]
         )
          quest_2 = @game.questions[1]
          quest_2.update_attributes(
            correct_answer: game[:home_score]
            )
          quest_3 = @game.questions[2]
          quest_3.update_attributes(
            correct_answer: game[:away_score]
            )
        end
      end

#compares wager response
    def compare_wager_to_first_question(i)
      @all_games.each do |game|
        if(game.questions == [])
          false
        else
          @q = game.questions[i]
          wags = @q.wagers
          wags.each do |wager|
            if wager.response == @q.correct_answer
             wager.update_attributes(
              result: "true"
              )
            elsif wager.response != @q.correct_answer
             wager.update_attributes(
              result: "false"
              )
            end
          end
        end
      end
    end

 #compares Wager response to correct answer of pre-game questions 2-7.
     def compare_wager_to_question(i)
       @all_games.each do |game|
         if(game.questions == [])
          false
         else
           @q = game.questions[i]
           wags = @q.wagers
           wags.each do |wager|
             resp = wager.response.split('..').inject { |s,e| s.to_i..e.to_i }
             answer = @q.correct_answer.to_i
             if resp.include?(answer)
              wager.update_attributes(
               result: "true"
               )
             else
              wager.update_attributes(
               result: "false"
               )
             end
           end
         end
       end
     end
    compare_wager_to_first_question(0)
    compare_wager_to_question(1)
    compare_wager_to_question(2)

        @all_users = User.all
        @all_users.each do |user|
          user.wagers.each do |wager|
            unless wager.status == "completed"

              if wager.status == "active" && wager.result == "true"
                  user.bank.total_point_amount = user.bank.total_point_amount + wager.point_amount
                  user.bank.balance = user.bank.balance + (wager.point_amount * 2)
                  recruit_range = (5000..25000)
                  student_range = (25001..75000)
                  heisman_range = (75001..150000)
                  rookie_range = (150001..300000)
                  pro_range = (3000001..500000)
                  all_pro_range = (500001..100000)
                  fame_range = (100001..200000)
                    if recruit_range.include?(user.bank.total_point_amount)
                      user.bank.rank = "Top-Recruit"
                      user.bank.save
                    elsif student_range.include?(user.bank.total_point_amount)
                      user.bank.rank = "Student-Athlete"
                      user.bank.save
                    elsif heisman_range.include?(user.bank.total_point_amount)
                      user.bank.rank = "Heisman"
                      user.bank.save
                    elsif rookie_range.include?(user.bank.total_point_amount)
                      user.bank.rank = "Rookie"
                      user.bank.save
                    elsif pro_range.include?(user.bank.total_point_amount)
                      user.bank.rank = "Pro"
                      user.bank.save
                    elsif all_pro_range.include?(user.bank.total_point_amount)
                      user.bank.rank = "All-Pro"
                      user.bank.save
                    elsif fame_range.include?(user.bank.total_point_amount)
                      user.bank.rank = "Hall of Fame"
                      user.bank.save
                    end
                  user.bank.save

              elsif wager.result == "false"
                  nil
              end
            end
              wager.status = "completed"
              wager.save
      end
    end

  end
end
  
#   desc "Rake task to update game schedule"
#   task :live => :environment do

#     # @all_games.each do |game|
#       # if game.week == args.week_number.to_i
#        doc = Nokogiri::XML(File.open("public/boxscore.xml"))
       
#        #grab
#         doc.css('game').each do |game|
#           @current_quarter = game["quarter"]
#           @game_status = game["status"]
#           @home_team = game["home"]
#           @away_team = game["away"]
#         end

#         #get elements from API and set them to variables
#         # @home_quarter1_points = doc.css('game team scoring quarter')[0]["points"]
#         @home_quarter2_points = doc.css('game team scoring quarter')[1]["points"]
#         @home_quarter3_points = doc.css('game team scoring quarter')[2]["points"]
#         @home_quarter4_points = doc.css('game team scoring quarter')[3]["points"]
#         # @away_quarter1_points = doc.css('game team scoring quarter')[4]["points"]
#         @away_quarter2_points = doc.css('game team scoring quarter')[5]["points"]
#         @away_quarter3_points = doc.css('game team scoring quarter')[6]["points"]
#         @away_quarter4_points = doc.css('game team scoring quarter')[7]["points"]

#         #put opposing scores from each quarter into an array so they can be compared
#         quarter1_point_comparison = [[@home_team, @home_quarter1_points], [@away_team, @away_quarter1_points]]
#         quarter2_point_comparison = [[@home_team, @home_quarter2_points], [@away_team, @away_quarter2_points]]
#         quarter3_point_comparison = [[@home_team, @home_quarter3_points], [@away_team, @away_quarter3_points]]
#         quarter4_point_comparison = [[@home_team, @home_quarter4_points], [@away_team, @away_quarter4_points]]

#         #compare quarterly scores and assign variable to team with highest score
#         @winner_qart1 = quarter1_point_comparison.max {|a,b| a[1] <=> b[1] }
#         @winner_qart2 = quarter2_point_comparison.max {|a,b| a[1] <=> b[1] }
#         @winner_qart3 = quarter3_point_comparison.max {|a,b| a[1] <=> b[1] }
#         @winner_qart4 = quarter4_point_comparison.max {|a,b| a[1] <=> b[1] }


#         @game = Game.all[1]
#           # if(@game.questions == [])
#           #   false
#           # else
#             # binding.pry
#             quest_7 = @game.questions[7]
#             quest_7.correct_answer = @winner_qart1[0]
#             quest_7.save
#             quest_8 = @game.questions[8]
#             quest_8.correct_answer = @winner_qart2[0]
#             quest_8.save
#             quest_9 = @game.questions[9]
#             quest_9.correct_answer = @winner_qart3[0]
#             quest_9.save
#             quest_10 = @game.questions[10]
#             quest_10.correct_answer = @winner_qart4[0]
#             quest_10.save
#           # end

#           if(@game.questions == [])
#             false
#           else
#             wags = quest_7.wagers
#             wags.each do |wager|
#               if wager.response == quest_7.correct_answer
#                 wager.update_attributes(
#                 result: "true"
#               )
#               elsif wager.response != quest_7.correct_answer
#                 wager.update_attributes(
#                 result: "false"
#               )
#               end
#             end
#           end

#           if(@game.questions == [])
#             false
#           else
#             wags = quest_8.wagers
#             wags.each do |wager|
#               if wager.response == quest_8.correct_answer
#                 wager.update_attributes(
#                 result: "true"
#               )
#               elsif wager.response != quest_8.correct_answer
#                 wager.update_attributes(
#                 result: "false"
#               )
#               end
#             end
#           end

#           if(@game.questions == [])
#             false
#           else
#             wags = quest_9.wagers
#             wags.each do |wager|
#               if wager.response == quest_9.correct_answer
#                 wager.update_attributes(
#                 result: "true"
#               )
#               elsif wager.response != quest_9.correct_answer
#                 wager.update_attributes(
#                 result: "false"
#               )
#               end
#             end
#           end

#           if(@game.questions == [])
#             false
#           else
#             wags = quest_10.wagers
#             wags.each do |wager|
#               if wager.response == quest_10.correct_answer
#                 wager.update_attributes(
#                 result: "true"
#               )
#               elsif wager.response != quest_10.correct_answer
#                 wager.update_attributes(
#                 result: "false"
#               )
#               end
#             end
#           end




#         @all_users = User.all
#         @all_users.each do |user|
#           user.wagers.each do |wager|
#             unless wager.status == "completed"

#               if wager.status == "active" && wager.result == "true"
#                   user.bank.total_point_amount = user.bank.total_point_amount + wager.point_amount
#                   user.bank.balance = user.bank.balance + (wager.point_amount * 2)
#                   recruit_range = (5000..25000)
#                   student_range = (25001..75000)
#                   heisman_range = (75001..150000)
#                   rookie_range = (150001..300000)
#                   pro_range = (3000001..500000)
#                   all_pro_range = (500001..100000)
#                   fame_range = (100001..200000)
#                     if recruit_range.include?(user.bank.total_point_amount)
#                       user.bank.rank = "Top-Recruit"
#                       user.bank.save
#                     elsif student_range.include?(user.bank.total_point_amount)
#                       user.bank.rank = "Student-Athlete"
#                       user.bank.save
#                     elsif heisman_range.include?(user.bank.total_point_amount)
#                       user.bank.rank = "Heisman"
#                       user.bank.save
#                     elsif rookie_range.include?(user.bank.total_point_amount)
#                       user.bank.rank = "Rookie"
#                       user.bank.save
#                     elsif pro_range.include?(user.bank.total_point_amount)
#                       user.bank.rank = "Pro"
#                       user.bank.save
#                     elsif all_pro_range.include?(user.bank.total_point_amount)
#                       user.bank.rank = "All-Pro"
#                       user.bank.save
#                     elsif fame_range.include?(user.bank.total_point_amount)
#                       user.bank.rank = "Hall of Fame"
#                       user.bank.save
#                     end
#                   user.bank.save

#               elsif wager.result == "false"
#                   nil
#               end
#               wager.status = "completed"
#               wager.save
#             end

#       end
#     end


# end


# end
