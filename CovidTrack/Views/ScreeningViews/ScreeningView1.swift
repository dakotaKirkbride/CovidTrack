//
//  ScreeningView1.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/17/21.
//

import Foundation
import SwiftUI

struct ScreeningView1: View {
    
    @State var totalScreeningNum: Int
    @State private var didTap1 = false
    @State private var didTap2 = false
    @State private var didTap3 = false
    
    var body: some View {
        VStack {
            Button(
                action: {
                    didTap1.toggle()
                    didTap2 = false
                    didTap3 = false
                    if didTap1 {
                        totalScreeningNum = 2
                    } else {
                        totalScreeningNum = 0
                    }
                }, label: {
                    Text("Over 65")
                        .font(.headline)
                        .bold()
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(width: 340, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(didTap1 ? Color.blue : Color.gray, lineWidth: 3)
                                .background(Color.white.cornerRadius(10)))
                        .shadow(radius: 8)
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                })
            
            Button(
                action: {
                    didTap1 = false
                    didTap2.toggle()
                    didTap3 = false
                    if didTap2 {
                        totalScreeningNum = 1
                    } else {
                        totalScreeningNum = 0
                    }
                }, label: {
                    Text("Between 18 and 65")
                        .font(.headline)
                        .bold()
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(width: 340, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(didTap2 ? Color.blue : Color.gray, lineWidth: 3)
                                .background(Color.white.cornerRadius(10)))
                        .shadow(radius: 8)
                        .padding(.bottom, 20)
                    
                })
            
            Button(
                action: {
                    didTap1 = false
                    didTap2 = false
                    didTap3.toggle()
                    totalScreeningNum = 0
                }, label: {
                    Text("Under 18")
                        .font(.headline)
                        .bold()
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(width: 340, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(didTap3 ? Color.blue : Color.gray, lineWidth: 3)
                                .background(Color.white.cornerRadius(10)))
                        .shadow(radius: 8)
                        .padding(.bottom, 20)
                })
            
            Spacer()
            
            if didTap1 || didTap2 || didTap3 {
                
                NavigationLink(destination: ScreeningView2(totalScreeningNum: totalScreeningNum)) {
                    HStack {
                        Text("Next")
                            .font(.headline).bold()
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 340, height: 60)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .shadow(radius: 8)
                    .padding(.bottom)
                }
                
//                Button(action: {
//
//                }, label: {
//                    Text("\("Next")")
//                        .font(.title2)
//                        .padding()
//                        .foregroundColor(Color.white)
//                        .frame(width: 340, height: 70)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .background(Color.blue.cornerRadius(10)))
//                        .shadow(radius: 8)
//                        .padding(.bottom, 20)
//                })
            }
        }
        .navigationBarTitle("How old are you?")
    }
}
