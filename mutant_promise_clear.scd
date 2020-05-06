// SUPERCOLLIDER WORKSHOP w/ MUTANT PROMISE
// 06-05-20
// JOANNE ARMITAGE


/*__________________________________________________________________/*

   OUTLINE

    - SuperCollider overview
    - Oscillators
    - Synthesis methods
    - Drone improvisation
    - Synthdefs
    - Envelopes
    - Effects

*/__________________________________________________________________*/


/*__________________________________________________________________/*

   WHAT IS SUPERCOLLIDER?
    - A programming language for sound synthesis an algorthmic music.
    - Used ny artists, musicians and resaerchers.
    - Open source and availaible on Mac, Linux and Windows

    - SuperCollider was developed by James McCartney and originally released in 1996. In 2002,
he generously released it as free software under the GNU General Public License.
It is now maintained and developed by an active and enthusiastic community.

*/__________________________________________________________________*/




/*__________________________________________________________________/*

   PREPARE YOURSELF

Computers are super logical and will only understand 'syntactically' correct code.
If you make a mistake your computer may ignore you, tell you off or freak out.

We need to learn some elements of coding--variables, iteration, conditional execution, messaging and containers.

Sometimes things come out louder than you expect PLEASE be careful with your ears.
They are amazing things. Sometimes the unexpected and unintentional can happen when
we are using audio programming—brace yourself for those syntax errors.

To hear sound, you need to be running the audio server.
*/__________________________________________________________________*/



/*__________________________________________________________________/*

   WHY SUPERCOLLIDER?

     - SuperCollider is wonderful for getting 'under the hood' of working with audio on the computer, it gives us options that maybe aren't available in something like Ableton.

     - We can learn about sound through controlling it in really direct ways and also learn a bit about code aswell.

     - There is an active community through a mailing list. Basis for many live coding languages. As it's open source people extend the language through libaries etc.

*/__________________________________________________________________*/





//(1) Variables

/*
A variable is a name for an object.

In other languages you need to declare your variables before using them, and you need to declare the type of the variable (that means you need to say if you plan to store a number or some text in a variable). In SuperCollider you don't specify the type because it automatically knows.

Variable names have something special about them in SuperCollider. In other languages you can use any name for your variable (as long as it's not a reserved word like while, for or if). SuperCollider distinguishes three types of names:

i) names which are one letter long, like a, b, c. These are global variables and can be used any time. The variable s is special, and it's predefined. It contains the local audio server, so don't use s. Use any other one letter variable between a and z.

ii) names that begin with tilde (~). These are also global variables and don't need to be declared, and can be long, like ~width, ~height, ~theSizeOfMyNose.

iii) You can also declare variables at the top of any block of code which you execute altogether (i.e. by selecting it all). In such a case that block of code is the variable's scope. Execute the block (in parentheses) and then the last line.

This explanation by Les Hutchins is really nice: http://sc3howto.blogspot.com/2005/02/object-oriented-programming.html

Also see Daniel Nouri if you want more understanding here: http://danielnouri.org/docs/SuperColliderHelp/Tutorials/Getting-Started/Functions%20and%20Other%20Functionality.html

*/

(
  var greeting;
  greeting = "hello world";
  greeting.postln;
)

//But if we run this line it is outside the 'scope' of the block and we get an error.
greeting




~joanne= "hello world"

~joanne

//We can do regular maths in SuperCollider

(
4 + 3.postln;
5 - 15;
8 * 9;
90 / 10;
)

"hello"

//You probably noticed all the stuff appearing over here ----->
//(It's down there on my window)
/*
      |
      |
      |
      |
      v
*/

//(2)Controlling the audio input/output

//This allows us to see what devices we can use for input i.e. your audio interface.
ServerOptions.inDevices


//This allows us to see what devices we can use for output i.e. your audio interface or bluetooth headphones. You could also set this to be something like Soundflower so you can route SC in to your DAW.

ServerOptions.outDevices

