# 📊 Crypto Portfolio App (SwiftUI)

A SwiftUI-based iOS application that provides a simple **crypto portfolio dashboard** with portfolio summary, recent transactions, and exchange actions.  
This project was built as part of an internship assignment to demonstrate **UI development, navigation flow, and state management** in SwiftUI.

---

## 🚀 Features

- **Analytics Dashboard**
  - Portfolio card in all currency
  - user's protfolio graph
  - Recent transactions list
- **Transactions Summary**
  - Portfolio card with total balance
  - Send, Exchange and Recieve buttons
  - Displays transaction history with icons and details
- **Exchange Screen**
  - Custom buttons to navigate to the exchange screen
  - Exchange currency
  - Exchange view 
- **Custom UI Components**
  - Analytics Header View
  - Assets List View
  - Graph View
  - Custom Tab Bar
  - Recent Transactions View
  - Time Selector View
  - Top Menu Bar
  - Action Buttons with gradient background
  - 

---

## 🛠️ Tech Stack

- **Language**: Swift 5  
- **Framework**: SwiftUI  
- **State Management**: `@State`, `@Binding`, `@StateObject`  
- **Navigation**: `NavigationStack` (iOS 16+)  

---

## 📂 Project Structure
CryptoPortfolio/
├── Components/
│ ├── AnalyticsPage/
│ │ ├── AnalyticsHeaderView.swift
│ │ ├── AssetsListView.swift
│ │ ├── GraphView.swift
│ │ ├── RecentTransactionsView.swift
│ │ ├── SmoothLineShape.swift
│ │ └── TimeSelectorView.swift
│ ├── ExchangePage/
│ │ ├── ActionButtonsBarView.swift
│ │ ├── ExchangeView.swift
│ │ ├── PortfolioCardView.swift
│ │ └── TransactionSectionView.swift
│ ├── CustomTabBar.swift
│ └── TransactionRowCard.swift
│
├── Models/
│ ├── CryptoAsset.swift
│ ├── RecentTransaction.swift
│ └── Tab.swift
│
├── Resources/
│ └── Assets/
│
├── ViewModels/
│ └── AnalyticsViewModel.swift
│
├── Views/
│ ├── AnalyticsView.swift
│ ├── MainView.swift
│ ├── TopMenuBar.swift
│ └── TransactionHistoryScreenView.swift
│
├── CryptoPortfolioApp.swift
│
├── Tests/
│ ├── CryptoPortfolioTests/
│ └── CryptoPortfolioUITests/

## 🖥️ Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/kamran-ansari-02/crypto-portfolio.git
2. Open the project in Xcode:
  open CryptoPortfolio.xcodeproj
3. Build & run on:
  iOS Simulator (Xcode)
  iPhone (iOS 16+)


---

### 2. Add **Screenshots or Screen Recording**

```markdown
## 📸 Screenshots

| Analytics Screen | Transactions Summary | Exchange View |
|------------------|----------------------|---------------|
| ![Analytics](screenshots/analytics.png) | ![Transactions](screenshots/transactions.png) | ![Exchange](screenshots/exchange.png) |

