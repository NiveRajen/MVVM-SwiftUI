//
//  ServerAlertError.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//

import Foundation

enum ServerErrorAlert {
    
    static let unableToParseData = AlertData(title: "Failed To Refresh",
                                            message: "Sadly, we couldn´t parse the data returned from the server. Contact support",
                                                   dismissButton: "Ok")
    
    static let unableToLoadResource = AlertData(title: "Failed To Refresh",
                                            message: "Unable to load the specified resource. Contact support",
                                            dismissButton: "Ok")
    
    static let resourceNotFound = AlertData(title: "Failed To Refresh",
                                            message: "Sadly, we could´t find the specified resource file. Contact support",
                                            dismissButton: "Ok")
    
    static let unableToCreateURL  = AlertData(title: "Failed To Refresh",
                                            message: "Sadly, we could´t create this URL. Contact support",
                                            dismissButton: "Ok")
    
    static let urlSessionError  = AlertData(title: "Failed To Refresh",
                                            message: "There was an error with this request. Contact support",
                                            dismissButton: "Ok")
    
    static let httpFailureResponseCode  = AlertData(title: "Failed To Refresh",
                                            message: "The server returned a failure for this resource. Contact support",
                                            dismissButton: "Ok")
    
    static let noDataRecieved  = AlertData(title: "Failed To Refresh",
                                            message: "Sadly, we didn't recieve any data from the server. Contact support",
                                            dismissButton: "Ok")
}
