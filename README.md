# Verilog-Running-Average-8

I created this circuit in Verilog, for my high level synthesis course. The objective of it was to create a circuit that computes the running average of last 8 8-bit numbers inputted into it. We were instructed to create two implementations of the circuit. One that used as many adders as necessary in one clock cycle, and then one that could only use one adder.

The idea, was that we could reduce the size/cost of the circuit by limiting the number of adders and simply increase the number of clock cycles. However, I found that the "1-adder" circuit was almost 4 times as large as the multi adder circuit on a FPGA (based on # of LUT's). This was due to the logic of the 10 cycle FSM I had to implement in order to manage the single adder.

Overall, we saw that difficulty can arrise when trying to implement constraints in verilog. This is contrast to HLS, where those constraints can be easily specified.
