//
//  ScreeningView3.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/27/21.
//

import Foundation
import SwiftUI

struct ScreeningView3: View {
    
    @State var totalScreeningNum: Int
    @State var tempScreeningNum = 0
    @State private var didTap1 = false
    @State private var didTap2 = false
    @State private var didTap3 = false
    @State private var didTap4 = false
    @State private var didTap5 = false
    @State private var didTap6 = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Please select any of the following that apply to you")
                }
                .padding(.leading)
                .padding(.trailing)
                
                Button(
                    action: {
                        didTap1.toggle()
                        didTap6 = false
                        if didTap1 {
                            tempScreeningNum += 2
                        } else {
                            tempScreeningNum -= 2
                        }
                    }, label: {
                        Text("Obesity")
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
                        didTap2.toggle()
                        didTap6 = false
                        if didTap2 {
                            tempScreeningNum += 2
                        } else {
                            tempScreeningNum -= 2
                        }
                    }, label: {
                        Text("Pregnancy")
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
                        didTap3.toggle()
                        didTap6 = false
                        if didTap3 {
                            tempScreeningNum += 1
                        } else {
                            tempScreeningNum -= 1
                        }
                    }, label: {
                        Text("Diabetes or High Blood Pressure")
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
                
                Button(
                    action: {
                        didTap4.toggle()
                        didTap6 = false
                        if didTap4 {
                            tempScreeningNum += 1
                        } else {
                            tempScreeningNum -= 1
                        }
                    }, label: {
                        Text("Chronic Lung Disease")
                            .font(.headline)
                            .bold()
                            .padding()
                            .foregroundColor(Color.black)
                            .frame(width: 340, height: 70)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(didTap4 ? Color.blue : Color.gray, lineWidth: 3)
                                    .background(Color.white.cornerRadius(10)))
                            .shadow(radius: 8)
                            .padding(.bottom, 20)
                    })
                
                Button(
                    action: {
                        didTap5.toggle()
                        didTap6 = false
                        if didTap5 {
                            tempScreeningNum += 1
                        } else {
                            tempScreeningNum -= 1
                        }
                    }, label: {
                        Text("Serious Heart Condition")
                            .font(.headline)
                            .bold()
                            .padding()
                            .foregroundColor(Color.black)
                            .frame(width: 340, height: 70)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(didTap5 ? Color.blue : Color.gray, lineWidth: 3)
                                    .background(Color.white.cornerRadius(10)))
                            .shadow(radius: 8)
                            .padding(.bottom, 20)
                    })
                
                Button(
                    action: {
                        didTap6.toggle()
                        didTap1 = false
                        didTap2 = false
                        didTap3 = false
                        didTap4 = false
                        didTap5 = false
                        tempScreeningNum = 0
                    }, label: {
                        Text("None of the above")
                            .font(.headline)
                            .bold()
                            .padding()
                            .foregroundColor(Color.black)
                            .frame(width: 340, height: 70)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(didTap6 ? Color.blue : Color.gray, lineWidth: 3)
                                    .background(Color.white.cornerRadius(10)))
                            .shadow(radius: 8)
                            .padding(.bottom, 20)
                    })
                
                Spacer()
                
                if didTap1 || didTap2 || didTap3 || didTap4 || didTap5 || didTap6 {
                    Button(action: {
                        totalScreeningNum += tempScreeningNum
                    }, label: {
                        Text("Next")
                            .font(.title2)
                            .padding()
                            .foregroundColor(Color.white)
                            .frame(width: 340, height: 70)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .background(Color.blue.cornerRadius(10)))
                            .shadow(radius: 8)
                            .padding(.bottom, 20)
                    })
                }
            }
        }
        .navigationBarTitle("Preconditions")
    }
}
