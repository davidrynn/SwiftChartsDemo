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
    @State var currentType = "barMark"
    private var graphTypes = ["barMark", "lineMark", "pointMark", "areaMark", "rectangleMark"]
    var body: some View {
        VStack {
            Picker("Graph type", selection: $currentType) {
                ForEach(graphTypes, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            Spacer()
            Spacer()
            Chart {
                ForEach(dataSource.models) { point in
                    let xPoint: PlottableValue<Date> = .value("date", point.xValue)
                    let yPoint: PlottableValue<Double> = .value("value", point.yValue)
                    let random: Double = Double(arc4random_uniform(UInt32(15)) + 1)
                    let yStart: PlottableValue<Double> = .value("start", point.yValue - random)
                    let yEnd: PlottableValue<Double> = .value("end", point.yValue + random)
                    switch currentType {
                    case "barMark":
                        BarMark(x: xPoint, y: yPoint)
                    case "lineMark":
                        LineMark(x: xPoint, y: yPoint)
                    case "pointMark":
                        PointMark(x: xPoint, y: yPoint)
                    case "ruleMark":
                        RuleMark(x: xPoint)
                    case "areaMark":
                        AreaMark(x: xPoint, yStart: yStart, yEnd: yEnd)
                    case "rectangleMark":
                        RectangleMark(x: xPoint, yStart: yStart, yEnd: yEnd)
                    default:
                        BarMark(x: xPoint, y: yPoint)
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
