//
//  DataPoint.swift
//  SwiftChartsDemo
//
//  Created by David Rynn on 6/17/22.
//

import Foundation

struct DataPoint: Codable, Identifiable {
    var id: UUID = UUID()
    var date: Date? = nil
    let xValue: Double
    let xLabel: String
    let yValue: Double
    let yLabel: String
}