(
o = ServerOptions.new;

//The number of kilobytes of real time memory allocated to the server. This memory is used to allocate synths and any memory that unit generators themselves allocate (for instance in the case of delay ugens which do not use buffers, such as CombN), and is separate from the memory used for buffers. Setting this too low is a common cause of 'exception in real time: alloc failed' errors. The default is 8192.

o.memSize = o.memSize * 32;
//We are working with stereo so only need two input channels
o.numOutputBusChannels = 2;
o.inDevice = "UltraLite-mk4";
o.outDevice = "Built-in Output";
s.options = o;

)

s.boot

().play

/*We won't go too much into this (for now), but maybe we need to talk a little bit about the 'architecture' of SuperCollider. When we say architecture, we just mean how SuperCollider is organised, how it works.

scsynth--SuperCollider's sound generation. An audio server that can be controlled by Open Sound Control. We can kind of think about the server as an instrument store room where we can put our synths we make. OSC is a way of sending messages to these instruments, like if we gave someone instructions to go to the instrument store and make a certain sound. OSC is a bit like MIDI.

The really nice thing about the scserver is that it can be used separately from the SuperCollider environment. When we say environment, we mean basically this window that we are using right now. You know Tidal, Foxdot etc.? They all use scserver for synthesis.

For Max (previously Max MSP) users this is the MSP.

sclang--sclang is the SuperCollider progamming language, the code we type to make stuff happen.
This means that sclang is the Max... you could say?*/


// In order to see what code does we need to run it. To do this, put your cursor on the line of code that you want to run and press [SHIFT] + [RETURN].
//If you want to run a block of code (or more than one line) (or something between two (brackets) ) you use [CMD]/[CTRL] + [RETURN]

Shortcuts

// try running this:
"mutant promise <3".postln;

//"mutant promise <3" is some information that you're giving to supercollider and .postln tells supercollider what to do with it. in this case print it in the post window.

// the post window tells you lots of useful information about what's going on, but don't worry too much about understanding the messages for now.

//try changing "hello world" to some different text and running again.

// anything after "//" is a COMMENT. This is stuff that's useful for giving us context but that SuperCollider just ignores it.



s.boot; // if we want to make sound to in supercollider we need to run this line of code. you can also just hit cmd + B instead, or choose Language > Boot Server from the top menus.


//We can quit the server here. This will stop all sound!
s.quit;
//If we do this we need to boot it up again!

//So let's make some sound
().play // run this to make your first sound with SuperCollider!

//when we want to make sound we normally need to use the METHOD .play. Like .postln above this tells supercollider what to do with the information you give it.
// if you don't give it any information about what to play it will just play the default sound, which is what we just heard.






/*
Now that we have run code and gone on for a bit, let's have a play with some example code before we get back to learning syntax.

http://supercollider.sourceforge.net/audiocode-examples/
*/

//This one-liner by Lance Putnam is an example of how you can modulate the pitch of a single sine-wave oscillator in SuperCollider.

//Place your cursor on the text and run it:

s.scope

{SinOsc.ar(OnePole.ar(Mix(LFSaw.ar([0.5,1.12],[0,0.6],100,2000).trunc([500,600])*[1,-2]),0.98)).dup*0.1}.play

{Mix.new(SinOsc.ar(110, 0, 0.1).sum3rand) }.play;

{Mix.new([ PinkNoise.ar([0.1, 0.05]), FSinOsc.ar(200, 0.1), LFSaw.ar(40, 0.1)]) }.play

{Mix.new(Array.fill(12, { SinOsc.ar([500, 200] + 500.0.rand, 0, 0.05)})).tanh}.play;


{ SinOsc.ar(110).coin }.plot;

//trunc = truncate a to a multiple of b.
//See binary operators in SuperCollider

s.scope

//Try changing some of the values and hearing how the sound changes. To hear the change you have to run the code again. If you do this whilst the original sound is running you will hear the sounds layering up. To stop a sound you can press [CMD]/[CTRL] + [PERIOD].

//One thing you can do to deal with this problem is to setup SuperCollider for live coding (yes I'm a bit biased).. to do this we need to run this line of code. This code allows us to replace something that us being played on the server.

