# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# https://api.nhle.com/stats/rest/en/skater/summary?isAggregate=false&isGame=false&sort=[{"property":"points","direction":"DESC"},{"property":"goals","direction":"DESC"},{"property":"assists","direction":"DESC"},{"property":"playerId","direction":"ASC"}]&start=0&limit=50&factCayenneExp=gamesPlayed>=1&cayenneExp=gameTypeId=2 and seasonId<=20222023 and seasonId>=20222023

require 'uri'
require 'net/http'
require 'json'

def generate_data(data)
  season = Season.find_or_create_by(years: "2022-2023")

  data["data"].each do |player_data|
    player = Player.create(
      lastName: player_data["lastName"],
      skaterFullName: player_data["skaterFullName"],
      positionCode: player_data["positionCode"],
      shootsCatches: player_data["shootsCatches"]
    )
    PlayerPerformance.create(
      player:,
      season:,
      evGoals: player_data["evGoals"],
      evPoints: player_data["evPoints"],
      faceoffWinPct: player_data["faceoffWinPct"],
      gameWinningGoals: player_data["gameWinningGoals"],
      gamesPlayed: player_data["gamesPlayed"],
      goals: player_data["goals"],
      otGoals: player_data["otGoals"],
      penaltyMinutes: player_data["penaltyMinutes"],
      plusMinus: player_data["plusMinus"],
      points: player_data["points"],
      pointsPerGame: player_data["pointsPerGame"],
      ppGoals: player_data["ppGoals"],
      ppPoints: player_data["ppPoints"],
      shGoals: player_data["shGoals"],
      shootingPct: player_data["shootingPct"],
      shots: player_data["shots"],
      timeOnIcePerGame: player_data["timeOnIcePerGame"]
    )
    teams = player_data["teamAbbrevs"].split(",").map(&:strip)

    teams.each do |team_name|
      team = Team.find_or_create_by(teamAbbrevs: team_name)
      TeamPlayer.create(team:, player:)
    end
  end

  puts "Created #{Season.count} Seasons"
  puts "Created #{Team.count} Teams"
  puts "Created #{Player.count} Players"
end

PlayerPerformance.delete_all
Season.delete_all
TeamPlayer.delete_all
Team.delete_all
Player.delete_all

uri = URI('https://api.nhle.com/stats/rest/en/skater/summary?isAggregate=false&isGame=false&sort=[{"property":"points","direction":"DESC"},{"property":"goals","direction":"DESC"},{"property":"assists","direction":"DESC"},{"property":"playerId","direction":"ASC"}]&start=0&limit=100&factCayenneExp=gamesPlayed>=1&cayenneExp=gameTypeId=2 and seasonId<=20222023 and seasonId>=20222023')
res = Net::HTTP.get_response(uri)
data = JSON.parse(res.body)
generate_data(data)

uri = URI('https://api.nhle.com/stats/rest/en/skater/summary?isAggregate=false&isGame=false&sort=[{"property":"points","direction":"DESC"},{"property":"goals","direction":"DESC"},{"property":"assists","direction":"DESC"},{"property":"playerId","direction":"ASC"}]&start=100&limit=100&factCayenneExp=gamesPlayed>=1&cayenneExp=gameTypeId=2 and seasonId<=20222023 and seasonId>=20222023')
res = Net::HTTP.get_response(uri)
data = JSON.parse(res.body)
generate_data(data)