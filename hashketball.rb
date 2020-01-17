require 'pry'

def game_hash 
  {
    :away => { :team_name => "Charlotte Hornets",
               :colors => ["Turquoise", "Purple"],
               :players => [
                 {:player_name => "Jeff Adrien",
                  :number => 4, 
                  :shoe => 18, 
                  :points => 10, 
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks => 7,
                  :slam_dunks => 2,
                  },
                  {:player_name => "Bismack Biyombo",
                  :number => 0, 
                  :shoe => 16, 
                  :points => 12, 
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 22,
                  :blocks => 15,
                  :slam_dunks => 10,
                  },
                  {:player_name => "DeSagna Diop",
                  :number => 2, 
                  :shoe => 14, 
                  :points => 24, 
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5,
                  },
                  {:player_name => "Ben Gordon",
                  :number => 8, 
                  :shoe => 15, 
                  :points => 33, 
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0,
                  },
                  {:player_name => "Kemba Walker",
                  :number => 33, 
                  :shoe => 15, 
                  :points => 6, 
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 7,
                  :blocks => 5,
                  :slam_dunks => 12,
                  }
                ]
             },
    :home => { :team_name => "Brooklyn Nets",
               :colors => ["Black", "White"],
               :players => [
                 {:player_name => "Alan Anderson",
                  :number => 0, 
                  :shoe => 16, 
                  :points => 22, 
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1,
                  },
                  {:player_name => "Reggie Evans",
                  :number => 30, 
                  :shoe => 14, 
                  :points => 12, 
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7,
                  },
                  {:player_name => "Brook Lopez",
                  :number => 11, 
                  :shoe => 17, 
                  :points => 17, 
                  :rebounds => 19,
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15,
                  },
                  {:player_name => "Mason Plumlee",
                  :number => 1, 
                  :shoe => 19, 
                  :points => 26, 
                  :rebounds => 11,
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5,
                  },
                  {:player_name => "Jason Terry",
                  :number => 31, 
                  :shoe => 15, 
                  :points => 19, 
                  :rebounds => 2,
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1,
                  }
                  ]
                  }
              }
end

def num_points_scored(players_name)
  #return number of points for player passed in
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player| 
          if player [:player_name] == players_name
            return player[:points]
          end
        end
       end
    end
  end
end

def shoe_size(players_name)
  #returns shoe size for a certain player
   game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player| 
          if player [:player_name] == players_name
            return player[:shoe]
          end
        end
       end
    end
  end
end

def team_colors(team_name)
  #returns an array of team colors for a certain team
  game_hash.each do |place, team| 
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  #returns the team names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(team_name) 
  #returns a list of jersery numbers for a team
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name 
      team.each do |attributes, data| 
      if attributes == :players
        data.each do |player|
          nums << player[:number]
        end
      end
      end
    end
  end
  nums
end

def player_stats(players_name) 
  #returns a hash of a player's stats
  stats = {} 
  game_hash.each do |place, team| 
    team.each do |attributes, data| 
      if attributes == :players 
        data.each do |player| 
          if player[:player_name] == players_name 
            stats = player.delete_if do |k, v| 
              k == :player_name
            end
          end
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  #returns the number of rebounds for the player with the largest shoe
  big_shoe = 0
  rebounds = 0
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

#Bonus

def iterate_through_players_for(name, stat)
  game_hash.each do |place, team|
    team[:players].each do |player|
      return player[stat] if player[:player_name] == name
    end
  end
end

def player_with_most_of(stat)
  player_name = nil
  amount_of_stat = 0

  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[stat].is_a? String
        if player[stat].length > amount_of_stat
          amount_of_stat = player[stat].length
          player_name = player[:player_name]
        end
      elsif player[stat] > amount_of_stat
        amount_of_stat = player[stat]
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

def most_points_scored
  player_with_most_of(:points)
end

