## Verilog Flip-Flop Macros

Code Author: [Chris Drake](https://github.com/cjdrake)

Chris Drake's blog [Fuzzy Logic](http://cjdrake.github.io) had a particular post titled [Verilog Flip-Flop Macros](http://cjdrake.github.io/verilog-flip-flop-macros.html) which I ([Eldon Nelson](http://tenthousandfailures.com)) thought was really good.  It deals with creating an abstraction of a flip-flop in SystemVerilog.  Check it out.

He mentions that there is a two orders of magnitude difference in performance in implementing the macro abstraction versus the module abstraction of a flip-flop.  I had to try out the example.  I was not going to sit for a simulation to run for fifty minutes, but I did bring down the iterations to make it run in a more reasonable amount of time - about a minute on my machine for the longer run.  I verifed that the performance difference between the two methods is as stated.

I'll forward this on to our EDA vendor to see if there is some hope to improve the runtime.

I agree with Chris that I hate using macros in SystemVerilog.  I really like his solution to creating modules that implement basic logic design elements in a guaranteed way without the cheat of a macro.  His module implementation looks clean and fits the style of SystemVerilog.

## Instruction to Run

Command Line for Mentor Questa
```
vlib work
time vsim -64 -c -do run.do
```
