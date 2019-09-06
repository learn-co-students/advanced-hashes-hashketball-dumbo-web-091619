require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
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
          :rebounds => 11,
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
        "Bismack Biyombo" => {
          :number => 0, 
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
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
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

#def good_practices
#  game_hash.each do 
#    |location, team_data|
#    binding.pry
#    team_data.each do 
#|attribute, data|
#   binding.pry
#   data.each do |data_item|
#          binding.pry
#      end
#    end
#  end
#end
#good_practices
#end

def num_points_scored(player)
  player_stats = player_stats(player)
  player_stats[:points]
end


def shoe_size(player)
player_stats = player_stats(player)
player_stats[:shoe]
end
  
def team_colors(team)
game_hash.reduce ({}) do |memo, (key, value)| 
      a = game_hash[key]
      color = a[:colors]
        name = a[:team_name]
      return color if name == team
      end
    end
    
def team_names
  names_array = []
  game_hash.reduce ({}) do |memo, (key, value)|
    a = game_hash[key]
      color = a[:colors]
        names_array << a[:team_name]
    end
      return names_array
  end

def player_numbers(team)
  jersey_number = []
  game_hash.reduce ({}) do |memo, (key, value)| 
    a = game_hash[key]
    game_hash.reduce ({}) do |memo, (key, value)|
    if a[:team_name] == team
      a[:players].reduce({}) do |memo, (key, value)|
        jersey_number << a[:players][key][:number]
          end
        end
      end
    end
    return jersey_number.uniq
  end

def player_stats(player)
  game_hash.reduce ({}) do |memo, (key, value)|
    a = game_hash[key]
    a[:players].reduce ({}) do |memo, (key, value)|
      return value if key == player
    end
  end
end

def big_shoe_rebounds
  big_shoe = 0 
  rebounds = 0 
  game_hash.reduce ({}) do |memo, (key, value)|
    a = game_hash[key]
    a[:players].reduce ({}) do |memo, (key, value)|
      if a[:players][key][:shoe] > big_shoe
        big_shoe = a[:players][key][:shoe]
        rebounds = a[:players][key][:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  most_points = 0 
  most_points_name = ""
  game_hash.reduce ({}) do |memo, (key, value)|
    a = game_hash[key]
    a[:players].reduce({}) do |memo, (key, value)|
      name = key
      if a[:players][key][:points] > most_points
        most_points = a[:players][key][:points]
        most_points_name = name
      end
    end
  end
return most_points_name  
end

def winning_team
  winner_points = 0 
  winner_name = ""
  game_hash.reduce ({}) do |memo, (key, value)|
    a = game_hash[key]
    current_points = 0 
    name = a[:team_name]
    a[:players].reduce({}) do |memo, (key, value)|
      current_points += a[:players][key][:points]
    end
    if current_points > winner_points
      winner_points = current_points
      winner_name = name
    end
  end
  return winner_name
end

def player_with_longest_name
longest_name_length = 0 
longest_name = ""
  game_hash.reduce ({}) do |memo, (key, value)|
    a = game_hash[key]
    a[:players].reduce({}) do |memo, (key, value)|
      if key.length > longest_name_length
        longest_name_length = key.length
        longest_name = key
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
 list_names = [] 
      most_steals = [] 
      game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
          list_names.push(name)
          most_steals.push(stats[:steals])
        end 
      end 
      game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
          if name == list_names.max_by(&:length) && stats[:steals] ==  most_steals.max
            return true 
          end 
        end 
      end
    end