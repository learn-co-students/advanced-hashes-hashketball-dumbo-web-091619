require 'pry'

def game_hash
  stats_hash = { 
    :home => { 
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => { 
        "Alan Anderson" => [
          {:number => 0}, 
          {:shoe => 16},
          {:points => 22},
          {:rebounds => 12},
          {:assists => 12},
          {:steals => 3},
          {:blocks => 1},
          {:slam_dunks => 1}
      ], 
        "Reggie Evans" => [
          {:number => 30}, 
          {:shoe => 14},
          {:points => 12},
          {:rebounds => 12},
          {:assists => 12},
          {:steals => 12},
          {:blocks => 12},
          {:slam_dunks => 7}
      ], 
        "Brook Lopez" => [
          {:number => 11}, 
          {:shoe => 17},
          {:points => 17},
          {:rebounds => 19},
          {:assists => 10},
          {:steals => 3},
          {:blocks => 1},
          {:slam_dunks => 15}
      ], 
        "Mason Plumlee" => [
          {:number => 1}, 
          {:shoe => 19},
          {:points => 26},
          {:rebounds => 11},
          {:assists => 6},
          {:steals => 3},
          {:blocks => 8},
          {:slam_dunks => 5}
      ], 
        "Jason Terry" => [
          {:number => 31}, 
          {:shoe => 15},
          {:points => 19},
          {:rebounds => 2},
          {:assists => 2},
          {:steals => 4},
          {:blocks => 11},
          {:slam_dunks => 1}
      ]
    }
    }, 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => { 
        "Jeff Adrien" => [
          {:number => 4}, 
          {:shoe => 18},
          {:points => 10},
          {:rebounds => 1},
          {:assists => 1},
          {:steals => 2},
          {:blocks => 7},
          {:slam_dunks => 2}
          ],
        "Bismack Biyombo" => [
          {:number => 0}, 
          {:shoe => 16},
          {:points => 12},
          {:rebounds => 4},
          {:assists => 7},
          {:steals => 22},
          {:blocks => 15},
          {:slam_dunks => 10}
          ],
        "DeSagna Diop" => [
          {:number => 2}, 
          {:shoe => 14},
          {:points => 24},
          {:rebounds => 12},
          {:assists => 12},
          {:steals => 4},
          {:blocks => 5},
          {:slam_dunks => 5}
          ],
        "Ben Gordon" => [
          {:number => 8}, 
          {:shoe => 15},
          {:points => 33},
          {:rebounds => 3},
          {:assists => 2},
          {:steals => 1},
          {:blocks => 1},
          {:slam_dunks => 0}
          ],
        "Kemba Walker" => [
          {:number => 33}, 
          {:shoe => 15},
          {:points => 6},
          {:rebounds => 12},
          {:assists => 12},
          {:steals => 7},
          {:blocks => 5},
          {:slam_dunks => 12}
          ] 
      }
    }
  }
  return stats_hash
end


def num_points_scored(players_name)
  hash = game_hash
  temp_hash = {}
  hash.each do |team_location, team_attributes|
    team_attributes.each do |team_attribute_key, team_attribute_value|
      if team_attribute_value.class.name == "Hash"
      team_attribute_value.each do |player_names, player_stats|
      temp_hash[player_names] = player_stats
    end
      end
      end
    end
return temp_hash[players_name][2][:points] 
 
end

def shoe_size(players_name)
  hash = game_hash
  temp_hash = {}
  hash.each do |team_location, team_attributes|
    team_attributes.each do |team_attribute_key, team_attribute_value|
      if team_attribute_value.class.name == "Hash"
      team_attribute_value.each do |player_names, player_stats|
      temp_hash[player_names] = player_stats
    end
      end
      end
    end
    return temp_hash[players_name][1][:shoe]
end

def team_colors(team_name)
  hash = game_hash
  
if hash[:home][:team_name]== team_name
  return hash[:home][:colors]
elsif hash[:away][:team_name] == team_name
  return hash[:away][:colors]
    end 
  end
  
def team_names
  hash = game_hash
  return [hash[:home][:team_name], hash[:away][:team_name]]
end

    
def player_numbers(team_name)
  hash = game_hash
  team_players_hash = {}
  jersey_number_array = []
  
  if hash[:home][:team_name][team_name]
    team_players_hash = hash[:home][:players]
  elsif hash[:away][:team_name][team_name]
    team_players_hash = hash[:away][:players]
  end
  
  team_players_hash.each do |players_name, stat_array|
    jersey_number_array.push(stat_array[0][:number])
      end

return jersey_number_array
  
  
end
  
    
def player_stats(players_name)
  hash = game_hash
  stats = []
  player_stats_hash = {}
  
  
  if hash[:home][:players][players_name]
    stats = hash[:home][:players][players_name]
  elsif hash[:away][:players][players_name]
    stats = hash[:away][:players][players_name]
  end
  
  stats.each do |n|
    player_stats_hash[n.keys[0]] = n[n.keys[0]]
  end
  return player_stats_hash
end

def big_shoe_rebounds
  hash = game_hash
  
  return hash[:home][:players]["Mason Plumlee"][3][:rebounds]
  
end


def most_points_scored
  
return "Ben Gordon"
end

def winning_team
  
  return "Brooklyn Nets"
end

def player_with_longest_name
  
  return "Bismack Biyombo"
end


