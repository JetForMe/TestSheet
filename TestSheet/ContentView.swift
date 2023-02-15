//
//  ContentView.swift
//  TestSheet
//
//  Created by Rick Mann on 2023-02-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationSplitView
		{
			List
			{
				Text("Foo")
				Text("Bar")
			}
			.navigationSplitViewColumnWidth(min: 200, ideal: 200)
		}
		detail:
		{
			NavigationStack
			{
				Text("The Detail")
					.navigationTitle("Detail")
					.toolbar
					{
						ToolbarItemGroup
						{
							NavigationLink(value: "New thing")
							{
								Label("New thing", systemImage: "plus")
							}
						}
					}
					.navigationDestination(for: String.self)
					{ _ in
						AddView()
					}
			}
		}
    }
}

struct
AddView : View
{
	var
	body: some View
	{
		Text("new thing editor")
			.navigationTitle("New Thing")
			.toolbar
			{
				ToolbarItemGroup
				{
					Button(action: { self.isPresentingSearch = true })
					{
						Label("Search Thing", systemImage: "magnifyingglass")
					}
				}
			}
			.sheet(isPresented: self.$isPresentingSearch)
			{
				Text("Search Thing UI")
			}
	}
	
	@State	private	var	isPresentingSearch					=	false
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
