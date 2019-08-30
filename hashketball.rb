# Write your code here!
require "pry"

def game_hash
game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => %w(Black White),
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
    :colors => %w(Turquoise Purple),
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
  return game_hash
end


def num_points_scored(name)
  hash = game_hash
  hash.each do |base, info|
    info.each do |player, stats|
      if stats.include?(name)
        return hash[base][player][name][:points]
      end
    end
  end
end

def shoe_size(name)
  hash = game_hash
  hash.each do |base, info|
    info.each do |player, stats|
      if stats.include?(name)
        return hash[base][player][name][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  colors_array = []
  hash = game_hash
  hash.each do |base, info|
    if info[:team_name].include?(team_name)
      info[:colors].each do |color|
        colors_array.push(color)
      end
    end
  end
  colors_array
end

def team_names
  hash = game_hash
  names_array = []
  hash.each do |base, info|
    names_array.push(info[:team_name])
  end
  names_array
end

def player_numbers(team_name)
  hash = game_hash
  numbers_array = []
  hash.each do |base, info|
    if info[:team_name].include?(team_name)
      info[:players].each do |player, stats|
        numbers_array.push(stats[:number])
      end
    end
  end
  numbers_array
end

def player_stats(name)
  hash = game_hash
  hash.each do |base, info|
    info.each do |player, stats|
      if stats.include?(name)
        return hash[base][player][name]
      end
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
  big_shoe = 0
  big_shoe_player = ""
  hash.each do |base, info|
    hash[base][:players].each do |player, stats|
      if stats[:shoe] > big_shoe
        big_shoe = stats[:shoe]
        big_shoe_player = player
      end
    end
    return hash[base][:players][big_shoe_player][:rebounds]
  end
end



def most_points_scored
  hash = game_hash
  top_scoring_player = ""
  most_points = 0
  hash.each do |base, info|
    hash[base][:players].each do |player, stats|
      points = stats[:points]
      if points > most_points
        most_points = points
        top_scoring_player = player
      end
    end
  end
  return top_scoring_player
end

def winning_team
  hash = game_hash
  home_points = 0
  away_points = 0
  hash[:home][:players].each do |player, stats|
    home_points += stats[:points]
  end
    hash[:away][:players].each do |player, stats|
    away_points += stats[:points]
  end
  winner = home_points > away_points ? hash[:home][:team_name] : hash[:away][:team_name]
  return winner
end

def player_with_longest_name
  longest_length = 0
  longest_name = ""
  hash = game_hash
  hash.each do |base, info|
    hash[base][:players].each do |name, stats|
      if name.length > longest_length
        longest_length = name.length
        longest_name = name
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  long_name = player_with_longest_name
  most_steals = 0
  steals_a_ton = ""
  hash = game_hash
  hash.each do |base, info|
    hash[base][:players].each do |name, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        steals_a_ton = name
      end
    end
  end
  steals_a_ton == long_name ? true : false
end
