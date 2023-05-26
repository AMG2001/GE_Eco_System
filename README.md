# Github Repo Docs

## 🏭 Green Egypt Eco System Repo :

- this git repo contain all software that we use inside our GE Eco System as :
1. Green Egypt user app 📱 : this application that contain all user info “User account , user points , number of recycled items and history of all transactions that user implement inside our system”.
    
    ![https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiP5O-mAsZ4z3ArULmiUduJum8edRINshEO7TR7s5sj2_2TCYY3jIz1KH3WI1nD96TFnzV5NWrvrK_3eCgl3ra5tUz3ziMNQkuPA_Fh-yZ-lFja4HZqI44arl2QQ3MGPrneVPTXTAk5WFaj_Rv8g3J2x6HT0A-l4axxwLZfRvkeAyAWILJoJJbEPkXf/s1600/GE%20Logo.png](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiP5O-mAsZ4z3ArULmiUduJum8edRINshEO7TR7s5sj2_2TCYY3jIz1KH3WI1nD96TFnzV5NWrvrK_3eCgl3ra5tUz3ziMNQkuPA_Fh-yZ-lFja4HZqI44arl2QQ3MGPrneVPTXTAk5WFaj_Rv8g3J2x6HT0A-l4axxwLZfRvkeAyAWILJoJJbEPkXf/s1600/GE%20Logo.png)
    
2. Green Egypt Screen app 💻 : this application is used to interact with all user actions and tracking number and type of items that user put inside our GE Machine and at last generate qrcode that user scan to take his / her points .
3. Green Egypt Camera app 📸 : we use camera with tflite model to detect classify the type of item that user put in front of the machine to open the hole of the item or refuse to take it if it neigther plastic nor cans .
4. GE Signals app 📶 : this app contain and test all signals that camera send to arduino and check how the arduino interact and handle these signals . 

# 📗 Green Egypt :

- Graduation Project for Software Engineering Section 2023 FCI Menofia with Dr / Eman Elmesalhy “Project Advisor 👩‍⚖️” .
- Recycling , the idea that we build our project depending on ,
 Green Egypt support recycling idea by Giving users cash back 💵 with each item they recycle .

### ** Members of Team :

1. Mariam Ahmad Elsheikh “Team Leader” .
2. Mohamad amgad elsaid ”Technical leader & Repository Admin ”.
3. Hamdy Mostafa mahmoud “لزق وصلات و وسارق الديزاين” .
4. Salah ayman Eteam “Flutter developer” .
5. Alaa mohamad Hammad “Flutter Developer” .
6. mahmoud Shady "Flutter Developer".
7. Mohamad samy alansary "Flutter Developer".

# 🗺 Implementation Map in Green Egypt :

## 📅 “Implement language transitions” 19/04/2023 .

- Eng / alaa hammad implemented application multi language option by adding ‘ar - en’ languages data and also language switching but without storing last option .
- Eng / amgad implemented storing last choosen language option and fix language transition mark ✔ .

---

## 📅 “Start working on Qrcode scanning” 11/05/2023 .

- Eng / Amgad implemented qrcode sacnning and handling scanning the same qrcode multiple times .

## 📅 “Finish Qrcode scanning and storing transactions in Transaction Page” 16/05/2023 .

- Eng / Amgad implemented Saving qrcode on local storage and also showing it on transaction page .

## 📅 “Add Ultra sonic to Machine and implement it's code” 25/05/2023 .

- Eng / Amgad implemented Ultrasonic code and handle sending signals to screen only if the item putted inside machine .
