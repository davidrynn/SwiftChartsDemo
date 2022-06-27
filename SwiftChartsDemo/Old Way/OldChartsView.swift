//
//  OldChartsView.swift
//  SwiftChartsDemo
//
//  Created by David Rynn on 6/17/22.
//

import SwiftUI

struct OldChartsView: View {
    @EnvironmentObject var dataSource: DataSource
    @State var currentType = "bar"
    private var graphTypes = ["bar", "line"]
    var highestData: Double {
        return dataSource.models.max { $0.yValue > $1.yValue }?.yValue ?? 0
    }
    var body: some View {
        VStack {
            Picker("Graph type", selection: $currentType) {
                ForEach(graphTypes, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            Spacer()
            HStack {
                if currentType == "bar" {
                    GeometryReader { geometry in
                        HStack(alignment: .bottom, spacing: 4.0) {
                            ForEach(dataSource.models.indices, id: \.self) { index in
                                let width = (geometry.size.width / CGFloat(dataSource.models.count)) - 4.0
                                let height = geometry.size.height * dataSource.models[index].yValue / highestData
                                let adjWidth = width < 1 ? 1 : width
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: adjWidth, height: height, alignment: .bottom)
                            }
                        }
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                } else {
                    //if line graph
                    GeometryReader { geometry in
                        let height = geometry.size.height
                        let width = geometry.size.width
                        let indexStart = dataSource.models.count > Int(width) ? dataSource.models.count - Int(width) : 0
                        Path { path in
                            path.move(to: CGPoint(x: 0, y: height * self.ratio(for: 0)))
                            for index in indexStart..<dataSource.models.count {
                                let point = CGPoint(
                                    x: CGFloat(index) * width / CGFloat(dataSource.models.count - 1),
                                    y: height * self.ratio(for: index))
                                path.addEllipse(in: CGRect(x: point.x - 2, y: point.y - 2, width: 4, height: 4))
                            }
                            path.closeSubpath()
                        }
                        .fill()

                        Path { path in
                            path.move(to: CGPoint(x: 0, y: height * self.ratio(for: 0)))
                            for index in 0..<dataSource.models.count {
                                let point = CGPoint(
                                    x: CGFloat(index) * width / CGFloat(dataSource.models.count - 1),
                                    y: height * self.ratio(for: index))
                                path.addLine(to: point)
                            }
                        }
                        .stroke(Color.accentColor, style: StrokeStyle(lineWidth: 2))
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                }
                
            }
        }
    }
    private func ratio(for index: Int) -> Double {
        1 - (dataSource.models[index].yValue / highestData)
    }
}

struct OldChartsView_Previews: PreviewProvider {
    static var previews: some View {
        OldChartsView()
    }
}
