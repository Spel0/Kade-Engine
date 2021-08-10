function start(song)

end

function beatHit(beat)
    if beat == 10 then
        changeNoteStyle('pixel');
    elseif beat == 32 then
        changeNoteStyle('normal');
    elseif beat == 64 then
        changeNoteStyle('pixel');
    elseif beat == 92 then
        changeNoteStyle('normal');
    end
end