p = ProxySpace.push;


//Now we can do something like this

~lance = {SinOsc.ar(OnePole.ar(Mix(LFSaw.ar([0.5,1.12],[0,0.6],500,200).trunc([800,600])*[1,-2]),0.98)).tanh.dup*0.1.softclip}


//Ehhh? There's no sound. That's because we need to use the .play method like above ;).

~lance.play
//Now if we update or edit sounds in ~lance we here that the sounds don't overlap.
//We can also stop ~lance

~lance.stop

//Let's take another look at this...
//It's useful to give the sounds that we make a name so that we can easily find and use them later in our code. We will be mostly using global variables which we can control it from outside the


//We could call it

~joanne_louise_armitage
~horse

~plate

~raw_and_cooked

//Or anything that starts with a ~.
//What if we use a number or a capital letter? Try it?

//So we can create

~helen = { SinOsc.ar }

~helen.play // now we can start ~helen...
~helen.stop // ... and then stop her
~helen.clear


/*__________________________________________________________________/*

   UGENS
     - SinOsc is a type of waveform or oscillator in SuperCollider it is a type of Unit Generator or UGen. You can also get UGens for generating noise, panning and effects.
     - SuperCollider has over 250 UGens that you can find more information about here: http://doc.sccode.org/Guides/Tour_of_UGens.html
     - If you want to see more information about UGens then you can run [CMD] + [D] on the blue 'Ugen' text below to trigger the helpfile.

*/__________________________________________________________________*/

UGen



~greta = { Saw.ar(110, 0.2) }; ~greta.play
~tara = { PinkNoise.ar }; ~tara.play
~hannah = { Pulse.ar(100)}; ~hannah.play



//We can see the different shapes of our waves forms by running this line of code:
s.scope(2)

// Can you stop ~greta, ~tara and ~hannah?

// Normally waveforms have a specified pitch and volume because we didn't specify this, SuperCollider uses default values.

// These values are called 'arguments' and we place them in brackets after the oscillator.

~helen = { SinOsc.ar(freq: 765, phase: 0, mul: 0.7 )  }; ~helen.play
// try changing the numbers after 'freq:' and 'mul:' to turn ~alice into a new sound.

// 'mul' = amplitude,
// 'phase' = offset of signal but we won't look at this till later.

// We need to make sure there is a bracket after each argument so SuperCollider knows it's getting a new piece of information.


// writing the argument names is good for remembering what the numbers mean, but we can also write the same thing like this:

~helen = { SinOsc.ar(600, 0, 0.2) }; ~helen.play

// We can find out what arguments a waveform needs by looking at the helpfile - highlight SinOsc and hit [CMD] + [D].
//or if you start typing the arguments should appear in a pop up box as you type the first bracket.
//try adding your own arguments to ~andrea ~anne:

~andrea = { Saw.ar(freq: 200, mul: 0.1) }; ~andrea.stop
~anne = { PinkNoise.ar(0.9) }; ~anne.play


//We are giving SuperCollider instructions for making a synthesizer and we can make this more complicated using networks of UGens.

//In this example we are putting our SinOsc in a Pan2 UGen, what does it do?

~nic = {Pan2.ar(SinOsc.ar(440,0,0.1),0.0)}; ~nic.play

//Below we are adding ~helen to our SinOsc. Why don't you try using one of the different synths that we made?

~nick = {Pan2.ar(SinOsc.ar(440,0,0.1) + ~helen,0.0)}; ~nick.play

s.scope()

//Let's play around with another example. Look up some of

s.scope
(
~james = {({RHPF.ar(OnePole.ar(BrownNoise.ar, 0.1), LPF.ar(BrownNoise.ar, 14)
* 400 + 500, 0.03, 0.003)}!2)
+ ({RHPF.ar(OnePole.ar(BrownNoise.ar, 0.99), LPF.ar(BrownNoise.ar, 20)
* 800 + 1000, 0.03, 0.005)}!2)
* 4};
~james.play
)

//So what *is* SinOsc? In SuperCollider it's something called a Unit Generator or UGen.
//I think we should have a little look at how these waveforms/oscillators work...

