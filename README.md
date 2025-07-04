# Rustdesk-Selfhosting-server-settings-script
A collection of Windows batch scripts that automate Rustdesk client's network settings for self-hosted servers.
##Overview
This simple project provides two CMD scripts that streamline and help the proccess of configuring Rustdesk clients to 
connetct to your own self-hosted server.
  * Hardwired script: Pre configured script for mass deployment
  * Client script: User-friendly promt for individual setup

**Problem solved**
When using self-hosted services, a user has to change manually every network setting in every client that they want to have in their server.
Thus many user errors can be created and it can be a dificult task for non-technical users.

**Features**
  * Rustdesk_server_hardwire: a script where the user/administratos can hardcode their netwowk settings and then run in mass
  * Rustdesk_server_user: an interactive script where the user can input their network settings one at a time 

**Usage**
**Rustdesk_server_hardwire**
Open .txt file
Add your network settings into the **SERVER**, **RELAY_SERVER** and **KEY** vars acordingly

**Rustdesk_server_user**
No further additions have to be done to this file

When user/admin wants to create the script:
 * open .txt file 
 * save as 
 * NAME_OF_THE_SCRIPT.bat
 * save_as_type: All_files (*.*)
 * encoding: UTF-8 and ANSI have worked by the time of writing

Now the file that has been created, must appear in the location/directory thats had been selected.

**Execution**
Simply run the script by doyble click or Enter and follow the steps shown in the prompt 
Then run Rustdesk client, restart services and then you'll be ready



**This is a side project so there are no plans for long term support. Any changes or comments will not be consistant**

