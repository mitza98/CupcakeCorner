//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Mihai Cerneanu on 30.10.2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    var body: some View {
        Form {
            Section {
                TextField ("Name", text: $order.name)
                TextField("Street address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("ZIP", text: $order.zipCode)
            }
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Checkout ")
                }
            }
            .disabled(order.hasValidAddress == false)

        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
