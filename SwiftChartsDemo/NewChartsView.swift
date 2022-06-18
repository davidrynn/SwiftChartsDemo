//
//  NewChartsView.swift
//  SwiftChartsDemo
//
//  Created by David Rynn on 6/17/22.
//

import SwiftUI
import Charts

struct NewChartsView: View {
    @EnvironmentObject var dataSource: DataSource
    @State var toggleChartType: Bool = true
    var body: some View {
        VStack {
            Toggle(isOn: $toggleChartType) {
                Text(toggleChartType ? "Bar" : "Line")
            }
            Chart {
                ForEach(dataSource.models) { point in
                    if toggleChartType {
                        if let date = point.date {
                            BarMark(x: .value(point.xLabel, date), y: .value(point.yLabel, point.yValue))
                        } else {
                            BarMark(x: .value(point.xLabel, point.xValue), y: .value(point.yLabel, point.yValue))
                        }
                    } else {
                        if let date = point.date {
                            LineMark(x: .value(point.xLabel, date), y: .value(point.yLabel, point.yValue))
                        } else {
                            LineMark(x: .value(point.xLabel, point.xValue), y: .value(point.yLabel, point.yValue))
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct NewChartsView_Previews: PreviewProvider {
    static var previews: some View {
        NewChartsView()
    }
}
