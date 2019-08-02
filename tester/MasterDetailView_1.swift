//
//  ComplexData.swift
//  tester
//
//  Created by Guy Ardito on 7/9/19.
//  Copyright © 2019 Guy Ardito. All rights reserved.
//

import SwiftUI
import Combine

class Data : BindableObject {
	var willChange = PassthroughSubject<Void, Never>()
	
	typealias PublisherType = PassthroughSubject<Void, Never>
	
	var didChange = PassthroughSubject<Void, Never>()
	
	var name = "Guy"
	var age:Float = 52 { willSet { willChange.send() }}
}

struct MasterView_1 : View {
	@ObjectBinding var data:Data
	
    var body: some View {
		NavigationView {
			VStack {
				Text("\(data.age)")
				NavigationLink(destination: DetailView_1(data:data)) { Text("detail")}
			}
		}
    }
}


struct DetailView_1 : View {
	@ObjectBinding var data:Data
	
	var body : some View {
		VStack {
			Button(action: {self.data.age = Float(52) }) { Text("reset")}
			Slider(value:$data.age, from: 18, through: 60, by:1).padding()
			Text("\(data.age)")
		}
	}
}


#if DEBUG
struct ComplexData_Previews : PreviewProvider {
    static var previews: some View {
		MasterView_1(data:Data())
    }
}
#endif
