require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  
  player_score = 0
  away_team_players = game_hash[:away][:players].keys
  home_team_players = game_hash[:home][:players].keys
  
  if away_team_players.detect { |n| n == name } != nil
    player_score = game_hash[:away][:players][name][:points]
    
  else if home_team_players.detect { |n| n == name } != nil
    player_score = game_hash[:home][:players][name][:points]
  else 
    player_score = "This player is not in the game."
  end 
end
 player_score
end 
  
def shoe_size(name)
  
  shoe = 0
  away_team_players = game_hash[:away][:players].keys
  home_team_players = game_hash[:home][:players].keys
  
  if away_team_players.detect { |n| n == name } != nil
    shoe = game_hash[:away][:players][name][:shoe]
    
  else if home_team_players.detect { |n| n == name } != nil
    shoe = game_hash[:home][:players][name][:shoe]
  else 
    shoe = "This player is not in the game."
  end 
end
 shoe
end 

def team_colors(team_name)
  away_colors = game_hash[:away][:colors]
  home_colors = game_hash[:home][:colors]
  
  if game_hash[:away][:team_name] == team_name
    p away_colors
  else if game_hash[:home][:team_name] == team_name
    p home_colors
  else "That team is not currently playing."
  
end
end
end 

def team_names
  team_array = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
  team_array
end 

def player_numbers(team_name)
  
  all_numbers = []
  away_team_players = game_hash[:away][:players].keys
  home_team_players = game_hash[:home][:players].keys
  
  if game_hash[:away][:team_name] == team_name
    away_team_players.each { |name|
      all_numbers.push(game_hash[:away][:players][name][:number])
    }
  else if game_hash[:home][:team_name] == team_name
    home_team_players.each { |name|
      all_numbers.push(game_hash[:home][:players][name][:number])
    }
  else all_numbers = "That team is not currently playing."
    
  end
end
all_numbers
end 
  

def player_stats(name)
  
  player_hash = {}
  
  away_team_players = game_hash[:away][:players].keys
  home_team_players = game_hash[:home][:players].keys
  
  if away_team_players.detect { |n| n == name } != nil
    player_hash = game_hash[:away][:players][name]
    
  else if home_team_players.detect { |n| n == name } != nil
    player_hash = game_hash[:home][:players][name]
    
  else 
    player_score = "This player is not in the game."
  end 
end
player_hash
end

def big_shoe_rebounds

  large_shoe_fellas = []
  large_shoe_sizes = [0]
  team_of_big_shoe_fella = []

  away_team_players = game_hash[:away][:players].keys
  home_team_players = game_hash[:home][:players].keys
  all_players = home_team_players|away_team_players
  
  i = 0
  while all_players.length > i do 
    if game_hash[:home][:players][all_players[i]] != nil && game_hash[:home][:players][all_players[i]][:shoe] > large_shoe_sizes.max
      
      large_shoe_sizes.push(game_hash[:home][:players][all_players[i]][:shoe])
      
      large_shoe_fellas.push(all_players[i])
      
      team_of_big_shoe_fella.push(:home)
      
      i += 1 
      
    else if game_hash[:away][:players][all_players[i]] != nil && game_hash[:away][:players][all_players[i]][:shoe] > large_shoe_sizes.max
      
      large_shoe_sizes.push(game_hash[:away][:players][all_players[i]][:shoe])
      
      large_shoe_fellas.push(all_players[i])
      
      team_of_big_shoe_fella.push(:away)
      
      i += 1 
      
    else 
      i += 1

   end 
  end
 end
 
     
     p game_hash[team_of_big_shoe_fella.last][:players][large_shoe_fellas.last][:rebounds]
 

end 

def most_points_scored
  
  high_scoring_fellas = []
  high_scores = [0]
  team_of_high_score_fella = []
  

  away_team_players = game_hash[:away][:players].keys
  home_team_players = game_hash[:home][:players].keys
  all_players = home_team_players|away_team_players

  i = 0
  while all_players.length > i do 
    if game_hash[:home][:players][all_players[i]] != nil && game_hash[:home][:players][all_players[i]][:points] > high_scores.max
      
      high_scores.push(game_hash[:home][:players][all_players[i]][:points])
      
      high_scoring_fellas.push(all_players[i])
      
      team_of_high_score_fella.push(:home)
      
      i += 1 
      
    else if game_hash[:away][:players][all_players[i]] != nil && game_hash[:away][:players][all_players[i]][:points] > high_scores.max
      
      high_scores.push(game_hash[:away][:players][all_players[i]][:points])
      
      high_scoring_fellas.push(all_players[i])
      
      team_of_high_score_fella.push(:away)
      
      i += 1 
      
    else 
      i += 1
    end
  end 
end
 high_scoring_fellas.last
end

def winning_team
  
  home_score_array = []
  away_score_array = []
  
  away_team_players = game_hash[:away][:players].keys
  home_team_players = game_hash[:home][:players].keys
  all_players = home_team_players|away_team_players
  
      home_team_players.each { |name|
        home_score_array.push(game_hash[:home][:players][name][:points])
      }
     
      away_team_players.each { |name|
        away_score_array.push(game_hash[:away][:players][name][:points])
      }
  

 home_score = home_score_array.reduce(0) { |n,t| n + t } 
 away_score = away_score_array.reduce(0) { |n,t| n + t } 
 if home_score > away_score
   game_hash[:home][:team_name]
 else 
   game_hash[:away][:team_name]
end 
end




def player_with_longest_name

  away_team_players = game_hash[:away][:players].keys
  home_team_players = game_hash[:home][:players].keys
  all_players = home_team_players|away_team_players
  
  sorted_player_name_length = all_players.sort_by{ |name| name.length }
  
  longest_name = sorted_player_name_length.last 
  
  longest_name
  
end





def long_name_steals_a_ton?
  
  away_team_players = game_hash[:away][:players].keys
  home_team_players = game_hash[:home][:players].keys
  all_players = home_team_players|away_team_players
  
  long_name_steals = 0
  
  if game_hash[:away][:players][player_with_longest_name] != nil 
    
    long_name_steals = game_hash[:away][:players][player_with_longest_name][:steals]
  else 
    long_name_steals = game_hash[:home][:players][player_with_longest_name][:steals]
  end 
    # this part is good
  
  all_steals_count = []  
  
  v = 0 
  while v < all_players.length do 
    
    if game_hash[:home][:players][all_players[v]] != nil
      
      all_steals_count.push(game_hash[:home][:players][all_players[v]][:steals])
      v += 1 
      
    else if game_hash[:away][:players][all_players[v]] != nil
      
    all_steals_count.push(game_hash[:away][:players][all_players[v]][:steals])
      v += 1 
    else 
      v += 1
    end 
  end 
end
  if long_name_steals == all_steals_count.max
    true 
  else 
    false 
  end 
end 

  
  
  
  
  
  
  
  
  
  
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

good_practices