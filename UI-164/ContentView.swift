//
//  ContentView.swift
//  UI-164
//
//  Created by にゃんにゃん丸 on 2021/04/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
