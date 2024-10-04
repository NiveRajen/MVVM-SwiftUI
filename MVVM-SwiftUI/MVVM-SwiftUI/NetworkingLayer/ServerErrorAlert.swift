//
//  ServerAlertError.swift
//  MVVM-SwiftUI
//
//  Created by Nivedha Rajendran on 04.10.24.
//

import Foundation
import SwiftUI

enum ServerErrorAlert {
    
    static let unableToParseData = AlertData(title: Text("Failed To Refresh"),
                                            message: Text("Sadly, we couldn´t parse the data returned from the server. Contact support"),
                                                   dismissButton: .default(Text("Ok")))
    
    static let unableToLoadResource = AlertData(title: Text("Failed To Refresh"),
                                            message: Text("Unable to load the specified resource. Contact support"),
                                            dismissButton: .default(Text("Ok")))
    
    static let resourceNotFound = AlertData(title: Text("Failed To Refresh"),
                                            message: Text("Sadly, we could´t find the specified resource file. Contact support"),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToCreateURL  = AlertData(title: Text("Failed To Refresh"),
                                            message: Text("Sadly, we could´t create this URL. Contact support"),
                                            dismissButton: .default(Text("Ok")))
    
    static let urlSessionError  = AlertData(title: Text("Failed To Refresh"),
                                            message: Text("There was an error with this request. Contact support"),
                                            dismissButton: .default(Text("Ok")))
    
    static let httpFailureResponseCode  = AlertData(title: Text("Failed To Refresh"),
                                            message: Text("The server returned a failure for this resource. Contact support"),
                                            dismissButton: .default(Text("Ok")))
    
    static let noDataRecieved  = AlertData(title: Text("Failed To Refresh"),
                                            message: Text("Sadly, we didn't recieve any data from the server. Contact support"),
                                            dismissButton: .default(Text("Ok")))
}
