/**************************************************************************
 * Test-bench for top-level design                                        *
 * Copyright (C) 2022, Benjamin Davis                                     *
 *                                                                        *
 * This program is free software: you can redistribute it and/or modify   *
 * it under the terms of the GNU General Public License as published by   *
 * the Free Software Foundation, either version 3 of the License, or      *
 * (at your option) any later version.                                    *
 *                                                                        *
 * This program is distributed in the hope that it will be useful,        *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of         *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          *
 * GNU General Public License for more details.                           *
 *                                                                        *
 * You should have received a copy of the GNU General Public License      *
 * along with this program.  If not, see <https://www.gnu.org/licenses/>. *
 **************************************************************************/

module tb ();

  import uvm_pkg::*;
  `include uvm_macros.svh;

  logic clk;
  logic rst_low;

  clk_rst_gen #(
    .CLK_PERIOD_NS (5),
    .RESET_LENGTH  (5)
  ) clk_rst_gen_i (
    .clk      (clk),
    .reset_low(rst_low)
  );

  dut_if dut_if_inst ();

  dut #(
    .WIDTH(8)
  ) inst_dut (
    .clk_in     (clk),
    .rst_low_in (rst_low),

    .sw_in   (bfm.sw),
    .led_out (bfm.led)
  );

  // Kick-off the UVM test
  initial begin
    uvm_config_db #(virtual interface dut_if)::set (null, "*", "dut_if", dut_if_inst)
    run_test();
  end

endmodule