def game_hash
  { :home => {
      :team_name => "Brooklyn Nets" ,
      :colors => ["Black", "White"] ,
      :players => [
        { :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        { :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        { :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        { :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        { :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
  
    :away => {
      :team_name => "Charlotte Hornets" ,
      :colors => ["Turquoise", "Purple"],
      :players => [
        { :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        { :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        { :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        { :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        { :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(player_name)
  player_point_totals = {}
  
  
  game_hash[:home][:players].each do |player| 
    name = player[:player_name]
    player_points = player[:points]   
    player_point_totals[name] = player_points
  end
  
  game_hash[:away][:players].each do |player| 
    name = player[:player_name]
    player_points = player[:points]   
    player_point_totals[name] = player_points
  end
  player_point_totals[player_name]
end 

def shoe_size(player_name)
  player_shoe_size = {}
  
  
  game_hash[:home][:players].each do |player| 
    name = player[:player_name]
    player_shoe = player[:shoe]   
    player_shoe_size[name] = player_shoe
  end
  
  game_hash[:away][:players].each do |player| 
    name = player[:player_name]
    player_shoe = player[:shoe]   
    player_shoe_size[name] = player_shoe
  end
  player_shoe_size[player_name]
  
end 

def team_colors(team_name)
  color_hash = {}
  
  game_hash.each do |pair|
    color_hash[pair[1][:team_name]] = pair[1][:colors]
  end
  
  color_hash[team_name]
end

def team_names
  team_name_array = []
  
  game_hash.each do |pair|
    team_name_array << pair[1][:team_name]
  end 
  team_name_array
end

def player_numbers(team_name)
  player_number_hash = {
    "Brooklyn Nets" => [],
    "Charlotte Hornets" => []
  }
  
  game_hash[:home][:players].each do |player| 
    team = game_hash[:home][:team_name]
    player_number = player[:number]   
    player_number_hash[team] << player_number
  end
  
  game_hash[:away][:players].each do |player| 
    team = game_hash[:away][:team_name]
    player_number = player[:number]   
    player_number_hash[team] << player_number
  end
  
  player_number_hash[team_name]
  
end 

def player_stats(stats_name)
  player_stats_hash = {}
  
  game_hash[:home][:players].each do |player|
    name = player[:player_name]
    player.delete(:player_name)
    player_stats_hash[name] = player
  end 
  
  game_hash[:away][:players].each do |player|
    name = player[:player_name]
    player.delete(:player_name)
    player_stats_hash[name] = player
  end 
  
  player_stats_hash[stats_name]
end

def player_stat_list
  player_stats_hash = {}
  
  game_hash[:home][:players].each do |player|
    name = player[:player_name]
    player.delete(:player_name)
    player_stats_hash[name] = player
  end 
  
  game_hash[:away][:players].each do |player|
    name = player[:player_name]
    player.delete(:player_name)
    player_stats_hash[name] = player
  end 
  
  player_stats_hash

end

def shoe_size_all
  player_shoe_size = {}
  
  
  game_hash[:home][:players].each do |player| 
    name = player[:player_name]
    player_shoe = player[:shoe]   
    player_shoe_size[name] = player_shoe
  end
  
  game_hash[:away][:players].each do |player| 
    name = player[:player_name]
    player_shoe = player[:shoe]   
    player_shoe_size[name] = player_shoe
  end
  player_shoe_size
  
end

def big_shoe_rebounds
 sorted_shoe_size = shoe_size_all.sort_by{ |player, size| size}
 big_shoe_player = sorted_shoe_size[-1].shift
 
 player_stat_list[big_shoe_player][:rebounds]
end

def most_points_scored

  
  player_score = ""
  high_score = 0
  game_hash.values.each do |team_stats|
    team_stats[:players].each do |player|
      if player[:points] > high_score
        high_score = player[:points] 
        player_score = player[:player_name] 
      end
    end
  end
  player_score
end

def winning_team

  winner = {}
  game_hash.values.each do |team_stats|
    team_score = 0
    team_stats[:players].each do |player|
      team_score += player[:points]
    end
    winner[team_stats[:team_name]] = team_score
  end
  winner.key(winner.values.max) 
end

def player_with_longest_name

  longest_name = []
  game_hash.values.each do |team_stats|
    team_stats[:players].each do |player|
      longest_name << player[:player_name]
    end
  end
longest_name.max_by{|name| name.length}
end

def long_name_steals_a_ton?

 longest_steals = {}
  game_hash.values.each do |team_stats|
    team_stats[:players].each do |player|
      longest_steals[player[:player_name]] = player[:steals]
    end
  end

max_steals = longest_steals.values.max
longest_steals[longest_steals.key(max_steals)] == max_steals

end
