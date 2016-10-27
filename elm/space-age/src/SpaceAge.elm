module SpaceAge exposing (..)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


type alias OrbitalPeriod =
    Float


type alias SolarAge =
    Float


earthSeconds : Float
earthSeconds =
    31557600


getRatio : Planet -> OrbitalPeriod
getRatio planet =
    case planet of
        Mercury ->
            0.2408467

        Venus ->
            0.61519726

        Earth ->
            1

        Mars ->
            1.8808158

        Jupiter ->
            11.862615

        Saturn ->
            29.447498

        Uranus ->
            84.016846

        Neptune ->
            164.79132


ageOn : Planet -> Float -> SolarAge
ageOn planet secondsAge =
    secondsAge / (earthSeconds * getRatio planet)