//
//  SlideTabView.swift
//  UI-164
//
//  Created by にゃんにゃん丸 on 2021/04/19.
//

import SwiftUI

struct SlideTabView: View {
    
    @State var selected = "house.fill"
    @State var volume : CGFloat = 0.4
    
    @State var shoSlider = false
    var body: some View {
        VStack{
            
            Image("spotify")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            VStack{
                
                TabButton(image: "house.fill", selected: $selected)
                
                TabButton(image: "safari.fill", selected: $selected)
                
                TabButton(image: "mic.fill", selected: $selected)
                
                TabButton(image: "clock.fill", selected: $selected)
            }
            .frame(height: getRect().height / 2.3)
            .padding(.top)
            
            
            
            
            Spacer(minLength: getRect().height < 750 ? 30 : 50)
            
            
            Button(action: {
                
                volume = volume + 0.1 < 1.0 ? volume + 0.1 : 1
                
                
            }, label: {
                Image(systemName: "speaker.wave.2")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            
            
            GeometryReader{proxy in
                
                let height = proxy.frame(in:.global).height
                
                let progress = height * volume
                
                ZStack(alignment:.bottom){
                    
                    Capsule()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 4)
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 4,height: progress)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                
            }
            .padding(.vertical,getRect().height < 750 ? 10 : 20)
             
            
            Button(action: {
                
                volume = volume - 0.1 > 0 ? volume - 0.1 : 0
                
            }, label: {
                Image(systemName: "speaker.wave.1")
                    .font(.title2)
                    .foregroundColor(.white)
            })
            
            Button(action: {
                
                withAnimation(.easeIn){
                    
                    shoSlider.toggle()
                }
                
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.title2)
                    .foregroundColor(.white)
                    .rotationEffect(.init(degrees: shoSlider ? 180 : 0))
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            })
            .padding(.top,getRect().height < 750 ? 10 : 30)
            .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
            .offset(x: shoSlider ? 0 : 100)
            
            
            
            
        }
        .frame(width: 80)
        .background(Color.black.ignoresSafeArea())
        .offset(x: shoSlider ? 0 : -100)
        .padding(.trailing,shoSlider ? 0 : -100)
        .zIndex(1)
    }
}

struct SlideTabView_Previews: PreviewProvider {
    static var previews: some View {
        SlideTabView()
    }
}

struct TabButton : View {
    var image : String
    @Binding var selected : String
    var body: some View{
        
        Button(action: {
            withAnimation{
                selected = image
            }
            
        }, label: {
            Image(systemName: image)
                .font(.title)
                .foregroundColor(selected == image ? .white : Color.gray.opacity(0.3))
                .frame(maxHeight: .infinity)
                
        })
    }
}

extension View {
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
