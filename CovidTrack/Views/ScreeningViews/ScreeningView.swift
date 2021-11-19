//
//  ScreeningView.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/15/21.
//

import Foundation
import SwiftUI

struct ScreeningView: View {
    
    @State private var totalScreeningNum = 0
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    VStack {
                        HStack {
                            Text("COVID-19")
                                .font(.largeTitle)
                                .bold()
                            Spacer()}
                        HStack {
                            Text("Screening Tool")
                                .font(.largeTitle)
                                .bold()
                            Spacer()
                        }
                    }
                    .padding(.top, 50)
                    .padding(.leading, 20)
                    
                    HStack {
                        VStack {
                            Text("This screening tool will help give advice next steps about COVID-19.")
                            Text("")
                            Text("Using this tool can help to keep you and the people around you safe and healthy.")
                            Spacer()
                        }
                        .padding(.leading, 20)
                        .padding(.top, 15)
                        .padding(.trailing, 10)
                        Image("maskedPeople")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 250, alignment: .center)
                            .padding(.trailing, 20)
                    }
                    NavigationLink(destination: ScreeningView1(totalScreeningNum: totalScreeningNum)) {
                        HStack {
                           Text("Begin Screening")
                               .font(.headline).bold()
                               .foregroundColor(Color.white)
                       }
                       .frame(width: 340, height: 60, alignment: .center)
                       .background(Color.blue)
                       .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                       .shadow(radius: 8)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear() {
            UIScrollView.appearance().backgroundColor = UIColor.systemGroupedBackground
        }
    }
}