/*
http://www.howmusicworks.org/103/Sound-and-Music/Amplitude-and-Frequency

Frequency of a sound is the speed of the vibration, and this determines the pitch of the sound.

Frequency is measured as the number of wave cycles that occur in one second.  The unit of frequency measurement is Hertz (Hz for short).

A frequency of 1 Hz means one wave cycle per second.  A frequency of 10 Hz means ten wave cycles per second, where the cycles are much shorter and closer together.

More info relating to this here: https://en.wikibooks.org/wiki/Sound_Synthesis_Theory/Oscillators_and_Wavetables

*/

// We can mix the different sounds that we have running using the line of code below. This allows us to mix ~helen and friends to the loudnesses we want.

ProxyMixer.new(p);

// We can turn sounds on and off and also control their volume using this mixer.

// If we make a new sound now it'll appear in the mixer

~dorien = { Impulse.ar(50) }

//We can see the overall sound output level here
s.meter

/*__________________________________________________________________/*

   ADDITIVE SYNTHESIS

     - Playing lots of pitches at the same time.
*/__________________________________________________________________*/

// If we want to play multuple pitches at the same time we can create something called an array using square brackets [92, 56, 73]

~sarah = {Saw.ar([202, 200], 0.1) }; ~sarah.play

// What do you hear happening?

//Run this code, do you hear any change?
~sarah = {Saw.ar([800, 200, 1000, 232], 0.1) }; ~sarah.play

// These Synths keep the same number of channels.
// SuperCollider would sees [800, 200] as making a 2 channel sound with frequency of 800 in the left (1st) channel and frequency 200 in the right (2nd) channel.
// If we add more pitches to ~jane now it'll keep adding them to the first channel - as we only had 1 channel when we ran it the first time.

~jane = {Saw.ar([300, 200, 89, 65], 0.1) }; ~jane.play

//If we add more pitches to ~betty it'll keep alternating the pitches between left and right channels.

~akeelah = {Saw.ar([100, 1], 0.1)}; ~akeelah.play

// Add some more numbers remembering the comma

// You might remember above we used the Pan2 UGen to hear one frequency in both channels. We can use Mix to hear all the pitches in one channel.

~marlo = { Mix.new(SinOsc.ar([100, 205, 212, 456, 568, 872, 8000], 0, 0.1) ) }; ~marlo.play

//Splay spreads channels across the stereo field. You can hear higher sounds in the right ear and lower in the left.
s.scope
~marlo_1 = { Splay.ar(~marlo, 0, 0.1)}; ~marlo_1.play

s.scope

//And it we want to hear all in the left and right

~marlo_1a = { Pan2.ar(~marlo, 0, 0.1) }; ~marlo_1a.play

// So we have just placed SinOscs in other UGens to have more control about how the sound is placed in the stereo field.
// We have also layered different frequencies to create more complex sounds.
// Now let's try  some techniques for creating sounds of increasing complexity.



/*__________________________________________________________________/*

   SUBTRACTIVE SYNTHESIS

     - A method of sound synthesis where some frequencies of an audio signal are attenuated (or reduced) in amplitude using a filter
     - There are different types of filter you can use.
     - Low Pass Filter (LPF) specifies a cut off frequency where anything above it is removed.
          if we set the cut off at 100 Hz, anything above that will be removed from the signal
     - High Pass Filter (HPF) similar to LPF but anything LOWER than the cut off is removed from the      signal.
     - Band pass filter (BPF)  frequencies around a central point.
*/__________________________________________________________________*/

// Let's add a LPF to ~marlo! In the RLPF UGen the first argument is the input signal, we are using ~marlo. Then we give the cut off frequency. The third value is RQ which is the resonance of the filter which is the amount of amplification given to frequencies around the cut off frequency.

//To add the filter to the white noise signal we 'nest' them in eachohter. It's kind of like patching on a modular synthesizer!
~jane = {Splay.ar(Array.fill(100, { SinOsc.ar([20000, 200] + 500.0.rand, 0, 0.05)})).tanh};
~jane.play

