# TouchGrassAlarm
Alarm to remind you to touch some grass.

<img width="1197" height="677" alt="Screenshot" src="https://github.com/user-attachments/assets/dc1a5ec8-c52d-41b6-abe4-132502546237" />

Installation
- Download the repository or clone it using
  git clone
- Open the folder in File Explorer
- Ensure the following files are in the same folder
  - touchgrass.ps1
  - run_touchgrass.vbs
- Double-click run_touchgrass.vbs to test
  A Windows XP-style popup should appear with the message "Touch some freaking grass"

Automatic Reminder Setup (Windows Task Scheduler)
- Open Task Scheduler from the Start Menu
- Select Create Task
- Under the General tab
  - Name the task Touch Grass Reminder
  - Check Run only when user is logged on
- Under the Triggers tab
  - Click New
  - Begin the task On a schedule
  - Set to Daily
  - Check Repeat task every 1 hour
  - Set duration to Indefinitely
- Under the Actions tab
  - Click New
  - Action Start a program
  - Program/script: wscript.exe
  - Add arguments: "C:\path\to\run_touchgrass.vbs"
   (replace with your actual file path)
- Click OK to save the task

Uninstall
- Open Task Scheduler and delete the task named Touch Grass Reminder
- Delete the touchgrass.ps1 and run_touchgrass.vbs files from your computer
