`timescale 1 ns / 1 ps

	module desip_v1_0_S00_AXI #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line

		// Width of S_AXI data bus
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		// Width of S_AXI address bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 6
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
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 3;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 16
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg4;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg5;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg6;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg7;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg8;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg9;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg10;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg11;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg12;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg13;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg14;
	reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg15;
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S_AXI_DATA_WIDTH-1:0]	 reg_data_out;
	integer	 byte_index;
	reg	 aw_en;
	
	//----------------------------------------------
	//-- DES User Logic Signals
	//----------------------------------------------
	wire [1:64] des_data_bus;   // DES uses [1:64] bit ordering
	wire [1:64] des_key;        // DES uses [1:64] bit ordering
	wire des_e_data_rdy;
	wire des_decrypt;
	wire des_reset;
	wire [1:64] des_data_out;   // DES uses [1:64] bit ordering
	wire des_d_data_rdy;
	
	// Standard [63:0] format for easier handling
	wire [63:0] data_out_std;
	
	// Edge detection for start signal
	reg start_prev;
	wire start_edge;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

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
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
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
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

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
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

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
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	      slv_reg2 <= 0;
	      slv_reg3 <= 0;
	      slv_reg4 <= 0;
	      //slv_reg5 <= 0;
	      //slv_reg6 <= 0;
	      //slv_reg7 <= 0;
	      slv_reg8 <= 0;
	      slv_reg9 <= 0;
	      slv_reg10 <= 0;
	      slv_reg11 <= 0;
	      slv_reg12 <= 0;
	      slv_reg13 <= 0;
	      slv_reg14 <= 0;
	      slv_reg15 <= 0;
	    end 
	  else begin
	    if (slv_reg_wren)
	      begin
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	          4'h0:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                slv_reg0[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'h1:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 1
	                slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'h2:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	                slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'h3:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 3
	                slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'h4:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 4
	                slv_reg4[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	         // 4'h5:
	            //for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              //if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 5
	                //slv_reg5[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              //end  
	          //4'h6:
	            //for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              //if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 6
	                //slv_reg6[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              //end  
	          //4'h7:
	            //for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              //if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 7
	                //slv_reg7[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              //end  
	          4'h8:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 8
	                slv_reg8[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'h9:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 9
	                slv_reg9[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'hA:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 10
	                slv_reg10[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'hB:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 11
	                slv_reg11[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'hC:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 12
	                slv_reg12[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'hD:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 13
	                slv_reg13[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'hE:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 14
	                slv_reg14[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          4'hF:
	            for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg15[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                      slv_reg2 <= slv_reg2;
	                      slv_reg3 <= slv_reg3;
	                      slv_reg4 <= slv_reg4;
	                      //slv_reg5 <= slv_reg5;
	                      //slv_reg6 <= slv_reg6;
	                      //slv_reg7 <= slv_reg7;
	                      slv_reg8 <= slv_reg8;
	                      slv_reg9 <= slv_reg9;
	                      slv_reg10 <= slv_reg10;
	                      slv_reg11 <= slv_reg11;
	                      slv_reg12 <= slv_reg12;
	                      slv_reg13 <= slv_reg13;
	                      slv_reg14 <= slv_reg14;
	                      slv_reg15 <= slv_reg15;
	                    end
	        endcase
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

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
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

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
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
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
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        4'h0   : reg_data_out <= slv_reg0;
	        4'h1   : reg_data_out <= slv_reg1;
	        4'h2   : reg_data_out <= slv_reg2;
	        4'h3   : reg_data_out <= slv_reg3;
	        4'h4   : reg_data_out <= slv_reg4;
	        4'h5   : reg_data_out <= slv_reg5;
	        4'h6   : reg_data_out <= slv_reg6;
	        4'h7   : reg_data_out <= slv_reg7;
	        4'h8   : reg_data_out <= slv_reg8;
	        4'h9   : reg_data_out <= slv_reg9;
	        4'hA   : reg_data_out <= slv_reg10;
	        4'hB   : reg_data_out <= slv_reg11;
	        4'hC   : reg_data_out <= slv_reg12;
	        4'hD   : reg_data_out <= slv_reg13;
	        4'hE   : reg_data_out <= slv_reg14;
	        4'hF   : reg_data_out <= slv_reg15;
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
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    
    
	// Add user logic here
	//----------------------------------------------
	//-- DES User Logic Implementation
	//----------------------------------------------
	
	// Map AXI registers to DES signals
	// Note: DES module uses [1:64] bit ordering (bit 1 = LSB, bit 64 = MSB)
	// Convert from standard [63:0] to [1:64] format
	wire [63:0] data_bus_std = {slv_reg1, slv_reg0};  // Standard [63:0] format
	wire [63:0] key_std = {slv_reg3, slv_reg2};       // Standard [63:0] format
	
	// Convert to [1:64] format for DES module
	assign des_data_bus[1] = data_bus_std[0];
	assign des_data_bus[2] = data_bus_std[1];
	assign des_data_bus[3] = data_bus_std[2];
	assign des_data_bus[4] = data_bus_std[3];
	assign des_data_bus[5] = data_bus_std[4];
	assign des_data_bus[6] = data_bus_std[5];
	assign des_data_bus[7] = data_bus_std[6];
	assign des_data_bus[8] = data_bus_std[7];
	assign des_data_bus[9] = data_bus_std[8];
	assign des_data_bus[10] = data_bus_std[9];
	assign des_data_bus[11] = data_bus_std[10];
	assign des_data_bus[12] = data_bus_std[11];
	assign des_data_bus[13] = data_bus_std[12];
	assign des_data_bus[14] = data_bus_std[13];
	assign des_data_bus[15] = data_bus_std[14];
	assign des_data_bus[16] = data_bus_std[15];
	assign des_data_bus[17] = data_bus_std[16];
	assign des_data_bus[18] = data_bus_std[17];
	assign des_data_bus[19] = data_bus_std[18];
	assign des_data_bus[20] = data_bus_std[19];
	assign des_data_bus[21] = data_bus_std[20];
	assign des_data_bus[22] = data_bus_std[21];
	assign des_data_bus[23] = data_bus_std[22];
	assign des_data_bus[24] = data_bus_std[23];
	assign des_data_bus[25] = data_bus_std[24];
	assign des_data_bus[26] = data_bus_std[25];
	assign des_data_bus[27] = data_bus_std[26];
	assign des_data_bus[28] = data_bus_std[27];
	assign des_data_bus[29] = data_bus_std[28];
	assign des_data_bus[30] = data_bus_std[29];
	assign des_data_bus[31] = data_bus_std[30];
	assign des_data_bus[32] = data_bus_std[31];
	assign des_data_bus[33] = data_bus_std[32];
	assign des_data_bus[34] = data_bus_std[33];
	assign des_data_bus[35] = data_bus_std[34];
	assign des_data_bus[36] = data_bus_std[35];
	assign des_data_bus[37] = data_bus_std[36];
	assign des_data_bus[38] = data_bus_std[37];
	assign des_data_bus[39] = data_bus_std[38];
	assign des_data_bus[40] = data_bus_std[39];
	assign des_data_bus[41] = data_bus_std[40];
	assign des_data_bus[42] = data_bus_std[41];
	assign des_data_bus[43] = data_bus_std[42];
	assign des_data_bus[44] = data_bus_std[43];
	assign des_data_bus[45] = data_bus_std[44];
	assign des_data_bus[46] = data_bus_std[45];
	assign des_data_bus[47] = data_bus_std[46];
	assign des_data_bus[48] = data_bus_std[47];
	assign des_data_bus[49] = data_bus_std[48];
	assign des_data_bus[50] = data_bus_std[49];
	assign des_data_bus[51] = data_bus_std[50];
	assign des_data_bus[52] = data_bus_std[51];
	assign des_data_bus[53] = data_bus_std[52];
	assign des_data_bus[54] = data_bus_std[53];
	assign des_data_bus[55] = data_bus_std[54];
	assign des_data_bus[56] = data_bus_std[55];
	assign des_data_bus[57] = data_bus_std[56];
	assign des_data_bus[58] = data_bus_std[57];
	assign des_data_bus[59] = data_bus_std[58];
	assign des_data_bus[60] = data_bus_std[59];
	assign des_data_bus[61] = data_bus_std[60];
	assign des_data_bus[62] = data_bus_std[61];
	assign des_data_bus[63] = data_bus_std[62];
	assign des_data_bus[64] = data_bus_std[63];
	
	// Convert key from [63:0] to [1:64] format  
	assign des_key[1] = key_std[0];
	assign des_key[2] = key_std[1];
	assign des_key[3] = key_std[2];
	assign des_key[4] = key_std[3];
	assign des_key[5] = key_std[4];
	assign des_key[6] = key_std[5];
	assign des_key[7] = key_std[6];
	assign des_key[8] = key_std[7];
	assign des_key[9] = key_std[8];
	assign des_key[10] = key_std[9];
	assign des_key[11] = key_std[10];
	assign des_key[12] = key_std[11];
	assign des_key[13] = key_std[12];
	assign des_key[14] = key_std[13];
	assign des_key[15] = key_std[14];
	assign des_key[16] = key_std[15];
	assign des_key[17] = key_std[16];
	assign des_key[18] = key_std[17];
	assign des_key[19] = key_std[18];
	assign des_key[20] = key_std[19];
	assign des_key[21] = key_std[20];
	assign des_key[22] = key_std[21];
	assign des_key[23] = key_std[22];
	assign des_key[24] = key_std[23];
	assign des_key[25] = key_std[24];
	assign des_key[26] = key_std[25];
	assign des_key[27] = key_std[26];
	assign des_key[28] = key_std[27];
	assign des_key[29] = key_std[28];
	assign des_key[30] = key_std[29];
	assign des_key[31] = key_std[30];
	assign des_key[32] = key_std[31];
	assign des_key[33] = key_std[32];
	assign des_key[34] = key_std[33];
	assign des_key[35] = key_std[34];
	assign des_key[36] = key_std[35];
	assign des_key[37] = key_std[36];
	assign des_key[38] = key_std[37];
	assign des_key[39] = key_std[38];
	assign des_key[40] = key_std[39];
	assign des_key[41] = key_std[40];
	assign des_key[42] = key_std[41];
	assign des_key[43] = key_std[42];
	assign des_key[44] = key_std[43];
	assign des_key[45] = key_std[44];
	assign des_key[46] = key_std[45];
	assign des_key[47] = key_std[46];
	assign des_key[48] = key_std[47];
	assign des_key[49] = key_std[48];
	assign des_key[50] = key_std[49];
	assign des_key[51] = key_std[50];
	assign des_key[52] = key_std[51];
	assign des_key[53] = key_std[52];
	assign des_key[54] = key_std[53];
	assign des_key[55] = key_std[54];
	assign des_key[56] = key_std[55];
	assign des_key[57] = key_std[56];
	assign des_key[58] = key_std[57];
	assign des_key[59] = key_std[58];
	assign des_key[60] = key_std[59];
	assign des_key[61] = key_std[60];
	assign des_key[62] = key_std[61];
	assign des_key[63] = key_std[62];
	assign des_key[64] = key_std[63];
	
	assign des_decrypt = slv_reg4[1];            // Decrypt control bit
	assign des_reset = ~S_AXI_ARESETN;           // Active high reset for DES
	
	// Convert DES output from [1:64] to [63:0] format
	assign data_out_std[0] = des_data_out[1];
	assign data_out_std[1] = des_data_out[2];
	assign data_out_std[2] = des_data_out[3];
	assign data_out_std[3] = des_data_out[4];
	assign data_out_std[4] = des_data_out[5];
	assign data_out_std[5] = des_data_out[6];
	assign data_out_std[6] = des_data_out[7];
	assign data_out_std[7] = des_data_out[8];
	assign data_out_std[8] = des_data_out[9];
	assign data_out_std[9] = des_data_out[10];
	assign data_out_std[10] = des_data_out[11];
	assign data_out_std[11] = des_data_out[12];
	assign data_out_std[12] = des_data_out[13];
	assign data_out_std[13] = des_data_out[14];
	assign data_out_std[14] = des_data_out[15];
	assign data_out_std[15] = des_data_out[16];
	assign data_out_std[16] = des_data_out[17];
	assign data_out_std[17] = des_data_out[18];
	assign data_out_std[18] = des_data_out[19];
	assign data_out_std[19] = des_data_out[20];
	assign data_out_std[20] = des_data_out[21];
	assign data_out_std[21] = des_data_out[22];
	assign data_out_std[22] = des_data_out[23];
	assign data_out_std[23] = des_data_out[24];
	assign data_out_std[24] = des_data_out[25];
	assign data_out_std[25] = des_data_out[26];
	assign data_out_std[26] = des_data_out[27];
	assign data_out_std[27] = des_data_out[28];
	assign data_out_std[28] = des_data_out[29];
	assign data_out_std[29] = des_data_out[30];
	assign data_out_std[30] = des_data_out[31];
	assign data_out_std[31] = des_data_out[32];
	assign data_out_std[32] = des_data_out[33];
	assign data_out_std[33] = des_data_out[34];
	assign data_out_std[34] = des_data_out[35];
	assign data_out_std[35] = des_data_out[36];
	assign data_out_std[36] = des_data_out[37];
	assign data_out_std[37] = des_data_out[38];
	assign data_out_std[38] = des_data_out[39];
	assign data_out_std[39] = des_data_out[40];
	assign data_out_std[40] = des_data_out[41];
	assign data_out_std[41] = des_data_out[42];
	assign data_out_std[42] = des_data_out[43];
	assign data_out_std[43] = des_data_out[44];
	assign data_out_std[44] = des_data_out[45];
	assign data_out_std[45] = des_data_out[46];
	assign data_out_std[46] = des_data_out[47];
	assign data_out_std[47] = des_data_out[48];
	assign data_out_std[48] = des_data_out[49];
	assign data_out_std[49] = des_data_out[50];
	assign data_out_std[50] = des_data_out[51];
	assign data_out_std[51] = des_data_out[52];
	assign data_out_std[52] = des_data_out[53];
	assign data_out_std[53] = des_data_out[54];
	assign data_out_std[54] = des_data_out[55];
	assign data_out_std[55] = des_data_out[56];
	assign data_out_std[56] = des_data_out[57];
	assign data_out_std[57] = des_data_out[58];
	assign data_out_std[58] = des_data_out[59];
	assign data_out_std[59] = des_data_out[60];
	assign data_out_std[60] = des_data_out[61];
	assign data_out_std[61] = des_data_out[62];
	assign data_out_std[62] = des_data_out[63];
	assign data_out_std[63] = des_data_out[64];
	
    // Start signal edge detection and pulse generation
    reg start_prev;
    reg [2:0] start_pulse_counter;
    wire start_pulse;
    
    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARESETN == 1'b0) begin
            start_prev <= 1'b0;
            start_pulse_counter <= 3'b0;
        end else begin
            start_prev <= slv_reg4[0];
            
            // Generate start pulse when rising edge detected
            if (slv_reg4[0] && !start_prev) begin
                start_pulse_counter <= 3'b001;
            end else if (start_pulse_counter != 3'b0) begin
                start_pulse_counter <= start_pulse_counter + 1;
            end
        end
    end
    
    assign start_pulse = (start_pulse_counter == 3'b001);
    assign des_e_data_rdy = start_pulse;
	
    //----------------------------------------------
    //-- DES Output and Status Logic
    //----------------------------------------------
    always @(posedge S_AXI_ACLK) begin
        if (S_AXI_ARESETN == 1'b0) begin
            slv_reg5 <= 32'b0;
            slv_reg6 <= 32'b0;
            slv_reg7 <= 32'b0;
        end else begin
            // Clear done flag when new operation starts
            if (start_pulse) begin
                slv_reg7[0] <= 1'b0;
                slv_reg5 <= 32'b0;  // Clear previous results
                slv_reg6 <= 32'b0;
            end
            // Update output data registers when DES completes
            else if (des_d_data_rdy) begin
                slv_reg5 <= data_out_std[31:0];   // Lower 32 bits
                slv_reg6 <= data_out_std[63:32];  // Upper 32 bits
                slv_reg7[0] <= 1'b1;              // Set done flag
            end
        end
    end
	
	// Instantiate DES core
	des des_core_inst (
	    .reset(des_reset),
	    .clk(S_AXI_ACLK),
	    .data_bus(des_data_bus),
	    .e_data_rdy(des_e_data_rdy),
	    .key(des_key),
	    .decrypt(des_decrypt),
	    .data_out(des_data_out),
	    .d_data_rdy(des_d_data_rdy)
	);

	// User logic ends

	endmodule