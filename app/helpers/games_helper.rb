module GamesHelper

  def create_pregame_questions
    @game = Game.find(params[:id])
    @g_id = @game.id
    @home_team = @game.home_team
    @away_team = @game.away_team
    @winner = @game.winner

    @q1 = Question.find_by_game_id_and_title(@g_id, "Who will win this game?" ) || Question.create(title: "Who will win this game?",
                    question_1: @home_team,
                    question_2: @away_team,
                    game_id: @g_id,
                    correct_answer: @winner
        )

    @q2 = Question.find_by_game_id_and_title(@g_id, "How many points will #{@home_team} score?" ) || Question.create(title: "How many points will #{@home_team} score?",
                    question_1: "0-6 points",
                    question_2: "7-13 points",
                    question_3: "14-20 points",
                    question_4: "21-29 points",
                    question_5: "30-35 points",
                    question_6: "36+ points",
                    game_id: @g_id
        )

    @q3 = Question.find_by_game_id_and_title(@g_id, "How many points will #{@away_team} score?" ) || Question.create(title: "How many points will #{@away_team} score?",
                    question_1: "0-6 points",
                    question_2: "7-13 points",
                    question_3: "14-20 points",
                    question_4: "21-29 points",
                    question_5: "30-35 points",
                    question_6: "36+ points",
                game_id: @g_id,
    )

    @q4 = Question.find_by_game_id_and_title(@g_id, "How many total team passing yards will #{@home_team} pass for?" ) || Question.create(title: "How many total team passing yards will #{@home_team} pass for?",
                question_1: "0-150 yards",
                question_2: "150-215 yards",
                question_3: "215-300 yards",
                question_4: "300-400 yards",
                question_5: "500+ yards",
                game_id: @g_id
    )

    @q5 = Question.find_by_game_id_and_title(@g_id, "How many total team passing yards will #{@away_team} pass for?" ) || Question.create(title: "How many total team passing yards will #{@away_team} pass for?",
                question_1: "0-150 yards",
                question_2: "150-215 yards",
                question_3: "215-300 yards",
                question_4: "300-400 yards",
                question_5: "500+ yards",
                game_id: @g_id
    )

    @q6 = Question.find_by_game_id_and_title(@g_id, "How many total team rushing yards will #{@home_team} rush for?" ) || Question.create(title: "How many total team rushing yards will #{@home_team} rush for?",
                question_1: "0-50 yards",
                question_2: "51-75 yards",
                question_3: "76-100 yards",
                question_4: "101-99 yards",
                question_5: "100+ yards",
                game_id: @g_id
    )

    @q7 = Question.find_by_game_id_and_title(@g_id, "How many total team rushing yards will #{@away_team} rush for?" ) || Question.create(title: "How many total team rushing yards will #{@away_team} rush for?",
                question_1: "0-50 yards",
                question_2: "51-75 yards",
                question_3: "76-100 yards",
                question_4: "101-99 yards",
                question_5: "100+ yards",
                game_id: @g_id
    )
    @q11 = Question.find_by_game_id_and_title(@g_id, "Who is going to score more points in the 1st quarter?") || Question.create(title: "Who is going to score more points in the 1st quarter?",
                question_1: @home_team,
                question_2: @away_team,
                game_id: @game.id
    )
    @q8 = Question.find_by_game_id_and_title(@g_id, "Who is going to score more points in the 2nd quarter?") || Question.create(title: "Who is going to score more points in the 2nd quarter?",
                question_1: @home_team,
                question_2: @away_team,
                game_id: @game.id
    )
    @q9 = Question.find_by_game_id_and_title(@g_id, "Who is going to score more points in the 3rd quarter?") || Question.create(title: "Who is going to score more points in the 3rd quarter?",
                question_1: @home_team,
                question_2: @away_team,
                game_id: @game.id
    )
    @q10 = Question.find_by_game_id_and_title(@g_id, "Who is going to score more points in the 4th quarter?") || Question.create(title: "Who is going to score more points in the 4th quarter?",
                question_1: @home_team,
                question_2: @away_team,
                game_id: @game.id
    )
  end
end

