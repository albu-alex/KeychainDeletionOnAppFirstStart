#  KeychainDeletionOnAppFirstStart

## Overview

This Proof of Concept (POC) project demonstrates a simple SwiftUI application with login/register functionality, backed by secure storage in the Keychain. The app uses SwiftUI for the user interface and leverages the Keychain for securely storing user credentials.

## Features

- **Login and Registration:** Users can securely log in with their credentials or register for a new account.
  
- **Keychain Integration:** User credentials are stored securely in the Keychain, ensuring sensitive information is protected.

- **Singleton ViewModel:** The project uses a shared instance of the `LoginViewModel` class following the Singleton pattern. This ensures a single instance throughout the app, providing a consistent state.

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/swiftui-keychain-auth-poc.git
   ```
 
2. **Usage**

1. **Open the project in Xcode.**

2. **Build and run the app on a simulator or a physical device.**

### How to Log In

- Enter your credentials in the login screen to log in.

- If you don't have an account, you can register by tapping the "Register" button.

## Technologies Used

- **Swift:** The project is written in Swift, Apple's powerful and intuitive programming language.

- **SwiftUI:** The user interface is built using SwiftUI, Apple's modern UI framework.

- **Keychain Services:** The app utilizes the Keychain for secure storage of user credentials.
