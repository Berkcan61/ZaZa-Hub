# Load Script:

```
loadstring(game:HttpGet("https://raw.githubusercontent.com/Berkcan61/ZaZa-Hub/refs/heads/main/ZaZa.lua"))()
```

# ZaZa Hub

by Brxyk_ #berkcan61

ZaZa Hub is a powerful and customizable script for Roblox, providing a variety of features to enhance gameplay. It integrates seamlessly with the Fluent GUI framework, offering a user-friendly interface with customizable themes, controls, and settings. The script includes various modules, such as:

ESP (Extra Sensory Perception): Displays boxes, lines, and player names around other players, along with health bars and distance indicators for in-game targets. Aimbot: Automatically aims at the closest player to the cursor with customizable smoothness for a more natural feel. Fly: Allows the player to fly around the map with adjustable flight speed. Speed & Jump Power: Modifies the player's walking speed and jump height. Noclip: Lets the player walk through walls and other obstacles. Name Changer: Alters the player's displayed in-game name locally. Save & Interface Management: Save and load custom configurations, themes, and settings using the SaveManager and InterfaceManager add-ons. This script provides an intuitive and feature-packed experience for Roblox users looking for an edge in gameplay, with a focus on customization and ease of use.

# Changelog Version 1.2.4 - Release Date: 2025-05-22

**Rewritten:**

* **ESP system fully rewritten** — improved performance, better security, new internal logging system.

**Added:**

* Many **new ESP settings** for greater customization.
* New **"Debugs" toggle** in the settings tab — currently only available for ESP.

  * Note: ESP debug logs are **incomplete** and still under development.

# Changelog Version 1.2.3 - Release Date: 2025-05-14

**Fixed:**

* The issue where the script couldn't be executed due to a massive error (`attempt to call a nil value`) has been resolved.

* **ZaZa Performance Benchmark - Features:**

* **Part Creation:**

  * Dynamic creation of **Parts** in the workspace
  * Material selection (default: `Plastic`, selectable via textbox)
  * Number of parts adjustable (default: 1000, via textbox)

* **Auto-Cleanup:**

  * Auto-destruction of created parts after a set time
  * Cleanup time in seconds adjustable (default: 10 seconds)

* **FPS Measurement:**

  * FPS tracking during the benchmark
  * Display of FPS rate at the end of the benchmark run
  * Color-coded display of FPS depending on performance (green, orange, red)

* **Progress Display:**

  * Progress display during part creation, adjustable via a toggle button
  * Display of current progress (parts created/total) in the info box

* **Interactive Buttons:**

  * Toggle button to turn the progress display on and off
  * Start button to begin the benchmark
  * Close button to close the GUI
  * Progress text and FPS display clearly structured and color-coded

* **Connection to RenderStepped:**

  * FPS connection with `RunService.RenderStepped` to accurately measure FPS during the test

* **Result Display:**

  * Shows the time of the benchmark and the created parts
  * Displays FPS based on performance

* **Note:**

  * This is a new feature of ZaZa, so bugs are expected. Please avoid using very large numbers (like millions), as this can take a few minutes to process. If you encounter any issues, feel free to contact me on Discord or open a pull request.

# Changelog Version 1.2.2 - Release Date: 2025-05-09
**Added:**

* **200+ New Emotes:**
  Over 200 new emotes have been added to the emote system.

**Changed:**

* **Emote System Rewrite:**
  The emote code has been completely rewritten. You can now open the emote menu using the new button in the "Emote" tab.

**Removed:**

* **Aimbot Code:**
  The aimbot has been completely removed due to it no longer functioning properly. A new version will be added in a future update.

**Updated:**

* **UI Improvements (Anti-Cheat Scanner, UNC Tester, More UNC):**

  * Improved performance
  * UI is now draggable
  * Clicking through the UI is no longer possible
  * Added minimize functionality

**Fixes:**

* Various small bug fixes and performance adjustments.

# Changelog Version 1.2.1 - Release Date: 2025-04-12

**Added:**
+ **Godmode:**  
   - A new **Godmode** toggle has been added.  
   - **Note:** This feature only works in certain games. You can find the toggle under the **Player** tab.

# Changelog Version 1.2.0  - Release Date: 2025-04-09

**Performance Update:**
- Cached key information such as mouse position and target info to reduce lag and provide a smoother experience.
- Logic has been fully cleaned up for easier readability and improved reliability.
- Consistent formatting to speed up updates and minimize future bugs.

**Added:**
- **UNC Tester:**
   - A new UNC tester has been added, which includes most of the functions, but not all. Since it's relatively new, the results may significantly differ from the actual ones.
   - **Usage:**  
      - The button can be found in the "Misc" tab. When you click the button, you will be reminded to proceed with caution. This test is very performance-heavy and may cause crashes on older PCs, so avoid using it if you're on a low-end system.

- **Anti-Cheat Scanner:**  
   - A new anti-cheat scanner has been introduced to help detect potential cheats in the game.

