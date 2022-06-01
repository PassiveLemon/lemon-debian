# lemon-debian </br>
Scripts to install my custom Debian systems. </br>

 - `VERY BIG WIP. Probably shouldn't use if you aren't me unless you want to probably encounter bugs. It works for me, it might not for you.` </br>
 - Only tested on Debian 11 minimal install </br>

# Instructions: </br>
 1. Install Debian with the minimal iso and do not chose a desktop environment. </br>
 2. Add the package to a thumb drive, mount it, and navigate into it. </br>
     - This will need to be done from a device that already has an internet connection. You can also use any type of media that you like. </br>
 3. Run `mainscript` with bash. This will prepare the system. </br>
     - NOTE: If you aren't me, change "lemon" (line 21) in sudoers (main/config/) to your user account. </br>
 4. After the restart, run `syschoose` with bash. You will be presented with options. Choose the appropriate option that suits your needs. If you don't know what the options are, look it up. </br>
     - You will need to remount and navigate back into the drive. </br>
 5. After the second restart, run `appschoose` and choose the same option as before. This will install general apps. </br>

 - Again, this is a very WIP project. Do not expect much. I am not an expert. </br>
 - The scripts should tell you what you need to know. </br>


# Todo / Change: (Ignore) </br>
 - T nvidia driver </br>
 - T headless server scripts for vms </br>
 - C Seperate configs into different repo (partially done) </br>
 - T/C fetch wallpapers, fonts, from internet </br>
 - C possibly fragment the scripts into individual scripts for each app </br>
