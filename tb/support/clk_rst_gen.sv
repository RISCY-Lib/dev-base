/**************************************************************************
 * Clock Generation module                                                *
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

`timescale 1ns/1ps

module clk_rst_gen #(
  parameter int CLK_PERIOD_NS = 10,
  parameter int RESET_LENGTH = 3
) (
  // Clock/Reset Signals
  output logic clk,
  output logic rst
);

  initial begin
    clk_out = '0;
    forever begin
      #(CLK_PERIOD_NS) clk_out <= ~clk_out;
    end
  end

  initial begin
    rst_low_out <= 1'b0;
    repeat(RESET_LENGTH) begin
      @(posedge clk_out);
    end
    rst_low_out <= 1'b1;
  end

endmodule