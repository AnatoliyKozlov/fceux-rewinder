# FCEUX Rewinder

## How to use
### Load script
1) Open your game in FCEUX
2) File -> Load Lua Script
3) Change [rewinder.lua](rewinder.lua) for field 'Script file'
4) Press 'Start'

### Activate rewind
For activate rewind - press 'select' button.

## Difference with original source
1) Removed GUI text with (save_offset highest_save). Because it distracts the user and does not carry valuable information for him.
2) Add GUI text "<< rewind" when activate rewind.
3) Max frames for save increase from 1000 to 3000

### Comment from [original source](https://github.com/BillyWM/FCEUX-Lua-Script-Collection/blob/master/rewind.lua)
```
Author: Billy Wenge-Murphy (http://billy.wenge-murphy.com/)
Inspired by, but mostly NOT based on, original rewinder script by Antony Lavelle
(I couldn't quite follow  your code. Sorry!)

"(C) Antony Lavelle 2009	got_wot@hotmail.com		http://www.the-exp.net"
"This is my first ever time scripting in Lua, so if you can improve on this idea/code please by all means do and
redistribute it, just please be nice and include original credits along with your own :)"
```