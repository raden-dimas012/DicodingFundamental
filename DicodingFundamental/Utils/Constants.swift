//
//  Constants.swift
//  DicodingFundamental
//
//  Created by Raden Dimas on 10/10/21.
//

struct ConstantApp {
    let backgroundLifeCycle = "background"
    let inactiveLifeCycle = "inactive"
    let activeLifeCycle = "active"
    let defaultLifeCycle = "something must have changed."
}
struct ConstantApi {
    let baseURL = "https://api.rawg.io/api/games?"
    let apiKey = "key=1923047721a645bda224a2a46010ecdd"
    let page = "&page=12"
    let detailBaseURL = "https://api.rawg.io/api/games"
}
struct ConstantContentView {
    let home = "Home"
    let favorite = "Favorite"
    let settings = "Settings"
    let profile = "Profile"
    let imageHome = "house.fill"
    let imageFavorite = "heart.fill"
    let imageSettings = "gearshape"
    let imageProfile = "person.circle"
}
struct ConstantFavoriteView {
    let favoriteNotFoundJson = "not-found"
    let favoriteNotFoundTitle = "Please add your favorite game."
}
struct ConstantSettingsView {
    let titleDisplaySettings = "Display"
    let descriptionThemeMode = "System Settings will override Dark mode and use the current device theme."
    let imageDarkMode = "moon.circle"
    let darkModeTitle = "DarkMode"
    let imageSystemMode = "gear"
    let systemModeTitle = "Use System Settings"
    let titleReminderSettings = "Reminder"
    let descriptionReminder = "Reminder to open the app every day at 09:00 am"
    let reminderTitle = "Reminder"
    let imageReminder = "alarm.fill"
    let reminderTitleNotification = "Reminder"
    let reminderSubTitleNotification = "Come on open the app for watching new movie!"
}
struct ConstantProfileView {
    let name = "Name"
    let birth = "Birth"
    let email = "Email"
    let role = "Role"
    let myName = "Raden Dimas"
    let myBirth = "Jambi,10-06-2000"
    let myEmail = "dimascode012@gmail.com"
    let myRole = "iOS Developer"
    let myPhoto = "MyPhoto"
    let imageName = "person.circle"
    let imageBirth = "calendar.circle"
    let imageEmail = "envelope.circle"
    let imageRole = "bag.fill"
}
struct ConstantHomeView {
    let loadingJson = "loading"
    let loadingViewTitle = "Loading"
}
struct ConstantDetailView {
    let navTitle = "Detail"
    let iconAddToFavorite = "heart"
    let iconRemovedFromFavorite = "heart.fill"
    let titleAddToFavorite = "Add to favorite"
    let titleRemovedFromFavorite = "Remove from favorite"
    let titleVisitWebsiteGame = "Visit Game Website"
    let titleNameGame = "Title"
    let releaseTitleGame = "Release"
    let descriptionTitleGame = "Description"
    let ratingAndReviewsTitleGame = "Rating and Reviews"
    let ratingTitleGame = "Rating"
    let reviewsTitleGame = "Total Reviews"
    let titleLinkErrorAlert = "There was an error"
    let messageLinkErrorAlert = "Link for website not found!"
    let defaultLinkAlert = "Error Not Found"
    let addToFavoriteTitleAlert = "Success"
    let addToFavoriteMessageAlert = "Game added to favorite"
    let removedFromFavoriteTitleAlert = "Success"
    let removedFromFavoriteMessageAlert = "Game removed from favorite"
    let defaultFavoriteAlert = "Error Not Found"
    let confirmAlert = "OK"
}
struct ConstantCoreData {
    let titleContainer = "FavoriteGame"
    let savedCoreDataSuccess = "saved successfully"
}
