---
layout: post
title: "PipeWire has built-in VBAN support!"
date: 2024-11-05 15:30:19 -0800
---

### RIP `audio-bicycle`, 2022-2024

I recently went to make some changes to my old project, audio-bicycle, but I found that it was no longer necessary!
PipeWire now has built-in VBAN support ([send], [recv]), and this works well enough for me that I no longer need
audio-bicycle. I'm kind of sad to see it go, but its name will live on in the configuration of my new setup.

However, there were a few gotchas I encountered while setting this up. For context, my configuration is designed to
take outgoing audio from my Linux desktop running PipeWire, and send it to my Windows machine running VoiceMeeter to
be output on the speakers. The Windows machine also sends microphone audio back to the Linux machine, for use in voice
calls. I like to listen to music while I work, so I need a completely clean signal with no noise.

### Audio Rate and Format

The defaults for the VBAN modules are not very good, picking 44100 Hz rate and S16LE format. This requires remixing
from my 48000 Hz S24LE audio, which introduces some artifacts. I recommend checking what you're using with `pw-top`
and setting the VBAN modules to match, or at least transferring S24LE audio. Here's the settings I used on each module:
```
audio.format = "S24LE"
audio.rate = 48000
```
You should also make sure that VoiceMeeter is configured to use the same settings on its sending side, as PipeWire will
not check or do any conversion for you :(.

### Latency

PipeWire's VBAN modules also pick very high latency numbers, presumably because they expect to be used over the 
internet. I adjusted these down for the very low latency I have on my local network:
```
# For send and recv, keeps a smaller buffer.
sess.latency.msec = 1

# For send only, minimizes the time between packets
sess.min-ptime = 0
```

### Miscellaneous

I needed to increase the quantum in order to prevent certain applications from not having enough buffer, like `mpv`.
Putting `node.force-quantum = 512` on each module's stream seemed to be enough, but this is likely
environment-dependent.

Finally, I had to set `node.always-process = true` on both modules to ensure that the audio was always being sent and
received. This is because the modules will stop processing audio if there is no stream connected otherwise, and this
can cause noise when starting a new stream. This made noticeable pops when starting music or skipping tracks, which
was very annoying. I assume the same could occur with the microphone, but I haven't tested it. The cost of ~3% of one
CPU core is worth it to me to avoid this noise.

For reference, here's my final configuration file `01-audio-bicycle.conf`:
```
context.modules = [
    {
        name = libpipewire-module-vban-recv
        args = {
            source.ip = 10.190.229.127
            sess.latency.msec = 1
            sess.name = "audio-bicycle"
            audio.format = "S24LE"
            audio.rate = 48000
            stream.props = {
                media.class = "Audio/Source"
                node.name = "VBAN Mic"
                node.description = "VBAN Mic"
                node.always-process = true
                node.force-quantum = 512
            }
        }
    }
    {
        name = libpipewire-module-vban-send
        args = { 
            source.ip = 10.190.229.127
            destination.ip = 10.190.229.105
            sess.min-ptime = 0
            sess.latency.msec = 1
            sess.name = "audio-bicycle"
            audio.format = "S24LE"
            audio.rate = 48000
            stream.props = { 
                media.class = "Audio/Sink"
                node.name = "VBAN Speakers"
                node.description = "VBAN Speakers"
                node.always-process = true
                node.force-quantum = 512
            }   
        }   
    }
]
```

[send]: https://docs.pipewire.org/page_module_vban_send.html
[recv]: https://docs.pipewire.org/page_module_vban_recv.html
