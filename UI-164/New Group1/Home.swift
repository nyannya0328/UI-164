//
//  Home.swift
//  UI-164
//
//  Created by にゃんにゃん丸 on 2021/04/19.
//

import SwiftUI

struct Home: View {
    @State var search = ""
    
    var body: some View {
        HStack{
            
            SlideTabView()
            
            
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack{
                    
                    HStack(spacing:15){
                        
                        HStack(spacing:15){
                            
                            Circle()
                                .stroke(Color.white,lineWidth: 3)
                                .frame(width: 25, height: 25)
                            
                            TextField("Search", text: $search)
                            
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(10)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("pro")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        })
                        
                    }
                    
                    Text("Recentry Played")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top,30)
                    
                    
                    TabView{
                        
                        ForEach(recentlyPlayed){item in
                            
                            GeometryReader{proxy in
                                
                                ZStack(alignment:.bottomLeading){
                                    
                                    Image(item.album_cover)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: proxy.frame(in: .global).width, height: 350)
                                        .cornerRadius(20)
                                        .overlay(
                                            LinearGradient(gradient: .init(colors: [.clear,.clear,.black]), startPoint: .top, endPoint: .bottom)
                                                .cornerRadius(10)
                                        
                                        
                                        )
                                    
                                    HStack(spacing:10){
                                        
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                            Image(systemName: "play.fill")
                                                .font(.title2)
                                                .foregroundColor(.white)
                                                .padding(20)
                                                .background(Color("logo"))
                                                .clipShape(Circle())
                                        })
                                        
                                        VStack(alignment: .leading, spacing: 5, content: {
                                            
                                            Text(item.album_name)
                                                .font(.title2)
                                                .foregroundColor(.white)
                                                .fontWeight(.bold)
                                            
                                            Text(item.album_author)
                                                .font(.none)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                        
                                        })
                                    }
                                    .padding()
                                    
                                    
                                }
                                
                                
                            }
                            .padding(.horizontal)
                            .frame(height: 350)
                            
                        }
                        
                        
                    }
                    .frame(height: 350)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .padding(.top,20)
                    
                    Text("Genres")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top,30)
                    
                    let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 3)
                    
                    LazyVGrid(columns: columns,spacing: 15, content: {
                        
                        ForEach(generes,id:\.self){genre in
                            Text(genre)
                                .font(.footnote
                                )
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.vertical,8)
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(Capsule())
                                
                            
                            
                        }
                        
                        
                    })
                    
                    Text("Liked Song")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top,30)
                    
                    let columns2 = Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
                    
                    LazyVGrid(columns: columns2, spacing: 10, content: {
                        
                        
                        ForEach(likedSong.indices,id:\.self){index in
                            
                            GeometryReader{proxy in
                                
                                
                                Image(likedSong[index].album_cover)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.frame(in: .global).width, height: 150)
                                    .clipShape(CustomShape(corner: index % 2 == 0 ? [.topLeft,.bottomLeft] : [.topRight,.bottomRight], radi: 15))
                                
                                
                                
                            }
                            .frame(height: 150)
                            
                            
                        }
                        
                    })
                    .padding(.horizontal)
                    .padding(.top,20)
                    
        
                    
                    
                    
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            })
            
        }
        .background(Color("bg").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
       Home()
    }
}

struct CustomShape : Shape {
    var corner : UIRectCorner
    var radi : CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        return Path(path.cgPath)
    }
}


