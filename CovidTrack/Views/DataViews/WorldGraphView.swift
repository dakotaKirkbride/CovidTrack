//
//  WorldGraphView.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/15/21.
//

import Foundation
import SwiftUI
import SwiftUICharts

struct WorldGraphView: View {
    
    @State var world: World
    
    var body: some View {
        
        let dataMngr = WorldDataManager(world: world)
        
        let percentAlive = (dataMngr.caseRatioArray[0] / Double(dataMngr.todaysCases)) * 100
        let percentRecovered = (dataMngr.caseRatioArray[1] / Double(dataMngr.todaysCases)) * 100
        let percentDead = (dataMngr.caseRatioArray[2] / Double(dataMngr.todaysCases)) * 100
        
        ScrollView(.vertical) {
                VStack {
                    HStack{Text(world.name ?? "").font(.largeTitle).bold(); Spacer()}
                    HStack{Text("New Cases"); Spacer()}
                    HStack{
                        Text("+ \(dataMngr.todaysNewCases)").font(.largeTitle)
                        Spacer()
                        casesDifference
                        Spacer()
                        VStack {
                            Text("  + \(dataMngr.yesterdaysNewCases)")
                            Text(" day before").padding(.trailing)
                        }
                        .padding(.leading, 20)
                    }
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            VStack {
                HStack{Text("Updated \(dataMngr.mostRecentDate)")
                    .font(.subheadline).padding(.leading, 20).padding(.top, 10);Spacer()}
                let grey = Color(UIColor.systemGroupedBackground)
                let lineChartStyle = ChartStyle(backgroundColor: grey, accentColor: Colors.BorderBlue, secondGradientColor: Colors.color2Accent, textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: Color.gray )
                let chartStyle = ChartStyle(backgroundColor: Color.white, accentColor: Colors.BorderBlue, secondGradientColor: Colors.color2Accent, textColor: Color.black, legendTextColor: Color.gray, dropShadowColor: Color.gray )
                LineView(data: dataMngr.getNewCaseArray(dataPoints: 30, weeklyBasis: false), title: "Daily New Cases", legend: "Last 30 Days", style: lineChartStyle, valueSpecifier: "%.0f")
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.bottom, 350)
                
                HStack {
                    PieChartView(data: dataMngr.caseRatioArray, title: "Case Ratio", style: chartStyle, valueSpecifier: "%.0f")
                        .padding(.leading, 20)
                    VStack {
                        VStack {
                            Text("Active %").font(.headline).bold().padding(2).foregroundColor(Color.black)
                            Text("\(String(format: "%.1f", percentAlive))%").font(.subheadline).foregroundColor(Color.black)
                                .padding(.bottom, 6)
                            Text("Recovered %").font(.headline).bold().padding(2).foregroundColor(Color.black)
                            Text("\(String(format: "%.1f", percentRecovered))%").font(.subheadline).foregroundColor(Color.black)
                                .padding(.bottom, 6)
                            Text("Deaths %").font(.headline).bold().padding(2).foregroundColor(Color.black)
                            Text("\(String(format: "%.1f", percentDead))%").font(.subheadline).foregroundColor(Color.black)
                        }
                        .padding(.leading, 9)
                        .padding(.trailing, 9)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.white))
                        .shadow(color: Color.gray, radius: 15)
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
                BarChartView(data: ChartData(values: dataMngr.monthlyTotalCases), title: "Total Cases", legend: "Monthly", style: chartStyle, form: ChartForm.extraLarge, valueSpecifier: "%.0f")
                    .padding()
                HStack {
                    Text("Data provided by the")
                        .font(.footnote)
                    Image("nytLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20, alignment: .center)
                }
                .padding(.bottom)
            }
        }
//        .onAppear() {
//            UIScrollView.appearance().backgroundColor = UIColor.white
//        }

    }
    var casesDifference: some View {
        
        let dataMngr = WorldDataManager(world: world)
        
        if (dataMngr.todaysNewCases > dataMngr.yesterdaysNewCases) {
            return Image(systemName: "arrow.up").foregroundColor(.red)
        } else if dataMngr.todaysNewCases < dataMngr.yesterdaysNewCases {
            return Image(systemName: "arrow.down").foregroundColor(.green)
        } else {
            return Image(systemName: "arrow.left").foregroundColor(.gray)
        }
    }
}
