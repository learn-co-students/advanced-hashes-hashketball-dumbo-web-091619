require "pry"
def game_hash
  new_hash = {
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
      },"Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },"Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },"Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },"Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }}
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
      },"Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },"DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },"Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },"Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }}
    }
  }
  return new_hash
end

def num_points_scored(name)
  hash = game_hash
  if hash[:home][:players]["#{name}"]
    return hash[:home][:players]["#{name}"][:points]
  elsif  hash[:away][:players]["#{name}"]
    return hash[:away][:players]["#{name}"][:points]
  end
end

def shoe_size(name)
  hash = game_hash
  if hash[:home][:players]["#{name}"]
    return hash[:home][:players]["#{name}"][:shoe]
  elsif  hash[:away][:players]["#{name}"]
    return hash[:away][:players]["#{name}"][:shoe]
  end
end

def team_colors(team)
  hash=game_hash
  if hash[:home][:team_name]["#{team}"]
    return hash[:home][:colors]
  elsif  hash[:away][:team_name]["#{team}"]
    return hash[:away][:colors]
  end
end

def team_names
  hash=game_hash
  return arr =[hash[:home][:team_name], hash[:away][:team_name]]
end

def player_numbers(team)
  hash=game_hash
  newarr = Array.new
  make_keys1=hash[:home][:players].keys
  make_keys2=hash[:away][:players].keys
  x=0
  if hash[:home][:team_name] == team
    while x<make_keys1.length
      newarr << hash[:home][:players][make_keys1[x]][:number]
      x+=1
    end
  elsif hash[:away][:team_name] == team
    while x<make_keys2.length
      newarr << hash[:away][:players][make_keys2[x]][:number]
      x+=1
    end
  end
 return newarr
end

def player_stats(name)
  hash=game_hash
    x=0
  if hash[:home][:players][name]
    return hash[:home][:players][name]
  else hash[:away][:players][name]
    return hash[:away][:players][name]
  end
end

def big_shoe_rebounds
  hash=game_hash
  newarr=Array.new
  make_keys1=hash[:home][:players].keys
  make_keys2=hash[:away][:players].keys
  x=0
  while x<make_keys1.length
  newarr << hash[:home][:players][make_keys1[x]][:shoe]
  newarr << hash[:away][:players][make_keys2[x]][:shoe]
  x+=1
  end
  big_shoe=newarr.max
  if ourname1=make_keys1.find{|num| hash[:home][:players][num][:shoe]==big_shoe}
  return hash[:home][:players][ourname1][:rebounds]
  elsif ourname2=make_keys2.find{|num| hash[:away][:players][num][:shoe]==big_shoe}
  return hash[:away][:players][ourname2][:rebounds]
  end
end

def most_points_scored
  hash=game_hash
  newarr=Array.new
  make_keys1=hash[:home][:players].keys
  make_keys2=hash[:away][:players].keys
  x=0
  while x<make_keys1.length
    newarr << hash[:home][:players][make_keys1[x]][:points]
    newarr << hash[:away][:players][make_keys2[x]][:points]
    x+=1
  end
  most_points=newarr.max
  if ourname1=make_keys1.find{|num| hash[:home][:players][num][:points]==most_points}
    return ourname1
  elsif  ourname2=make_keys2.find{|num| hash[:away][:players][num][:points]==most_points}
    return ourname2
  end
end

def winning_team
  hash=game_hash
  newarr=0
  newarr2=0
  make_keys1=hash[:home][:players].keys
  make_keys2=hash[:away][:players].keys
  x=0
  while x<make_keys2.length
  newarr += hash[:home][:players][make_keys1[x]][:points]
  newarr2 += hash[:away][:players][make_keys2[x]][:points]
  x+=1
  end
  if newarr>newarr2
    return hash[:home][:team_name]
  elsif newarr2>newarr
    return hash[:away][:team_name]
  end
end

def player_with_longest_name
  hash=game_hash
  newarr2=Array.new
  newarr=hash[:home][:players].keys+hash[:away][:players].keys
  x=0
  while x<newarr.length
    newarr2 << newarr[x].size
  x+=1
  end
  longestname = newarr2.max
  newarr.find{|name| name.size==longestname}
end

def long_name_steals_a_ton?
  hash=game_hash
  longest_name=player_with_longest_name
  newarr=[]
  make_keys1=hash[:home][:players].keys
  make_keys2=hash[:away][:players].keys 
  x=0
  while x<make_keys1.length
    newarr << hash[:home][:players][make_keys1[x]][:steals]
    newarr << hash[:away][:players][make_keys2[x]][:steals]
  x+=1
  end
  moststeal = newarr.max
  if hash[:away][:players][longest_name][:steals]=moststeal
    return true
  else 
    return false
  end
end

