~filter_jane = { RLPF.ar(~jane, 100, 0.8, 0.9)  }; ~filter_jane.play

// Let's add a LPF to ~marlo!

~filter_jane_2 = { RHPF.ar(~jane, 500, 0.8, 0.9)  }; ~filter_jane_2.play // here's another example with a high pass filter.

s.scope

//Let's try this with a different example using the mouse to control the cut off point?

~annabel = {WhiteNoise.ar(0.1)}; ~annabel.stop

//We can write this out fully:
~filter_annabel1 = {RLPF.ar(WhiteNoise.ar(0.1), MouseX.kr(100, 10000))}; ~filter_annabel.play
//Or as
~filter_annabel2 = {RLPF.ar(~annabel, MouseX.kr(100, 2000), MouseY.kr(0, 1.0))}; ~filter_annabel.play

//Both sound exactly the same (because they are).
//Can you change the filter type? What about the cut off?
//Add some Q?!
//Try using other filters try LPF, RPLFD Resonz, what do they do?



/*_______________________________________________________________________________________________/*

   ENVELOPES

      - What if you want to make something that isn't just a drone. How do we shape how a sound        sounds or control how it is articulated by the computer.
      - Well the answer to this is envolopes... but as is life in the world of audio programming, we have to go through a few most stages to get there.
      - At the moment we are just making a synth and setting it to never endingly play until we tell it to stop.
      - Envelopes control the amplitude of the sound from it's start to the end.
      - But what would happen it we added an envelope to a sound that we have already made?
      - .........???

      - So we need to be able to send a sequence of messages to synthesizer sound to play a melody.
      - We will quickly see some example Envelopes when looking at SynthDefs next.
*/_______________________________________________________________________________________________*/


{SinOsc.ar(440,0,Line.kr(0.5,0.0,1.0))}.scope


{SinOsc.ar(440,0,Line.kr(0.1,0,1,doneAction:2))}.scope


//We can use other Ugens to generate values to control elements of the filter.
~sara = {PinkNoise.ar(0.2)};

~filter_sara = {RLPF.ar(~sara, Line.kr(10000,1000,10))}; ~filter_sara.play
s.scope
//What do you hear happening here? Try changing the values, can you work it out?

/*__________________________________________________________________/*

   CHALLENGE💪

     - Create a source using a Saw waveform..
     - Filter it using a high pass filter.
     - Set the cut off freq to 600.
     - Make the resonance go from 0.1 to 1 in 5 seconds.
*/__________________________________________________________________*/


























//Answer

~trish ={RHPF.ar(Saw.ar([600, 450, 899], 0.2), 600, Line.kr(0.1, 1, 5, doneAction:2))};
~trish.scope
~trish.play





/*__________________________________________________________________/*

   SOME MODULATING

*/__________________________________________________________________*/

//Herr the SinOsc frequency effects how quickly the amplitude changes and the mul and add are how much it changes.

~catherine = { Pulse.ar([100, 120], 0.5, SinOsc.kr(10, 0, 0.5, 0.5))  }; ~catherine.play // the

//We can use .range to constrain values specifying the upper and lower limits of the modulation.

~catherine = { Pulse.ar([100, 120], 0.5, SinOsc.kr(10).range(-5, 12))  }

// you can use other waveforms to modulate the amplitude. e.g.:

~catherine = { Pulse.ar([100, 120], 0.5, Saw.kr(1).range(0, 1))  }
~catherine = { Pulse.ar([100, 120], 0.5, LFNoise1.kr(100).range(0, 1))  }


/*__________________________________________________________________/*

   EXAMPLE

     - Taken from Nick Collins' tutorials
*/__________________________________________________________________*/

