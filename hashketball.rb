# Write your code here!
def game_hash
  new_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [ 
        {
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      {
        :player_name => "Jason Terry",
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
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
       {
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      {
        :player_name => "Kemba Walker",
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
 new_hash
end

def num_points_scored(player)
  stats = game_hash
  
  result_home = stats[:home][:players]
  result_away = stats[:away][:players]

  result_home.each do |i|
    if i[:player_name] == player
      return i[:points]
    end
  end
  
  result_away.each do |i|
    if i[:player_name] == player
      return i[:points]
    end
  end
end

def shoe_size(player)
  stats = game_hash
  
  result_home = stats[:home][:players]
  result_away = stats[:away][:players]

  result_home.each do |i|
    if i[:player_name] == player
      return i[:shoe]
    end
  end
  
  result_away.each do |i|
    if i[:player_name] == player
      return i[:shoe]
    end
  end
end

def team_colors(team)
  stats = game_hash
  
  if stats[:home][:team_name] == team
    return stats[:home][:colors]
  else
    return stats[:away][:colors]
  end
end

def team_names
  stats = game_hash
  result = []
  
  result.push(stats[:home][:team_name])
  result.push(stats[:away][:team_name])
  
  result
end

def player_numbers(team)
  stats = game_hash
  
  nums = []
  
  result_home = stats[:home][:players]
  result_away = stats[:away][:players]
  
  if stats[:home][:team_name] == team
    result_home.each do |i|
      nums.push(i[:number])
    end
  else  
    result_away.each do |i|
      nums.push(i[:number])
    end
  end
nums
end

def player_stats(player)
    stats = game_hash
  
  result_home = stats[:home][:players]
  result_away = stats[:away][:players]

  result_home.each do |i|
    if i[:player_name] == player
      i.delete(:player_name)
      return i
    end
  end
  
  result_away.each do |i|
    if i[:player_name] == player
      i.delete(:player_name)
      return i
    end
  end
end

def big_shoe_rebounds
  stats = game_hash
  shoe_size = 0
  rebound_num = 0
  
  result_home = stats[:home][:players]
  result_away = stats[:away][:players]
  
  result_home.each do |i|
    if i[:shoe] > shoe_size
      shoe_size = i[:shoe]
      rebound_num = i[:rebounds]
    end
  end
  
  result_away.each do |i|
    if i[:shoe] > shoe_size
      shoe_size = i[:shoe]
      rebound_num = i[:rebounds]
    end
  end
  
  rebound_num
end

def most_points_scored
  stats = game_hash
  
  best_player = nil
  most_points = 0
  
  result_home = stats[:home][:players]
  result_away = stats[:away][:players]
  
  result_home.each do |i|
    if i[:points] > most_points
      most_points = i[:points]
      best_player = i[:player_name]
    end
  end
  
  result_away.each do |i|
    if i[:points] > most_points
      most_points = i[:points]
      best_player = i[:player_name]
    end
  end
  
  best_player
end

def winning_team
  stats = game_hash
  
  winning_team = nil
  home_score = 0
  away_score = 0
  
  result_home = stats[:home][:players]
  result_away = stats[:away][:players]
  
  result_home.each do |i|
    home_score += i[:points]
  end
  
  result_away.each do |i|
    away_score += i[:points]
  end
  
  if home_score > away_score
    winning_team = stats[:home][:team_name]
  else
    winning_team = stats[:away][:team_name]
  end
  
  winning_team
end

def player_with_longest_name
  stats = game_hash
  
  longest_name = nil
  name_length = 0
  
  result_home = stats[:home][:players]
  result_away = stats[:away][:players]
  
  result_home.each do |i|
    if i[:player_name].length > name_length
      name_length = i[:player_name].length
      longest_name = i[:player_name]
    end
  end
  
  result_away.each do |i|
    if i[:player_name].length > name_length
      name_length = i[:player_name].length
      longest_name = i[:player_name]
    end
  end
  
  longest_name
end

def long_name_steals_a_ton?
  stats = game_hash
  longest_name = player_with_longest_name

  most_steals = 0
  player_with_most_steals = nil
  
  result_home = stats[:home][:players]
  result_away = stats[:away][:players]
  
  result_home.each do |i|
    if i[:steals] > most_steals
      most_steals = i[:steals]
      player_with_most_steals = i[:player_name]
    end
  end
  
  result_away.each do |i|
    if i[:steals] > most_steals
      most_steals = i[:steals]
      player_with_most_steals = i[:player_name]
    end
  end
  
  if player_with_most_steals == longest_name
    return true
  else
    return false
  end
end