//
//  Master.swift
//  tester
//
//  Created by Guy Ardito on 7/10/19.
//  Copyright © 2019 Guy Ardito. All rights reserved.
//

import SwiftUI
import Combine

class Data2 : BindableObject {
	var willChange =  PassthroughSubject<Void, Never>()
	
	
	typealias PublisherType = PassthroughSubject<Void, Never>
	
	var didChange = PassthroughSubject<Void, Never>()
	
	var name = "Guy"
	
	var age:Float = 52 { didSet { didChange.send() }}
}


struct MasterView : View {
	@EnvironmentObject var data:Data2
	
	var body: some View {
		NavigationView {
			VStack {
				Text("\(data.age)")
				NavigationLink(destination:DetailView().environmentObject(self.data)) { Text("detail")}
			}
		}
	}
}

struct DetailView : View {
	@EnvironmentObject var data:Data2
	
	var body : some View {
		VStack {
			Button(action: { self.data.age = Float(52) }) { Text("reset")}
			Slider(value:$data.age, from:18, through:60, by:1).padding()
			Text("\(data.age)")
		}
	}
}
#if DEBUG
struct Master_Previews : PreviewProvider {
    static var previews: some View {
		MasterView().environmentObject(Data2())
    }
}
#endif