- **More UNC:**
   - The "More UNC" option unlocks additional functions that your executor may not support. **Warning:** "More UNC" does not necessarily mean that you will get more UNC from the UNC test.
   - **Note:** The "UNC tests" and "More UNC" features are relatively new and still contain bugs. The results may not be 100% accurate. I will fix these issues as soon as possible.

**Removed:**
- The **loading screen** has been completely removed due to numerous bugs and because it was considered unnecessary.

**Contact:**  
- If you encounter any issues, feel free to reach out via Discord: **Brxyk_ #berkcan61**

**Future Updates:**
- The Aimbot code will be completely rewritten due to numerous bugs and issues. Additionally, a toggle will be added to enable the aimbot to work with NPCs.
- Performance updates to optimize the experience, especially when there are many players in the lobby.

# Changelog Version 1.1.2  - Release Date: 2025-04-03

Fixed:

+ The issue where the FOV slider had to be adjusted before the aimbot toggle would work has been resolved. You can now use the aimbot toggle without needing to interact with the FOV slider.

# Changelog Version 1.1.1  - Release Date: 2025-04-02

+ Small bugs have been fixed.  
+ Added: New "Emote" tab.  
+ Added: You can now select an emote that is visible to other players. 

# Changelog Version 1.1.0 - Release Date: 2025-03-24

- Added a dynamic loading screen for ZaZa Hub.
- The loading screen includes a loading bar with changing colors (blue to yellow to green) based on the loading progress.
- Implemented animated text for loading stages: "Loading resources...", "Preparing game objects...", "Almost done...", and "Done!".
- The loading bar size and color animate smoothly with tween effects.
- Added a subtle text animation where the loading message "wobbles" to enhance visual appeal.
- The loading bar progress is dynamically updated and displays percentage values.
- Upon completion of the loading process, the loading screen elements fade out smoothly.

# Changelog V1 - Release Date: 2025-03-23

#### **New Features:**
  + **Colorpicker**:
    + **Color Pickers**: Added four color pickers to dynamically change the appearance of ESP elements:
    + **Box Colorpicker**: Change the color of the ESP box (default: red, `Color3.fromRGB(255, 0, 0)`).
    + **Line Colorpicker**: Change the color of the ESP lines (default: green, `Color3.fromRGB(0, 255, 0)`).
    + **Name Colorpicker**: Change the color of the player names (default: white, `Color3.fromRGB(255, 255, 255)`).
    + **Distance Colorpicker**: Change the color of the distance text (default: blue, `Color3.fromRGB(0, 255, 255)`).
      
  + **Callback**: Each color change updates the respective ESP element in real-time.

#### **Other Changes:**
- **X-ray Functionality**: Added an X-ray effect that makes non-human parts semi-transparent.
  - Implemented a toggle UI element to enable or disable the X-ray effect.
  - Transparency changes apply dynamically based on the toggle state.

#### **Code Enhancements:**
- **Variable Name Clarifications**: Adjusted some variable names to make their purpose clearer.
- **Direct Character Access**: Introduced a local variable `character` in the `RenderStepped` function to reduce repetition.

### **Summary:**
This release focuses on improving the **maintainability**, and **organization** of the code while adding new features such as color pickers for dynamic customization and X-ray functionality for enhanced visibility. The core ESP functionality remains unchanged, but overall usability has been significantly improved.

# Changelog - Version 0.1.3

+ Aimbot code has been completely rewritten.
+ Added: You can now change the color of the FOV and the locked FOV.
+ Added: New toggle for Rainbow FOV.
+ Added: New slider to adjust FOV thickness.
+ Added: Option to fill the FOV (Filled FOV).
+ Added: New sections for Aimbot, FOV settings, and Rainbow FOV.

**Future Updates:**
- A slider will be added for controlling the speed of the Rainbow FOV.

**Known Issues:**
- You need to adjust the FOV radius slider once for the Aimbot to work.

# Changelog - Version 0.1.2

- Replaced JumpSlider with an input field for a better experience, allowing you to use your desired jump force in different games.
- Added new teleport function: you can now teleport to an online player.
- **Known Issues**:
  - The Aimbot target speed cannot be set below 2, as it causes bugs. I will fix this as soon as possible.
  - These functions do not have a proper bypass, meaning some functions or even the entire script might not work in certain games. If you encounter problems, feel free to contact me on Discord at #berkcan61.

# Changelog - Version 0.1.1

- Added: Teleport feature to the Roblox script.
- Added: New tab for teleportation functionality.
- Added: Dropdown menu with 5 saved locations.
- Functionality: Select a location from the dropdown and teleport to that location.

# Changelog - Version 0.1.0

- Initial release of ZaZa Hub script.
- Added main window with tabs for ESP, Player, Aimbot, Settings, and Credits.
- Implemented ESP features (boxes, distance, health bars, etc.).
- Added player control options (speed, flight, noclip).
- Introduced Aimbot with smoothness control.
- Added keybind for Aimbot activation.
- Integrated SaveManager for saving configurations.
- Integrated InterfaceManager for UI management.
- Added notification system for script loading.
