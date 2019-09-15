# Write your code here!
def game_hash
    hash = {
        :home => {
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            info: {
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
            team_name: "Charlotte Hornets",
            colors: ["Turquoise", "Purple"],
            info: {
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

def num_points_scored(name)
    hash = game_hash
    hash.each do |home_or_abroad, info|
        info.each do |player, data|
            if data.include?(name)
                return hash[home_or_abroad][player][name][:points]
            end
        end
    end
end

def shoe_size(name)
    hash = game_hash
    hash.each do |home_or_abroad, info|
        info.each do |player, data|
            if data.include?(name)
                return hash[home_or_abroad][player][name][:shoe]
            end
        end
    end
end

def team_colors(team)
    hash = game_hash
    hash.each do |home_or_abroad, values|
        if hash[home_or_abroad].values.include?(team)
            values.each do |key, val|
                if key == :colors
                    return val
                end
            end
        end
    end
end

def team_names
    hash = game_hash
    numbers = []
    hash.each do |home_or_abroad, team_names|
        team_names.each do |key, val|
            if key == :team_name
                numbers << val
            end
        end
    end
    numbers
end

def player_numbers(team)
    hash = game_hash
    numbers = []
    hash.each do |home_or_abroad, team_names|
        if hash[home_or_abroad].values.include?(team)
            team_names.each do |team_name, data|
                if data.class == Hash
                    data.each do |player, stats|
                        stats.each do |key, val|
                            if key == :number
                                numbers << val
                            end
                        end
                    end
                end
            end
        end
    end
    numbers
end

def player_stats(name)
        hash = game_hash
        hash.each do |home_or_abroad, team_names|
            team_names.each do |info, values|
                if values.include?(name)
                    return hash[home_or_abroad][info][name] #returns all the info of the player
                end
            end
        end
        teams
end

def big_shoe_rebounds
    hash = game_hash
    player_name = ""
    shoe_size = 0
    hash.each do |home_or_abroad, info|
      info.each do |keys, values|
        if values.class == Hash
          values.each do |player, stats|
              stats.each do |key, val|
                if key == :shoe
                  if val > shoe_size
                    shoe_size = val
                    player_name = player
                  end
                end
              end
            end
          return hash[home_or_abroad][keys][player_name][:rebounds]
        end
      end
    end
  end

def most_points_scored
    hash = game_hash
    highest_point = 0
    highest_scorer = ""
    hash.each do |home_or_abroad, info|
        info.each do |keys, values|
            if values.class == Hash
                values.each do |player, stats|
                    stats.each do |key, val|
                        if key == :points
                            if val > highest_point
                                highest_point = val
                                highest_scorer = player
                            end
                        end
                    end
                end
            end
        end
    end
   highest_scorer
end




