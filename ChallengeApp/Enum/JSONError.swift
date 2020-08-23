//
//  JSONError.swift
//  ChallengeApp
//
//  Created by Suraj Kodre on 23/08/20.
//  Copyright © 2020 Suraj Kodre. All rights reserved.
//

import Foundation
import UIKit

enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
    case ParsingFail = "ERROR: parsing data gets fail"
}
