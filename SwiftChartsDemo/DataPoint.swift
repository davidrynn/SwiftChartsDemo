//
//  DataPoint.swift
//  SwiftChartsDemo
//
//  Created by David Rynn on 6/17/22.
//

import Foundation

struct DataPoint: Codable, Identifiable {
    var id: UUID = UUID()
    let xValue: Date
    let yValue: Double
}
