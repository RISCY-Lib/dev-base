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

class base_test extends uvm_test;
  `uvm_component_utils(base_test);

  virtual interface dut_if intf;

  function new (string name, uvm_component parent);
    super.new(name, parent);
    if (!uvm_config_db #(virtual interface duf_if)::get(null, "*", "dut_if", intf))
      $fatal("Failed to get DUT Interface");
  endfunction : new

  function void build_phase (uvm_phase phase);
    
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_ojection(this);

    phase.drop_objection(this);
  endtask : run_phase

endclass