(
{
	var n = 3; 	//try changing me to 34, or 3, and then re-running...

	Resonz.ar(
		Mix.fill(n,{

			var freq=rrand(28,560.3);
			var numcps= rrand(2,20);

			Pan2.ar(Gendy2.ar(3.rand,6.rand,1.0.rand,1.0.rand,freq ,freq, 1.0.rand, 1.0.rand, numcps, SinOsc.kr(exprand(0.02,0.2), 0, numcps/2, numcps/2), 0.5/(n.sqrt)), 1.0.rand2)
		}),
		MouseX.kr(100,2000),
		MouseY.kr(0.01,1.0)
	);
}.play
)






/*__________________________________________________________________/*

   EFFECTS

      - An effect processes a sound
      - There are loads of different effects we can apply to sound.
      - They (re)shape sound and make it do something a bit different.
      - Delay, reverb, filtering

     https://www.youtube.com/watch?v=0I1QTi6TDVM
*/__________________________________________________________________*/


~daphne = { GVerb.ar(~tina.ar, 10, 0.1) }

~delia = { CombC.ar(~laurie.ar, 1, 0.05)  }

~dolores = { Decimator.ar(~hannah.ar, 44100 * 1, 2) }

~dorothy = { DFM1.ar(BPF.ar(~hannah.ar, 600, 0.3), 600, 0.99) }



/*__________________________________________________________________/*

   SYNTHDEFS

      - You can define parameters to be controlled by a sequence i.e. frequency, duration, sustain, noise, pan etc.
      -

     https://www.youtube.com/watch?v=0I1QTi6TDVM
*/__________________________________________________________________*/


//A SynthDef
(
SynthDef(\sn, { |out=0,amp=0.1,sustain=0.1,freq=440, pan=0|
	var snd, env, panner;

	snd = Pulse.ar([100, 120], 0.5, SinOsc.kr(10, 0, 0.5, 0.5));

	env = EnvGen.ar(Env.perc(0.01,sustain),doneAction:2);

	panner = Pan2.ar(snd, pan, env);

	OffsetOut.ar(out, panner);
}).add;

)

//Your SynthDef
(
SynthDef(\catherine, { |out=0,amp=0.1,sustain=0.1,freq=440|
	var snd, env;

	snd = Pulse.ar([100, 120], 0.5, SinOsc.kr(10, 0, 0.5, 0.5));

	env = EnvGen.ar(Env.perc(0.01,sustain),doneAction:2);
	OffsetOut.ar(out, snd * env * amp);
}).add;
)

//Triggers one sound to test it's working
x = Synth(\sn);

//Control parameters of the SynthDef
x = Synth(\sn, [\freq, 800, \sustain, 5, \pan, -1]);


//We will be looking at how we can control SynthDefs better next time.



/*__________________________________________________________________/*

   RECORD IT!

      - More info on recording here!



*/__________________________________________________________________*/

s.record()

s.stopRecording;

//You can also do this using an interface pulled up by running the code below

s.makeWindow



/*__________________________________________________________________/*

   MORE RESOURCES
     - Nick Collins tutorials: http://community.dur.ac.uk/nick.collins/teaching/supercollider/sctutorial/tutorial.html
     - Les Hutchins (abandoned) http://www.berkeleynoise.com/celesteh/projects.html
     - Sean Cotterill https://theseanco.github.io/howto_co34pt_liveCode/

*/__________________________________________________________________*/


//EXTRA CONTENT


/*__________________________________________________________________/*

   RING MODULATION

     Ring Modulation and Amplitude Modulation are very similar techniques.
Both involve a carrier wave being modulated.

The difference between them is the polarity of the signal that is being modulated.
    - Unipolar
    - Bipolar

In ring modulation - a bipolar signal (carrier) is modulated with another bipolar signal (modulator).

RingMod(t) = Carrier(t) * Modulator(t)
*/__________________________________________________________________*/

s.scope

~heather = {SinOsc.ar(440,0,0.5) ! 2}; ~heather.stop;
~bethany = {SinOsc.ar(1,0,0.5) ! 2}; ~bethany.stop;

~tina = {~heather * ~bethany ! 2}; ~tina.play;

//Try changing the frequency and amplitude of ~heather and ~kate to see what happens

//When the modulation frequency < 20 Hz what does the effect sound like?
//What happens when we take the modulation frequency above 20 Hz?



