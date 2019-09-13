require "pry"

def game_hash
  boxscore = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        {player_name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        {player_name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        {player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        {player_name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {player_name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        {player_name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
        {player_name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        {player_name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        {player_name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
        ]
    }
  }
  boxscore
end

def num_points_scored (playersname)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |item|
          if item[:player_name] == playersname 
            return item[:points]
          end
        end
      end
    end
  end
end

def shoe_size (playersname)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |item|
          if item[:player_name] == playersname 
            return item[:shoe]
          end
        end
      end
    end
  end
end

def team_colors (teamname)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == teamname
      return team_data[:colors]
    end
  end
end

def team_names
  team_array = []
  game_hash.each do |location, team_data|
    team_array << team_data[:team_name]
  end
  team_array
end

def player_numbers (teamname)
  num_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == teamname
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |item|
            num_array << item[:number]
          end
        end
      end
    end
  end
  num_array
end

def player_stats (playername)
  stats = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |item|
          if item[:player_name] == playername
            stats = item
          end
        end
      end
    end
  end
  stats.delete(:player_name)
  stats
end

def big_shoe_rebounds
  size = 0
  reb = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |item|
          if item[:shoe] > size
            size = item[:shoe]
            reb = item[:rebounds]
          end
        end
      end
    end
  end
  reb
end
            
def most_points_scored
  points = 0
  name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |item|
          if item[:points] > points
            points = item[:points]
            name = item[:player_name]
          end
        end
      end
    end
  end
  name
end

def winning_team
  bk_points = 0
  ch_points = 0
  team = ""
  game_hash.each do |location, team_data|
    if team_data[:team_name] == "Brooklyn Nets"
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |item|
            bk_points += item[:points]
          end
        end
      end
    end
  end
  game_hash.each do |location, team_data|
    if team_data[:team_name] == "Charlotte Hornets"
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |item|
            ch_points += item[:points]
          end
        end
      end
    end
  end
  if bk_points > ch_points
    team = "Brooklyn Nets" else team = "Charlotte Hornets"
  end
  team
end

def player_with_longest_name
  long_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |item|
          if item[:player_name].length > long_name.length
            long_name = item[:player_name]
          end
        end
      end
    end
  end
  long_name
end

def long_name_steals_a_ton?
  num_steals = 0
  p_steals = ""
  p_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |item|
          if item[:player_name].length > p_name.length
            p_name = item[:player_name]
          end
        end
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |item|
          if item[:steals] > num_steals
            p_steals = item[:player_name]
            num_steals = item[:steals]
          end
        end
      end
    end
  end
  p_steals == p_name
end


