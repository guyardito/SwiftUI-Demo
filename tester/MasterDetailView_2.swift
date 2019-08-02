//
//  MasterDetailView_2.swift
//  tester
//
//  Created by Guy Ardito on 7/9/19.
//  Copyright © 2019 Guy Ardito. All rights reserved.
//

import SwiftUI


struct MasterView_2 : View {
	@EnvironmentObject var data:Data
	
	var body: some View {
		NavigationView {
			VStack {
				Text("\(data.age)")
				NavigationLink(destination: DetailView_2().environmentObject(self.data)) { Text("detail")}
			}
		}
	}
}


struct DetailView_2 : View {
	@EnvironmentObject var data:Data
	
	var body : some View {
		VStack {
			Button(action: {self.data.age = Float(52) }) { Text("reset")}
			Slider(value:$data.age, from: 18, through: 60, by:1).padding()
			Text("\(data.age)")
		}
	}
}


#if DEBUG
struct ComplexData_2_Previews : PreviewProvider {
	static var previews: some View {
		MasterView_2().environmentObject(Data())
	}
}
#endif

