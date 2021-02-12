//
//  Constant.swift
//
//  Created by Darshan Gajera on 2/12/21.

import UIKit
struct GlobalConstants {
    static let APPNAME = "Golf"

    static let spreadSheetID = "1qL9pFKRSkfHA83FaVwXa_PnLoa-HjMYK5WEWSLEnxDs"
    static let SixMenSpreadSheetID = "1gLQxsJpyWmuz4dXquc6qZMyPd78E66g2SB4QkRnlHus"
    static let SevenMenSpreadSheetID = "1_nBRyhVM8kpfdgcYpT6EvcQCwtIpoOChnX9MHT6IGTU"
    static let loginSpreadSheetID = "1jeVaSCO2W8cSyfdiMtSTRC7sx83hEaHAUvT8lfq1v70"
    
    
    static let clientId = "659144441987-sq5jnva8c4tj0rrm6bbv3i5btpaeipdv.apps.googleusercontent.com"

    
    static let APIIDSEX = "MkaPHG7ar48Xos7DnanQ6exYmi7cMwUco"
    static let APIIDSEVEN = "MkaPHG7ar48Xos7DnanQ6exYmi7cMwUco"
    static let APIIDEIGHT = "MGz7CsPyNeJdibb1-uc8qFRYmi7cMwUco"
    
    
    static let SixManSheetName = "6ManPar70"
    static let SevenManSheetName = "7ManPar70"
    static let EightManSheetName = "8ManPar69"
}

enum Storyboard: String {
    case main    = "Main"
    case Calendar    = "WWCalendarTimeSelector"
    func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

enum Color: String {
    case AppColorCode  = "358AA9"
    case SupporterColorCode  = "e9dae7"
    case TransactionFailed  = "ff4e4e"
    case TransactionSuccess  = "00a71c"
    case TransactionPending  = "ffbf00"
    case WhiteDarkMode  = "feffff"
    func color() -> UIColor {
        return UIColor.hexStringToUIColor(hex: self.rawValue)
    }
}


struct UserType {
    static let Host  = "host"
    static let Player  = "player"
}

enum Identifier: String {
    // Main Storyboard
    case ViewController = "ViewController"
    case playerPopup = "PopUpVC"
    case addScorePopup = "AddScoreVC"
    case addScoreError = "AddScoreErrorVC"
    case NoConnection = "NoConnectionVC"
    case setup = "SetupVC"
    case team = "TeamVC"
    case score = "ScoreVC"
    case scoreBoard = "ScoreBoradVC"
    case gameSummary = "GameSummaryVC"
    case ScoreTab = "ScoreTabVC"
    case login = "LoginVC"
    case GLogin = "GoogleLoginVC"
    case EditSetup = "EditSetupVC"
    case HolesHandicap = "HolesHandicapVC"
    
    
//    Tableview Cell
    case basicInfo = "basicInfoCell"
    case EditBasicInfoCell = "EditBasicInfoCell"
    case scoreKeeperCell = "scoreKeeperCell"
    case EditScoreKeeperCell = "EditScoreKeeperCell"
    case PlayerDetail = "PlayerDetail"
    case PlayerDetailCell = "PlayerDetailCell"
    case EditPlayerDetailCell = "EditPlayerDetailCell"
    case HeaderCell = "HeaderCell"
    case ButtonHeaderCell = "ButtonHeaderCell"
    case HoleHeaderCell = "HoleHeaderCell"
    case ScoreCardCell = "ScoreCardCell"
    case ExpandedHoleCell = "ExpandedHoleCell"
    case ExpandedSummaryCell = "ExpandedSummaryCell"
    case GameSummaryCell = "GameSummaryCell"
    case GameSummaryHeaderCell = "GameSummaryHeaderCell"
    case EditExpandedHoleCell = "EditExpandedHoleCell"
    case ButtonHoleHeaderCell = "ButtonHoleHeaderCell"
    case HolesHandicapCell = "HolesHandicapCell"
    case CurrentMatchListCell = "CurrentMatchListCell"
}

struct FirebaseCollection {
    // Main Storyboard
    static let User  = "Users"
    static let Feedback  = "Feedback"
    static let Food  = "Food Vendors"
    static let Floor  = "Floor Plan"
    static let Exhibitor  = "Exhibit Vendors"
    static let Sponsors  = "Sponsors"
    static let Schedule  = "Schedule"
}

struct FirebaseLogEvent {
    static let Login  = "iOS_Login"
    static let ProfileAccept  = "iOS_ProfileAccept"
    static let BuyAddOn  = "iOS_BuyAddOn"
    static let UseSpeakOn  = "iOS_UseSpeakOn"
    static let UseReverse  = "iOS_UseReverse"
}

struct FirebaseLogParameter {
    static let loginUsername  = "loginUsername"
    static let loginUserFbID  = "loginUserFbID"
    static let acceptUsername  = "acceptUsername"
    static let acceptUserFbID  = "acceptUserFbID"
    static let addOnType  = "addOnType"
}

struct ErrorMesssages {
    static let emptyGameId = "Please enter Game ID!"
    static let emptyTicketId = "Please enter Ticket ID!"
    static let emptyPassword = "Please enter password."
    static let correntUsername = "Please enter correct phone number."
    static let correctPassword = "Please enter correct password."
    static let admin = "You are not admin to access this application."
    
    static let emptyPhone = "Please enter phone number"
    static let validPhone = "Please enter valid phone number"
    
    static let validOtp = "Please enter valid OTP"
    static let wrong = "Something Went Wrong!"
    static let EmptyGameName = "Please enter game name"
    static let TicketAlready = "Ticket ID already added"
    static let MultipleGame = "You can't play multiple game at a same time"
    static let AtleastOneTicket = "Add atleast one ticket"
    static let CreateAtleastOneTicket = "Create atleast one ticket"
    static let EmptyUsername = "Username must not be empty"
    static let WrongHoles = "Holes data not available"
    static let ParHolesHandicap = "Please setup par holes handicap first!"
    static let FillParHolesHandicap = "Fill the values of handicap"
}

struct SuccessMessages {
    static let TicketBogusSuccessfully = "Ticket declared bogus."
    static let TicketNumberCopied = "Ticket number copied."
    static let HolesHandicapUpdated = "Holes handicap updated."
    static let ForcefullyUpdate = "New version is available in app store, Please update app for better experiece"
}
