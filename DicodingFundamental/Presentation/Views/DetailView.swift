//
//  DetailView.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 09/10/21.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
    @StateObject var vm: GameDetailViewModel
    let id: Int
    let constant = ConstantDetailView()
    @State var isFavorite: Bool = false
    @State var isLoading: Bool = true
    @State var linkAlertType: LinkAlerts?
    @State var favoriteAlertType: FavoriteAlerts?
    @State var showFavoriteAlert: Bool = false
    @State var showLinkAlert: Bool = false
    @Environment(\.openURL) var openURL
    init(id:Int) {
        _vm = StateObject(wrappedValue: GameDetailViewModel(id: id))
        self.id = id
    }
    var body: some View {
        ScrollView {
            VStack {
                KFImage.url(URL(string: vm.image ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 360,height: 250)
                    .cornerRadius(30)
                    .padding(.top,15)
                HStack {
                    Button(action: {
                        if isFavorite {
                            self.favoriteAlertType = .removeFromFavorite
                            vm.removeFromFavorite()
                        } else {
                            self.favoriteAlertType = .addToFavorite
                            vm.addToFavorite(id: vm.id, name: vm.name, image: vm.image, release: vm.release)
                        }
                        self.isFavorite.toggle()
                        self.showFavoriteAlert.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: self.isFavorite ? constant.iconRemovedFromFavorite : constant.iconAddToFavorite)
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 20, height: 18)
                            Text(self.isFavorite ? constant.titleRemovedFromFavorite : constant.titleAddToFavorite)
                                .foregroundColor(Color.white)
                        }
                        .frame(maxWidth: 350)
                        .frame(height: 55)
                        .background(Color.blue)
                        .cornerRadius(15)
                    })
                        .padding(.leading,15)
                        .alert(isPresented: $showFavoriteAlert, content: {
                            getFavoriteAlert()
                        })
                    Spacer()
                    Button(action: {
                        if vm.website != "" {
                            self.showLinkAlert = false
                            self.linkAlertType = nil
                            openURL(URL(string: vm.website ?? "")!)
                        } else {
                            self.showLinkAlert = true
                            self.linkAlertType = .error
                        }
                    }, label: {
                        Text(constant.titleVisitWebsiteGame)
                            .frame(maxWidth: 350)
                            .frame(height: 55)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(15)
                    })
                        .padding(.trailing,15)
                        .alert(isPresented: $showLinkAlert, content: {
                            getLinkAlert()
                        })
                }
                Text(constant.titleNameGame)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.leading,15)
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text(vm.name ?? "-")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.leading,15)
                    .padding(.bottom,10)
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text(constant.releaseTitleGame)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.leading,15)
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text(vm.release?.toDate().getFormattedDate() ?? "-")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.leading,15)
                    .padding(.bottom,10)
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text(constant.descriptionTitleGame)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.leading,15)
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text(vm.description ?? "-")
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .padding(.horizontal,15)
                    .padding(.bottom,10)
                    .frame(maxWidth:.infinity,alignment: .leading)
                Text(constant.ratingAndReviewsTitleGame)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.leading,15)
                    .frame(maxWidth:.infinity,alignment: .leading)
                VStack {
                    HStack {
                        Text(String(vm.rating ?? 0))
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.leading,35)
                            .padding(.vertical,5)
                        Spacer()
                        Text("\(vm.totalReview ?? 0)")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.trailing,75)
                            .padding(.vertical,5)
                    }
                    HStack {
                        Text(constant.ratingTitleGame)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.leading,25)
                        Spacer()
                        Text(constant.reviewsTitleGame)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.trailing,25)
                    }
                    Spacer()
                }
            }
            .redacted(reason: isLoading ?  .placeholder : [])
        }
        .onAppear(perform: {
            isLoadingChecking()
            if vm.isExistsOnDB() {
                DispatchQueue.main.async {
                    self.isFavorite = true
                }
            } else {
                DispatchQueue.main.async {
                    self.isFavorite = false
                }
            }
        })
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .navigationBarTitle(constant.navTitle,displayMode: .inline)
    }
    func isLoadingChecking() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
        }
    }
    func getLinkAlert() -> Alert {
        switch linkAlertType {
        case .error:
            return Alert(title: Text(constant.titleLinkErrorAlert), message: Text(constant.messageLinkErrorAlert), dismissButton: .cancel())
        default:
            return Alert(title: Text(constant.defaultLinkAlert))
        }
    }
    func getFavoriteAlert() -> Alert {
        switch favoriteAlertType {
        case .addToFavorite:
            return Alert(title: Text(constant.addToFavoriteTitleAlert), message: Text(constant.addToFavoriteMessageAlert), dismissButton: .default(Text(constant.confirmAlert)))
        case .removeFromFavorite:
            return Alert(title: Text(constant.removedFromFavoriteTitleAlert), message: Text(constant.removedFromFavoriteMessageAlert), dismissButton: .default(Text(constant.confirmAlert)))
        default:
            return Alert(title: Text(constant.defaultFavoriteAlert))
        }
    }
}
