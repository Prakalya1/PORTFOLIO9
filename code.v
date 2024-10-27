module Eight_ifft(a_real, a_imag, b_real, b_imag, c_real, c_imag, d_real, d_imag, e_real, e_imag, f_real, f_imag, g_real, g_imag, h_real, h_imag,
                  A_real, A_imag, B_real, B_imag, C_real, C_imag, D_real, D_imag, E_real, E_imag, F_real, F_imag, G_real, G_imag, H_real, H_imag);

    input signed [31:0] a_real, a_imag;
    input signed [31:0] b_real, b_imag;
    input signed [31:0] c_real, c_imag;
    input signed [31:0] d_real, d_imag;
    input signed [31:0] e_real, e_imag;
    input signed [31:0] f_real, f_imag;
    input signed [31:0] g_real, g_imag;
    input signed [31:0] h_real, h_imag;

    output signed [31:0] A_real, A_imag;
    output signed [31:0] B_real, B_imag;
    output signed [31:0] C_real, C_imag;
    output signed [31:0] D_real, D_imag;
    output signed [31:0] E_real, E_imag;
    output signed [31:0] F_real, F_imag;
    output signed [31:0] G_real, G_imag;
    output signed [31:0] H_real, H_imag;

    real p = 0.707;  // Cos(pi/4) = Sin(pi/4)

    // Add the inputs to get the sums (real and imaginary parts)
    assign A_real = (a_real + b_real + c_real + d_real + e_real + f_real + g_real + h_real) >>> 3;
    assign A_imag = (a_imag + b_imag + c_imag + d_imag + e_imag + f_imag + g_imag + h_imag) >>> 3;

    // Conjugated twiddle factors and scaling by 8 for the IFFT calculation
    assign B_real = ((a_real - e_real) + p * ((b_real - f_real) + (h_real - d_real))) >>> 3;
    assign B_imag = ((a_imag - e_imag) + p * ((b_imag - f_imag) + (h_imag - d_imag))) >>> 3;

    assign C_real = ((a_real - e_real) - p * ((b_real - f_real) + (h_real - d_real))) >>> 3;
    assign C_imag = ((a_imag - e_imag) - p * ((b_imag - f_imag) + (h_imag - d_imag))) >>> 3;

    assign D_real = ((a_real - e_real) + p * ((d_real - h_real) + (f_real - b_real))) >>> 3;
    assign D_imag = ((a_imag - e_imag) + p * ((d_imag - h_imag) + (f_imag - b_imag))) >>> 3;

    assign E_real = (a_real + e_real - g_real - c_real) >>> 3;
    assign E_imag = (a_imag + e_imag - g_imag - c_imag) >>> 3;

    assign F_real = ((a_real - e_real) + p * ((h_real - f_real) - (d_real - b_real))) >>> 3;
    assign F_imag = ((a_imag - e_imag) + p * ((h_imag - f_imag) - (d_imag - b_imag))) >>> 3;

    assign G_real = (a_real + e_real - g_real - c_real) >>> 3;
    assign G_imag = (a_imag + e_imag - g_imag - c_imag) >>> 3;

    assign H_real = ((a_real - e_real) - p * ((b_real - h_real) - (d_real - f_real))) >>> 3;
    assign H_imag = ((a_imag - e_imag) - p * ((b_imag - h_imag) - (d_imag - f_imag))) >>> 3;

endmodule
