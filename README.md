# 🗄️ How to Set Up SQL Server and SQL Server Management Studio (SSMS)

This guide will help you install **SQL Server** and **SQL Server Management Studio (SSMS)** on your Windows machine for development or learning purposes.

---

## 🛠 Step 1: Download SQL Server

1. Visit the official Microsoft SQL Server download page:  
   👉 [https://www.microsoft.com/en-us/sql-server/sql-server-downloads](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)

2. Choose either:
   - **SQL Server Developer Edition** (free, full-featured for development/testing)
   - **SQL Server Express Edition** (lightweight, free)

3. Download and run the installer.


---

## 🧩 Step 2: Install SQL Server

1. Choose installation type:
   - **Basic** – Quick setup for most development needs.
   - **Custom** – Configure advanced options.



2. Follow the installation wizard:
   - Accept license terms.
   - Choose installation location.
   - Click **Install**.

3. After installation, take note of your **instance name**:
   - Default: `MSSQLSERVER`
   - Express: `SQLEXPRESS`

4. Configure authentication:
   - Select **Mixed Mode Authentication** (SQL Server + Windows).
   - Set a strong password for the **sa** (system administrator) account.


5. Complete the installation and restart your system if prompted.

---

## 🧮 Step 3: Download & Install SSMS

1. Visit the SSMS download page:  
   👉 [https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)

2. Download and run the SSMS installer.



3. Follow the setup wizard to complete the installation.

---

## 🔗 Step 4: Connect to SQL Server using SSMS

1. Launch **SQL Server Management Studio**.

2. In the **Connect to Server** window:
   - **Server Type**: `Database Engine`
   - **Server Name**:  
     - `localhost` *(default instance)*  
     - or `.\SQLEXPRESS` *(for Express edition)*
   - **Authentication**:  
     - `Windows Authentication` *(use your current Windows login)*  
     - or `SQL Server Authentication` *(use `sa` and your password)*



3. Click **Connect**.

---

## ✅ You're Ready!

You can now:
- Create and manage databases
- Write and run SQL queries
- Design and test database applications locally

![SSMS Working](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExczY3OTZ3c3c0dXFqZ3F6ajJiM2RlbnpnNnljMG1mbjB3bWFmZnJmNiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/VbnUQpnihPSIgIXuZv/giphy.gif)

---

Feel free to fork this guide or open an issue if you face any setup issues.  
**Happy coding!** 💻
