//
//  ScreeningView.swift
//  Covid Tracking App
//
//  Created by Dakota Kirkbride on 3/30/21.
//

import Foundation
import SwiftUI

struct AboutView: View {

    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack{Text("Up-to-date information about COVID-19 and its effects"); Spacer()}
                        .padding(.leading, 20)
                        .padding(.bottom, 10)
                    VStack {
                        HStack{
                            Image(systemName: "lungs.fill").foregroundColor(Color.red)
                                .padding(.leading, 10)
                            Text("What is COVID-19?")
                                .bold()
                                .padding(.leading, 2)
                                .padding(.trailing, 50)
                            Spacer()}
                            .padding(.bottom, 1)
                        HStack{
                            Text("Coronavirus disease (COVID-19) is an infectious disease caused by a newly discovered coronavirus")
                                .padding(.leading, 50)
                                .padding(.trailing, 50)
                            Spacer()}
                    }
                    .frame(width: 380, height: 140)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .shadow(radius: 8)
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack{
                            Image(systemName: "figure.stand.line.dotted.figure.stand").foregroundColor(Color.purple)
                                .padding(.leading, 10)
                            Text("How does COVID-19 spread?")
                                .bold()
                                //                                        .padding(.leading, 50)
                                .padding(.trailing, 50)
                            Spacer()}
                            .padding(.bottom, 1)
                        HStack{
                            Text("COVID-19 spreads primarily through droplets of saliva or discharge from the nose when an infected person coughs or sneezes (within about 6 feet)")
                                .padding(.leading, 50)
                                .padding(.trailing, 50)
                            Spacer()}
                    }
                    .frame(width: 380, height: 180)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .shadow(radius: 8)
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack{
                            Image(systemName: "person.3.fill").foregroundColor(Color.green)
                                .padding(.leading, 10)
                            Text("Who is most at risk?")
                                .bold()
                                //                                        .padding(.leading, 1)
                                .padding(.trailing, 50)
                            Spacer()}
                            .padding(.bottom, 1)
                        HStack{
                            Text("Typically, adults over the age of 65 along with anyone who has underlying conditions are most at risk for catching COVID-19")
                                .padding(.leading, 50)
                                .padding(.trailing, 50)
                            Spacer()}
                    }
                    .frame(width: 380, height: 160)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .shadow(radius: 8)
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack{
                            Image(systemName: "waveform.path.ecg").foregroundColor(Color.orange)
                                .padding(.leading, 10)
                            Text("What are the symptoms?")
                                .bold()
                                .padding(.leading, 7)
                                .padding(.trailing, 50)
                            Spacer()}
                            .padding(.bottom, 1)
                        HStack{
                            Text("The most common symptoms include: fever, headaches, loss of taste or smell, fatigue, and nausea")
                                .padding(.leading, 50)
                                .padding(.trailing, 50)
                            Spacer()}
                    }
                    .frame(width: 380, height: 140)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .shadow(radius: 8)
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack{
                            Image(systemName: "hands.sparkles.fill").foregroundColor(Color.blue)
                                .padding(.leading, 10)
                            Text("How can COVID-19 be prevented?")
                                .bold()
                                .padding(.leading, 6)
                                .padding(.trailing, 50)
                            Spacer()}
                            .padding(.bottom, 1)
                        HStack{
                            Text("Wearing a mask when in publuc, maintaining social distance when outside your home, washing your hands often, avoiding crowds/poorly ventilated spaces, and getting vaccinated are all ways to prevent contracting COVID-19")
                                .padding(.leading, 50)
                                .padding(.trailing, 50)
                            Spacer()}
                    }
                    .frame(width: 380, height: 240)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .shadow(radius: 8)
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack{
                            Image(systemName: "bolt.heart.fill").foregroundColor(Color.red)
                                .padding(.leading, 10)
                            Text("When should I seek medical care?")
                                .bold()
                                .padding(.leading, 6)
                                .padding(.trailing, 50)
                            Spacer()}
                            .padding(.bottom, 1)
                        HStack{
                            Text("It is reccommended to seek immediate medical care if you experience any of the following symptoms: chest pain, trouble breathing, or difficulty staying awake")
                                .padding(.leading, 50)
                                .padding(.trailing, 50)
                            Spacer()}
                    }
                    .frame(width: 380, height: 200)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                    .shadow(radius: 8)
                    .padding(.bottom, 10)
                    
                    HStack{
                        Text("Information provided by the")
                            .font(.footnote)
                            .padding(.leading, 5)
                        Image("cdcLogoBlue")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35, alignment: .center)
                    }
                    .padding(.bottom)
                }
            }.navigationBarTitle("About COVID-19")
        }
        .onAppear() {
            UIScrollView.appearance().backgroundColor = UIColor.systemGroupedBackground
        }
    }
}



