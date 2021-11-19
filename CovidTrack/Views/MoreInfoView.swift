//
//  MoreInfoView.swift
//  CovidTrack
//
//  Created by Dakota Kirkbride on 4/21/21.
//

import Foundation
import SwiftUI
import SafariServices

struct MoreInfoView: View {
    
    @State var showCDCSheet = false
    @State var showOhioSheet = false
    @State var cdcPreventURL = "https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html"
    @State var ohioTestingURL = "https://coronavirus.ohio.gov/wps/portal/gov/covid-19/dashboards/other-resources/testing-ch-centers"
    
    var body: some View {
        VStack {
            HStack{
                Text("More Information")
                .font(.largeTitle)
                .bold()
                Spacer()
            }
            .padding(.top, 50)
            .padding(.leading, 20)
            Button(action: {
                self.showCDCSheet = true
            }, label: {
                VStack {
                    HStack {
                        Text("Preventative Measures")
                            .font(.title3)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.bottom)
                            .padding(.leading)
                        Spacer()
                        Image("cdcLogoBlue")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35, alignment: .top)
                            .padding(.trailing)
                    }
                    HStack {
                        Text("Information available at cdc.gov")
                            .foregroundColor(.black)
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "arrow.up.forward.square.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                }
                .frame(width: 380, height: 120)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                .shadow(radius: 8)
                .padding(.bottom, 20)
            })
            .sheet(isPresented: $showCDCSheet, content: {
                SafariView(url:URL(string: self.cdcPreventURL)!)
            })
            
            Button(action: {
//                self.showSafari = true
                self.showOhioSheet = true
            }, label: {
                VStack {
                    HStack {
                        Text("Find a Testing Site")
                            .font(.title3)
                            .foregroundColor(.black)
                            .bold()
                            .padding(.bottom)
                            .padding(.leading)
                        Spacer()
                        Image("ODHlogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 40, alignment: .center)
                            .padding(.trailing)
                    }
                    HStack {
                        Text("Ohio Department of Health")
                            .foregroundColor(.black)
                            .padding(.leading)
                        Spacer()
                        Image(systemName: "arrow.up.forward.square.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                    }
                }
                .frame(width: 380, height: 120)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                .shadow(radius: 8)
                .padding(.bottom, 20)
        })
        .sheet(isPresented: $showOhioSheet, content: {
            SafariView(url:URL(string: self.ohioTestingURL)!)

        })
            
        Spacer()
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea(.all))
        
    }
}


// credit: https://stackoverflow.com/questions/56518029/how-do-i-use-sfsafariviewcontroller-with-swiftui
struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
            return SFSafariViewController(url: url)
        }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }
}
