save_array = {}
save_offset = 1;
highest_save = 0; --highest save that has actually been created yet
rewinds = 0;
frame_count = 0;
SAVE_MAX = 3000;
	--save every __ frames. Stretch your rewind power further!
	--Small values (1-5) recommended
SAVE_FREQ = 4;

while true do

	local joy = joypad.read(1);
	frame_count = frame_count + 1;

	--do rewinding
	if (joy["select"]) then
		rewinds = rewinds + 1;
		if rewinds < SAVE_MAX then
			gui.text(0, 200, "<< rewind");
			save_offset = save_offset - 1;
			--loop around, only if we've filled the whole array once
			if save_offset < 1 then
				if highest_save == SAVE_MAX then save_offset = SAVE_MAX else save_offset = 1 end
			end

			savestate.load(save_array[save_offset]);
		else
			--wipe out the array to prevent out-of-order saves from being loaded when we loop
			save_array = {};
			save_offset = 1;
			highest_save = 0;
		end
	else
		--make a new save, add it to the collection
		if frame_count >= SAVE_FREQ then
			save = savestate.create();
			savestate.save(save);
			save_array[save_offset] = save;
			save_offset = save_offset + 1;
			frame_count = 0;
		end

		rewinds = 0;
	end

	--loop around when we go over the limit
	if save_offset > SAVE_MAX then save_offset = 1 end

	--record the highest seen save offset as we reach it
	if save_offset > highest_save then highest_save = save_offset end

	emu.frameadvance();
end