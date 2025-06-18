`timescale 1 ns / 1 ps

module AES_ip_v10_0_S00_AXI #
(
    // Users to add parameters here

    // User parameters ends
    // Do not modify the parameters beyond this line

    // Width of S_AXI data bus
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    // Width of S_AXI address bus
    parameter integer C_S_AXI_ADDR_WIDTH = 6
)
(
    // Users to add ports here

    // User ports ends
    // Do not modify the ports beyond this line

    // Global Clock Signal
    input wire  S_AXI_ACLK,
    // Global Reset Signal. This Signal is Active LOW
    input wire  S_AXI_ARESETN,
    // Write address (issued by master, acceped by Slave)
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
    // Write channel Protection type. This signal indicates the
    // privilege and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
    input wire [2 : 0] S_AXI_AWPROT,
    // Write address valid. This signal indicates that the master signaling
    // valid write address and control information.
    input wire  S_AXI_AWVALID,
    // Write address ready. This signal indicates that the slave is ready
    // to accept an address and associated control signals.
    output wire  S_AXI_AWREADY,
    // Write data (issued by master, acceped by Slave) 
    input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
    // Write strobes. This signal indicates which byte lanes hold
    // valid data. There is one write strobe bit for each eight
    // bits of the write data bus.    
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
    // Write valid. This signal indicates that valid write
    // data and strobes are available.
    input wire  S_AXI_WVALID,
    // Write ready. This signal indicates that the slave
    // can accept the write data.
    output wire  S_AXI_WREADY,
    // Write response. This signal indicates the status
    // of the write transaction.
    output wire [1 : 0] S_AXI_BRESP,
    // Write response valid. This signal indicates that the channel
    // is signaling a valid write response.
    output wire  S_AXI_BVALID,
    // Response ready. This signal indicates that the master
    // can accept a write response.
    input wire  S_AXI_BREADY,
    // Read address (issued by master, acceped by Slave)
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
    // Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether the
    // transaction is a data access or an instruction access.
    input wire [2 : 0] S_AXI_ARPROT,
    // Read address valid. This signal indicates that the channel
    // is signaling valid read address and control information.
    input wire  S_AXI_ARVALID,
    // Read address ready. This signal indicates that the slave is
    // ready to accept an address and associated control signals.
    output wire  S_AXI_ARREADY,
    // Read data (issued by slave)
    output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
    // Read response. This signal indicates the status of the
    // read transfer.
    output wire [1 : 0] S_AXI_RRESP,
    // Read valid. This signal indicates that the channel is
    // signaling the required read data.
    output wire  S_AXI_RVALID,
    // Read ready. This signal indicates that the master can
    // accept the read data and response information.
    input wire  S_AXI_RREADY
);

// AXI4LITE signals
reg [C_S_AXI_ADDR_WIDTH-1 : 0]  axi_awaddr;
reg     axi_awready;
reg     axi_wready;
reg [1 : 0]     axi_bresp;
reg     axi_bvalid;
reg [C_S_AXI_ADDR_WIDTH-1 : 0]  axi_araddr;
reg     axi_arready;
reg [C_S_AXI_DATA_WIDTH-1 : 0]  axi_rdata;
reg [1 : 0]     axi_rresp;
reg     axi_rvalid;

// Example-specific design signals
// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
// ADDR_LSB is used for addressing 32/64 bit registers/memories
// ADDR_LSB = 2 for 32 bits (n downto 2)
// ADDR_LSB = 3 for 64 bits (n downto 3)
localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
localparam integer OPT_MEM_ADDR_BITS = 3;

//----------------------------------------------
//-- AES Register Map (14 registers total)
//----------------------------------------------
// Register Map:
// 0x00: Control Register    [1:0] = {mode, start}, [31:2] = reserved
// 0x04: Status Register     [0] = done, [1] = busy, [31:2] = reserved  
// 0x08: Key[63:32]          Upper 32 bits of first 64-bit key load
// 0x0C: Key[31:0]           Lower 32 bits of first 64-bit key load
// 0x10: Key[127:96]         Upper 32 bits of second 64-bit key load
// 0x14: Key[95:64]          Lower 32 bits of second 64-bit key load
// 0x18: Data_In[63:32]      Upper 32 bits of first 64-bit data load
// 0x1C: Data_In[31:0]       Lower 32 bits of first 64-bit data load
// 0x20: Data_In[127:96]     Upper 32 bits of second 64-bit data load
// 0x24: Data_In[95:64]      Lower 32 bits of second 64-bit data load
// 0x28: Data_Out[127:96]    Upper 32 bits of 128-bit output data (Read Only)
// 0x2C: Data_Out[95:64]     (Read Only)
// 0x30: Data_Out[63:32]     (Read Only)
// 0x34: Data_Out[31:0]      Lower 32 bits of 128-bit output data (Read Only)

reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg0;  // Control Register
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg1;  // Status Register  
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg2;  // Key[63:32] (first load)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg3;  // Key[31:0] (first load)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg4;  // Key[127:96] (second load)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg5;  // Key[95:64] (second load)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg6;  // Data_In[63:32] (first load)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg7;  // Data_In[31:0] (first load)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg8;  // Data_In[127:96] (second load)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg9;  // Data_In[95:64] (second load)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg10; // Data_Out[127:96] (Read Only)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg11; // Data_Out[95:64] (Read Only)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg12; // Data_Out[63:32] (Read Only)
reg [C_S_AXI_DATA_WIDTH-1:0] slv_reg13; // Data_Out[31:0] (Read Only)

wire slv_reg_rden;
wire slv_reg_wren;
reg [C_S_AXI_DATA_WIDTH-1:0] reg_data_out;
integer byte_index;
reg aw_en;

//----------------------------------------------
//-- AES Core Integration Signals
//----------------------------------------------
// AES control signals
wire aes_start;
wire aes_mode;
wire aes_load;
wire aes_done;
wire aes_reset;

// AES data signals  
wire [63:0] aes_key;
wire [63:0] aes_data_in;
wire [127:0] aes_data_out;

// AES control logic
reg load_phase;        // 0: load first 64 bits, 1: load second 64 bits
reg aes_busy;
reg start_prev;
reg start_edge_detected;
reg [2:0] load_state;  // State machine for load sequence
reg operation_complete;

// Extract control signals from registers
assign aes_start = start_edge_detected;
assign aes_mode = slv_reg0[1];  // 1: encrypt, 0: decrypt
assign aes_reset = ~S_AXI_ARESETN;

// AES data routing based on load phase
assign aes_key = load_phase ? {slv_reg4, slv_reg5} : {slv_reg2, slv_reg3};
assign aes_data_in = load_phase ? {slv_reg8, slv_reg9} : {slv_reg6, slv_reg7};

// Load signal generation - follows the testbench pattern
assign aes_load = (load_state == 3'd1) ? 1'b1 : 1'b0;

//----------------------------------------------
//-- AES Core Instance (VHDL module in Verilog)
//----------------------------------------------
aes128_fast aes_core (
    .clk(S_AXI_ACLK),
    .reset(aes_reset),
    .start(aes_start),
    .mode(aes_mode),
    .load(aes_load),
    .key(aes_key),
    .data_in(aes_data_in),
    .data_out(aes_data_out),
    .done(aes_done)
);

//----------------------------------------------
//-- AES Control Logic (Based on Testbench Pattern)
//----------------------------------------------
always @(posedge S_AXI_ACLK) begin
    if (~S_AXI_ARESETN) begin
        load_phase <= 1'b0;
        aes_busy <= 1'b0;
        start_prev <= 1'b0;
        start_edge_detected <= 1'b0;
        load_state <= 3'd0;
        operation_complete <= 1'b0;
    end else begin
        start_prev <= slv_reg0[0];
        start_edge_detected <= 1'b0;
        
        // State machine to handle AES operation sequence
        case (load_state)
            3'd0: begin // Idle state
                if (slv_reg0[0] && !start_prev && !aes_busy) begin
                    load_state <= 3'd1;
                    load_phase <= 1'b0;
                    aes_busy <= 1'b1;
                    operation_complete <= 1'b0;
                end
            end
            
            3'd1: begin // First load phase (load=1, load first 64-bit)
                load_state <= 3'd2;
            end
            
            3'd2: begin // Second load phase (load=0, load second 64-bit)
                load_phase <= 1'b1;
                load_state <= 3'd3;
            end
            
            3'd3: begin // Wait cycle before starting
                load_state <= 3'd4;
            end
            
            3'd4: begin // Start AES operation
                start_edge_detected <= 1'b1;
                load_state <= 3'd5;
            end
            
            3'd5: begin // Wait for completion
                if (aes_done) begin
                    load_state <= 3'd0;
                    aes_busy <= 1'b0;
                    operation_complete <= 1'b1;
                end
            end
            
            default: begin
                load_state <= 3'd0;
            end
        endcase
        
        // Auto-clear start bit after operation starts
        if (load_state == 3'd4) begin
            // Clear start bit automatically to prevent restart
        end
    end
end

// Update output registers when AES operation completes
always @(posedge S_AXI_ACLK) begin
    if (~S_AXI_ARESETN) begin
        slv_reg10 <= 32'h0;
        slv_reg11 <= 32'h0;
        slv_reg12 <= 32'h0;
        slv_reg13 <= 32'h0;
    end else if (aes_done && operation_complete) begin
        slv_reg10 <= aes_data_out[127:96];  // Upper 32 bits
        slv_reg11 <= aes_data_out[95:64];
        slv_reg12 <= aes_data_out[63:32];
        slv_reg13 <= aes_data_out[31:0];    // Lower 32 bits
    end
end

// Update status register
always @(posedge S_AXI_ACLK) begin
    if (~S_AXI_ARESETN) begin
        slv_reg1 <= 32'h0;
    end else begin
        slv_reg1[0] <= aes_done && operation_complete;    // Done flag
        slv_reg1[1] <= aes_busy;                         // Busy flag
        slv_reg1[31:2] <= 30'h0;                         // Reserved bits
    end
end

// I/O Connections assignments
assign S_AXI_AWREADY = axi_awready;
assign S_AXI_WREADY = axi_wready;
assign S_AXI_BRESP = axi_bresp;
assign S_AXI_BVALID = axi_bvalid;
assign S_AXI_ARREADY = axi_arready;
assign S_AXI_RDATA = axi_rdata;
assign S_AXI_RRESP = axi_rresp;
assign S_AXI_RVALID = axi_rvalid;

// Implement axi_awready generation
always @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_awready <= 1'b0;
      aw_en <= 1'b1;
    end 
  else
    begin    
      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
        begin
          axi_awready <= 1'b1;
          aw_en <= 1'b0;
        end
        else if (S_AXI_BREADY && axi_bvalid)
            begin
              aw_en <= 1'b1;
              axi_awready <= 1'b0;
            end
      else           
        begin
          axi_awready <= 1'b0;
        end
    end 
end       

// Implement axi_awaddr latching
always @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_awaddr <= 0;
    end 
  else
    begin    
      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en)
        begin
          axi_awaddr <= S_AXI_AWADDR;
        end
    end 
end       

// Implement axi_wready generation
always @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_wready <= 1'b0;
    end 
  else
    begin    
      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en )
        begin
          axi_wready <= 1'b1;
        end
      else
        begin
          axi_wready <= 1'b0;
        end
    end 
end       

// Implement memory mapped register select and write logic generation
assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

always @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      slv_reg0 <= 0;
      // slv_reg1 is status register - updated by AES logic
      slv_reg2 <= 0;
      slv_reg3 <= 0;
      slv_reg4 <= 0;
      slv_reg5 <= 0;
      slv_reg6 <= 0;
      slv_reg7 <= 0;
      slv_reg8 <= 0;
      slv_reg9 <= 0;
      // slv_reg10-13 are output registers - updated by AES logic
    end 
  else begin
    if (slv_reg_wren)
      begin
        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
          4'h0: // Control Register
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
              end  
          // slv_reg1 (Status) is read-only
          4'h2: // Key[63:32] (first load)
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
              end  
          4'h3: // Key[31:0] (first load)
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
              end  
          4'h4: // Key[127:96] (second load)
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                slv_reg4[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
              end  
          4'h5: // Key[95:64] (second load)
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                slv_reg5[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
              end  
          4'h6: // Data_In[63:32] (first load)
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                slv_reg6[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
              end  
          4'h7: // Data_In[31:0] (first load)
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                slv_reg7[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
              end  
          4'h8: // Data_In[127:96] (second load)
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                slv_reg8[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
              end  
          4'h9: // Data_In[95:64] (second load)
            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
                slv_reg9[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
              end  
          // slv_reg10-13 (Data_Out) are read-only
          default : begin
                      slv_reg0 <= slv_reg0;
                      slv_reg2 <= slv_reg2;
                      slv_reg3 <= slv_reg3;
                      slv_reg4 <= slv_reg4;
                      slv_reg5 <= slv_reg5;
                      slv_reg6 <= slv_reg6;
                      slv_reg7 <= slv_reg7;
                      slv_reg8 <= slv_reg8;
                      slv_reg9 <= slv_reg9;
                    end
        endcase
      end
    
    // Auto-clear start bit after operation begins
    if (load_state == 3'd4) begin
        slv_reg0[0] <= 1'b0;
    end
  end
end    

// Implement write response logic generation
always @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_bvalid  <= 0;
      axi_bresp   <= 2'b0;
    end 
  else
    begin    
      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
        begin
          axi_bvalid <= 1'b1;
          axi_bresp  <= 2'b0; // 'OKAY' response 
        end                   
      else
        begin
          if (S_AXI_BREADY && axi_bvalid) 
            begin
              axi_bvalid <= 1'b0; 
            end  
        end
    end
end   

// Implement axi_arready generation
always @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_arready <= 1'b0;
      axi_araddr  <= 32'b0;
    end 
  else
    begin    
      if (~axi_arready && S_AXI_ARVALID)
        begin
          axi_arready <= 1'b1;
          axi_araddr  <= S_AXI_ARADDR;
        end
      else
        begin
          axi_arready <= 1'b0;
        end
    end 
end       

// Implement axi_arvalid generation
always @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_rvalid <= 0;
      axi_rresp  <= 0;
    end 
  else
    begin    
      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
        begin
          axi_rvalid <= 1'b1;
          axi_rresp  <= 2'b0; // 'OKAY' response
        end   
      else if (axi_rvalid && S_AXI_RREADY)
        begin
          axi_rvalid <= 1'b0;
        end                
    end
end    

// Implement memory mapped register select and read logic generation
assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;

always @(*)
begin
      // Address decoding for reading registers
      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
        4'h0   : reg_data_out <= slv_reg0;   // Control
        4'h1   : reg_data_out <= slv_reg1;   // Status
        4'h2   : reg_data_out <= slv_reg2;   // Key[63:32]
        4'h3   : reg_data_out <= slv_reg3;   // Key[31:0]
        4'h4   : reg_data_out <= slv_reg4;   // Key[127:96]
        4'h5   : reg_data_out <= slv_reg5;   // Key[95:64]
        4'h6   : reg_data_out <= slv_reg6;   // Data_In[63:32]
        4'h7   : reg_data_out <= slv_reg7;   // Data_In[31:0]
        4'h8   : reg_data_out <= slv_reg8;   // Data_In[127:96]
        4'h9   : reg_data_out <= slv_reg9;   // Data_In[95:64]
        4'hA   : reg_data_out <= slv_reg10;  // Data_Out[127:96]
        4'hB   : reg_data_out <= slv_reg11;  // Data_Out[95:64]
        4'hC   : reg_data_out <= slv_reg12;  // Data_Out[63:32]
        4'hD   : reg_data_out <= slv_reg13;  // Data_Out[31:0]
        default : reg_data_out <= 0;
      endcase
end

// Output register or memory read data
always @( posedge S_AXI_ACLK )
begin
  if ( S_AXI_ARESETN == 1'b0 )
    begin
      axi_rdata  <= 0;
    end 
  else
    begin    
      if (slv_reg_rden)
        begin
          axi_rdata <= reg_data_out;
        end   
    end
end    

endmodule