## OMW-CreeperInfiniteGold

### For OpenMW (0.51.0 Release)  

- Copy-paste the `CreeperInfiniteGold/` Directory somewhere safe
- Open `OpenMW Launcher -> Data Directories -> Append`
- Locate the `CreeperInfiniteGold/` Directory and add it
- Go back to `Content Files` in the launcher, make sure you enable `CreeperInfiniteGold.omwscripts`

- Alternatively, go to your user config (usually under `Documents\My Games\OpenMW\openmw.cfg`)
- Add the lines `data="$PATH_TO/Documents/OMW Mods/CreeperInfiniteGold"` (replacing $PATH_TO with your path)
- as well as `content=CreeperInfiniteGold.omwscripts`

### For TES3MP Server (0.8.1)

- Locate your server installation
- place `infiniteCreeper.lua` in `server/scripts/custom` (make sure the directory exists)
- Add the line `require("custom.infiniteCreeper")` to `server/scripts/customScripts.lua`
