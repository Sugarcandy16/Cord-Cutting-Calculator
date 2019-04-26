# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
channel_name = %w[
A&E
ABC
AbcNewslive
ACCESPNNetwork
AccuWeather
AMC
AMCPremiere
AnimalPlanet
AUDIENCE
AxsTV
BasesLoaded
BBCAmerica
BBCWorldNews
BET
BloombergTelevision
BoomErang
BRAVO
BTN
CartoonNetwork
CBS
CbsSportsNetwork
CBSN
Cheddar
CheddarBusiness
CheddarNews
Cinemax
CN
CNBC
CNBCWorld
CNBS
CNN
CNNInternational
CollegeExtra
ComedyCentralStand-Up
ComedyCentral
Comet
ComicConHQ
COZI
CuriosityStream
CW
DailyBurn
Discovery
DisneyChannel
DisneyJunior
DocComTV
E!
EpicDrive-In
EPIX
ESPN
ESPNGoalLine
ESPNNetwork
ESPNU
ESPN2
ESPN3
ESPNEWS
FoodNetwork
FOX
FOXBusiness
FOXNews
FOXSoccerPlus
FOXSports
FOXBusiness
Freeform
FS1
FS2
Fuse
FX
FXM
FXX
GOLF
HallMark
HBO
HBONow 
HBOFamily
HBOLatino
HGTV
History
HistoryVault
HLN
ID
IFC
IndiePixUnlimited
InvestigationDiscovery
LifeTime
LocalNow
LosAngelesFootballClub
MLBNetwork
Motortrend
MSNBC
MTV
Mubi 
MyNetworkTV
MYTV
NationalGeographic
NationalGeographicWild
NBALeaguePass
NBATV
NBC
NBCSports
NBCSN
NECN
NESN
Newsy
NFLNetwork
NickJr.
OlympicChannel
OrlandoCity
Ovation
OXYGEN
ParamountNetwork
PBSKids
PBSMasterpiece
POP
Reelz
REVOLT
S
S/N
SeattleSoundersFC
Shortlist
Showtime
Shudder
SmithsonianChannel
SmithsonianEarth
SNY
Sports
SportsIllustratedTV
SportsNetwork
Stadium
StartTV
STARZ
SundanceNow
SundanceTV
Syfy
Tastemade
tbs
TCM
Telemundo
TennisChannel
TLC
TNT
TruTV
TrvlChannel
TYT
UniversalKids
Universo
USA
Viceland
WETV
XD
YES
YouTubeOriginals
VH1
]
channel_name.each do |c|
    Channel.create(name: c)
end



package_name = %w[
Netflix
AmazonPrime
Hulu
YouTubeTV
SlingTV
SlingOrange
SlingBlue
SlingOrange&Blue
DirecTVNow
STARZ
SHOWTIME
CBS
HBONow
Philo
FuboTV
VerizonFios
]
package_name.each do |c|
    Package.create(name: c)
end 