//We begin to hear a change in timbre... try it!


//Use your mouse to control the Carrier and Modulator frequencies. Watch how the Spectogram changes.
FreqScope.new();


//Find a pitch. Starting from the bottom slowly increase the position of your mouse on the Y axis.
//This increases the modulation frequency—What happens?

~heather = {SinOsc.ar(MouseX.kr(20,5000,'exponential'),0,0.5) ! 2}; ~heather.stop;
~bethany = {SinOsc.ar(MouseY.kr(0.1,5000,'exponential');,0,0.5) ! 2}; ~bethany.stop;

/*
As we raise the modulation frequency, we can see two other partials emerge and the carrier frequency implode.

These extra frequencies that appear are called sidebands.
—How many sidebands appear?
—Where do they appear?
—What are their frequencies?
*/




/*__________________________________________________________________/*

   AMPLITUDE MODULATION

     AM occurs when a bipolar signal (carrier) is modulated with a unipolar signal

     Here we add an offset SinOsc.ar(freq, phase, mul, add)
     The *add* moves the once bipolar signal above 0 -> unipolar.

     AmpMod(t) = Carrier(t) * Modulator(t)
*/__________________________________________________________________*/




~katrin = {SinOsc.ar(440,0,0.5) ! 2}; ~katrin.stop; //bipolar
~becky = {SinOsc.ar(23,0,0.5,0.5) ! 2}; ~becky.stop; //unipolar add an offset

//Change the frequency and amplitude values of ~heather and ~helen to see what is going on.

~hannah = {~katrin * ~becky ! 2}; ~hannah.play

//We can use the mouse/trackpad to scroll through lots of different frequencies. Pick a frequency and slowly move the mouse upwards.

~katrin = {SinOsc.ar(MouseX.kr(20,5000,'exponential'),0,0.5) ! 2}; ~katrin.stop; //bipolar
~becky = {SinOsc.ar(MouseY.kr(0.1,5000,'exponential'),0,0.5, 0.5) ! 2}; ~becky.stop; //unipolar add an offset


/*
NB if you want to find out the values you are getting from MouseX and MouseY, just add .poll at the end of the ugen

i.e MouseY.kr(0.1,5000,'exponential').poll
*/



/*__________________________________________________________________/*

   FREQUENCY MODULATION

     - FM(t) = A x sin(C(t) + [I x sin(M(t))])
     - A = peak amplitude of carrier
     - C(t) = 2pi * C
     - M(t) = 2pi * M
     - I = index of modulation

Modulation Frequency
Affects the rate of change in the carrier frequency.


Modulation Index
Affects the depth of change in the carrier frequency.

*/__________________________________________________________________*/


//Simple FM or Chowning FM


~fm1 = {SinOsc.ar([500, 600] + (75*SinOsc.ar(SinOsc.ar(789, 1))))}; ~fm1.play;

//Can also be written

~osc2 = {SinOsc.ar(1)}; ~osc2.stop;
~osc1 = {SinOsc.ar([560, 560] + (100*~osc2), 0, 0.6)}; ~osc1.play;

/*
Set the ~fm1 synth below to the following parameter values:

EXAMPLE 1
Carrier Frequency = 400 Hz
Modulator Frequency = 200 Hz


EXAMPLE 2
Carrier Frequency = 356 Hz
Modulator Frequency = 220 Hz

*/

~fm1 = {SinOsc.ar(100 + (MouseX.kr(0.1,2000,1)*SinOsc.ar(678)), 0, 0.1 ) ! 2}; ~fm1.play;

/*
The relationships between the Carrier + Modulator Frequency is called the C:M ratio

—What is the CM ratio for each of the examples above?

Harmonic Spectra -> if there is an integer ratio between C:M
Inharmonic Spectra -> if there is non-integer ratio between C:M

*/

/*
Control the modulator frequency and index with the mouse
*/

~fm1 = {SinOsc.ar(440 + SinOsc.ar(MouseX.kr(2,2000,1), 0, MouseY.kr(1,1000)), 0, 0.5)!2}; ~fm1.play;
