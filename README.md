# midiXfade
DOSBox tool - 2x2 MIDI notes crossfading by volume control

### Requirements

- any DOSBox with MIDI UART mode configured in **dosbox.conf** file: *mpu401=uart*

### Screenshot

![screenshot](https://raw.githubusercontent.com/Kaproncai/midiXfade/main/screen.jpg)

### Control keys

- Channel #1: 12345678
- Channel #2: qwertyui (qwertzui)
- Channel #3: asdfghjk
- Channel #3: zxcvbnm, (yxcvbnm)
- Tempo*: left/right arrows 
- Tab: swap ch1-2 settings with ch2-3 settings
- ScrollLock: ch2 gets the same note as ch1 and ch3 gets the same note as ch4

*default: 13 (160 bpm)

### Channel volumes

![volume](https://raw.githubusercontent.com/Kaproncai/midiXfade/main/volume.jpg)

### Usefull references

- Instrument Definition Files used by OpenMIDIProject [https://openmidiproject.osdn.jp/documentations_en.html](https://openmidiproject.osdn.jp/documentations_en.html)


