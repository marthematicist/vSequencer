# vSequencer
A video sequencer platform built in Processing (https://processing.org/)

Vision: A video sequencing VJ platform consisting of a client and server.
  - Client: Handles all tempo and sequencing controls. Runs on a Raspberry PI with a custom-designed interface (touch screen and physical buttons). Communicates tempo and sequencing data to the server.
  - Server: Handles network communication and image/video creation.

Done:
  - built Metronome object to control tempo. Tempo is set manually via button control (tap), and testing shows it is sufficiently relaible.
  - got server-client communication up-and-running: Server syncs to tempo set by client.


To do:
  - Plan out human interaction with client platform. Determine physical layout and design play flow.
  - Design how sequencer will interact with renderer
  - Design structure for sketches that can be linked to sequencer as "voices"
  - Design sequencer to run on client and server side.
  - Design some sketches
  - Test
  - Play
  - Practice
  - Perform
