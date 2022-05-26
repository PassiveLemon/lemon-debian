# lemon-debian
Scripts to install my custom Debian systems. </br>

Recently, I have been endulging in the greatness that is linux. I still use windows because I mostly play games but when I eventually switch to linux, I'll have everything ready in one package. Also will include headless server scripts for when I host servers (like Minecraft or Terraria) because I like to do that. It's also just fun mess around because why not.

 - VERY BIG WIP. Don't use if you aren't me unless you want to probably encounter bugs. It works for me, it might not for you. </br>
 - Only tested on Debian 11 minimal install

# Instructions: </br>
 - Install Debian with the minimal iso and do not chose a desktop environment. </br>
 - Add the package to a thumb drive (or other transferable medium) and mount it. </br>
 - Navigate into the package and run mainscript.sh.
   - NOTE: If you aren't me, edit the scripts and change all mentions of "lemon" (including sudoers in main/config/) to your user account to set up the OS. </br>
 - After the restart, choose either bspwm or Gnome and run the respective, scriptbspwm.sh or scriptgnome.sh script. This installs the main components of the desktop. Don't run both. </br>
 - After the second restart, run the respective, appsbspwm.sh or appsgnome.sh. These are just apps that get installed. Like previously, don't run both. </br>
 - Again, this is a very WIP project. Do not expect much. I am not an expert.
 - The scripts should tell you what you need to know.


# Todo / Change: (Ignore) </br>
 - T custom TUI's - steam, spotify, discord, reddit </br>
 - T apps + configs </br> 
 - T nvidia driver </br>
 - T headless server scripts for vms </br>
 - T/C optimize script </br>
 - T integrate systems into one script with choices </br>
 - C possibly fragment the scripts into individual scripts for each app. </br>
