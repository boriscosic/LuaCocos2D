print("Loading menu...")

local menu = Menu
menu:add("Start Game", "onStartGame", 0, 20)
menu:add("Help", "onHelp", 0, -20)
menu:render()