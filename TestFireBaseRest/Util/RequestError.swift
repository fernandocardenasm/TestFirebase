//
//  MarvelError.swift
//  TestFireBaseRest
//
//  Created by Fernando on 24.05.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation
/// Dumb error to model simple errors
/// In a real implementation this should be more exhaustive
public enum MarvelError: Error {
    case encoding
    case decoding
    case server(message: String)
}

