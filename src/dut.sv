/**************************************************************************
 * Placeholder for top-level design                                       *
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

module dut #(
  parameter int WIDTH = 8
) (
  input wire clk_in,
  input wire rst_low_in,

  input  wire  [WIDTH-1:0] sw_in,
  output logic [WIDTH-1:0] led_out
);

  always_ff @(posedge clk_in, negedge rst_low_in) begin
    if (!rst_low_in) begin
      led_out <= '0;
    end
    else begin
      led_out <= sw_in;
    end
  end

endmodule
