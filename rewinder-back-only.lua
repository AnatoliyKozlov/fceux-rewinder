MAX_SAVED_STATES = 3000

savedStatesQueue = {}

while true do
    local joy = joypad.read(1)

    if (joy["select"]) then
        if (table.getn(savedStatesQueue) > 2) then
            savestate.load(savedStatesQueue[table.getn(savedStatesQueue) - 2]);

            table.remove(savedStatesQueue)
            table.remove(savedStatesQueue)

            gui.text(0, 50, "<< Rewind (" .. table.getn(savedStatesQueue) - 2 .. ")")
        else
            gui.text(0, 50, "No frames to rewind")
            savestate.load(savedStatesQueue[table.getn(savedStatesQueue)]);
        end
    else
        if (table.getn(savedStatesQueue) < MAX_SAVED_STATES) then
            newSave = savestate.create()
            savestate.save(newSave)

            table.insert(savedStatesQueue, newSave)
        else
            newSave = savestate.create()
            savestate.save(newSave)

            table.remove(savedStatesQueue, 1)
            table.insert(savedStatesQueue, newSave)
        end

    end

    -- gui.text(0, 10, "SavedStatesQueue size: " .. table.getn(savedStatesQueue))
    emu.frameadvance()
end