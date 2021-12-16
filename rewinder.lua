MAX_SAVED_STATES = 3000

savedStatesQueue = {}
framesRewind = 0
startRewindFrame = 0

while true do
	local joy = joypad.read(1)

	if (joy["select"]) then
		framesRewind = framesRewind + 1

		if (startRewindFrame == 0) then
			startRewindFrame = table.getn(savedStatesQueue)
		end
		if (table.getn(savedStatesQueue) > 2 and (startRewindFrame - 2 - framesRewind) > 1) then
			save = savedStatesQueue[startRewindFrame - 2 - framesRewind]

			savestate.load(save);
			table.insert(savedStatesQueue, save)

			table.remove(savedStatesQueue, 1)
			startRewindFrame = startRewindFrame - 1

			gui.text(0, 50, "<< Rewind (" .. startRewindFrame - 2 - framesRewind .. ")")
		else
			gui.text(0, 50, "No frames to rewind")
			savestate.load(savedStatesQueue[table.getn(savedStatesQueue)]);
		end
	else
		framesRewind = 0
		startRewindFrame = 0

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