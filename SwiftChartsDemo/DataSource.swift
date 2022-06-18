//
//  DataSource.swift
//  SwiftChartsDemo
//
//  Created by David Rynn on 6/18/22.
//

import SwiftUI

class DataSource: ObservableObject {
    let models: [DataPoint]
    
    init() {
        self.models = DataSource.createModels()
    }
                              
    private static func createModels() -> [DataPoint] {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        let dateStrings = ["06/08/2022",
                           "06/09/2022",
                           "06/10/2022",
                           "06/11/2022",
                           "06/12/2022",
                           "06/13/2022",
                           "06/14/2022",
                           "06/15/2022",
                           "06/16/2022",
                           "06/17/2022",
                           "06/18/2022",
                           "06/19/2022",
                           "06/20/2022",
                           "06/21/2022"]
        let values: [Double] = [ 161.0,
                                 160.5,
                                 161.1,
                                 162.0,
                                 162.1,
                                 163.3,
                                 165.1,
                                 165.0,
                                 166.0,
                                 167.2,
                                 168.0,
                                 170.0,
                                 171.0,
                                 170.3]
                                 
        let models: [DataPoint] = (0...dateStrings.count-1).compactMap { index in
            guard let date = formatter.date(from: dateStrings[index]) else { return nil }
            let timeValue = date.timeIntervalSince1970
            return DataPoint(date: date, xValue: timeValue, xLabel: "date", yValue: values[index], yLabel: "weight")
        }
        return models
    }
                              
}
