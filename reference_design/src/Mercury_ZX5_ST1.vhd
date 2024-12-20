----------------------------------------------------------------------------------------------------
-- Copyright (c) 2024 by Enclustra GmbH, Switzerland.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this hardware, software, firmware, and associated documentation files (the
-- "Product"), to deal in the Product without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute,
-- sublicense, and/or sell copies of the Product, and to permit persons to whom the
-- Product is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Product.
--
-- THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
-- PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- libraries
----------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

----------------------------------------------------------------------------------------------------
-- entity declaration
----------------------------------------------------------------------------------------------------
entity Mercury_ZX5_ST1 is
  
  port (
    
    -- PS MIO Pins
    FIXED_IO_mio                   : inout   std_logic_vector(53 downto 0);
    FIXED_IO_ddr_vrn               : inout   std_logic;
    FIXED_IO_ddr_vrp               : inout   std_logic;
    FIXED_IO_ps_srstb              : inout   std_logic;
    FIXED_IO_ps_clk                : inout   std_logic;
    FIXED_IO_ps_porb               : inout   std_logic;
    DDR_cas_n                      : inout   std_logic;
    DDR_cke                        : inout   std_logic;
    DDR_ck_n                       : inout   std_logic;
    DDR_ck_p                       : inout   std_logic;
    DDR_cs_n                       : inout   std_logic;
    DDR_reset_n                    : inout   std_logic;
    DDR_odt                        : inout   std_logic;
    DDR_ras_n                      : inout   std_logic;
    DDR_we_n                       : inout   std_logic;
    DDR_ba                         : inout   std_logic_vector(2 downto 0);
    DDR_addr                       : inout   std_logic_vector(14 downto 0);
    DDR_dm                         : inout   std_logic_vector(3 downto 0);
    DDR_dq                         : inout   std_logic_vector(31 downto 0);
    DDR_dqs_n                      : inout   std_logic_vector(3 downto 0);
    DDR_dqs_p                      : inout   std_logic_vector(3 downto 0);
    
    -- Anios 0
    IO0_D0_P                       : inout   std_logic;
    IO0_D1_N                       : inout   std_logic;
    IO0_D2_P                       : inout   std_logic;
    IO0_D3_N                       : inout   std_logic;
    IO0_D4_P                       : inout   std_logic;
    IO0_D5_N                       : inout   std_logic;
    IO0_D6_P                       : inout   std_logic;
    IO0_D7_N                       : inout   std_logic;
    IO0_D8_P                       : inout   std_logic;
    IO0_D9_N                       : inout   std_logic;
    IO0_D10_P                      : inout   std_logic;
    IO0_D11_N                      : inout   std_logic;
    IO0_D12_P                      : inout   std_logic;
    IO0_D13_N                      : inout   std_logic;
    IO0_D14_P                      : inout   std_logic;
    IO0_D15_N                      : inout   std_logic;
    IO0_D16_P                      : inout   std_logic;
    IO0_D17_N                      : inout   std_logic;
    IO0_D18_P                      : inout   std_logic;
    IO0_D19_N                      : inout   std_logic;
    IO0_D20_P                      : inout   std_logic;
    IO0_D21_N                      : inout   std_logic;
    IO0_D22_P                      : inout   std_logic;
    IO0_D23_N                      : inout   std_logic;
    IO0_CLK_N                      : inout   std_logic;
    IO0_CLK_P                      : inout   std_logic;
    
    -- BUTTONS
    BTN1_N                         : in      std_logic;
    
    -- Clock Generator CLK1
    CLK_REF0_N                     : in      std_logic;
    CLK_REF0_P                     : in      std_logic;
    
    -- Clock Generator CLK0
    CLK_USR_N                      : in      std_logic;
    CLK_USR_P                      : in      std_logic;
    
    -- DisplayPort
    DP_HPD                         : in      std_logic;
    DP_AUX_IN                      : in      std_logic;
    DP_AUX_OE                      : out     std_logic;
    DP_AUX_OUT                     : out     std_logic;
    DP_LANE0_N                     : inout   std_logic;
    DP_LANE3_N                     : inout   std_logic;
    DP_LANE0_P                     : inout   std_logic;
    DP_LANE3_P                     : inout   std_logic;
    DP_LANE1_N                     : inout   std_logic;
    DP_LANE2_N                     : inout   std_logic;
    DP_LANE1_P                     : inout   std_logic;
    DP_LANE2_P                     : inout   std_logic;
    
    -- FMC HPC Connector
    FMC_LA02_N                     : inout   std_logic;
    FMC_LA02_P                     : inout   std_logic;
    FMC_LA03_N                     : inout   std_logic;
    FMC_LA03_P                     : inout   std_logic;
    FMC_LA04_N                     : inout   std_logic;
    FMC_LA04_P                     : inout   std_logic;
    FMC_LA05_N                     : inout   std_logic;
    FMC_LA05_P                     : inout   std_logic;
    FMC_LA06_N                     : inout   std_logic;
    FMC_LA06_P                     : inout   std_logic;
    FMC_LA07_N                     : inout   std_logic;
    FMC_LA07_P                     : inout   std_logic;
    FMC_LA08_N                     : inout   std_logic;
    FMC_LA08_P                     : inout   std_logic;
    FMC_LA09_N                     : inout   std_logic;
    FMC_LA09_P                     : inout   std_logic;
    FMC_LA10_N                     : inout   std_logic;
    FMC_LA10_P                     : inout   std_logic;
    FMC_LA11_N                     : inout   std_logic;
    FMC_LA11_P                     : inout   std_logic;
    FMC_LA12_N                     : inout   std_logic;
    FMC_LA12_P                     : inout   std_logic;
    FMC_LA13_N                     : inout   std_logic;
    FMC_LA13_P                     : inout   std_logic;
    FMC_LA14_N                     : inout   std_logic;
    FMC_LA14_P                     : inout   std_logic;
    FMC_LA15_N                     : inout   std_logic;
    FMC_LA15_P                     : inout   std_logic;
    FMC_LA16_N                     : inout   std_logic;
    FMC_LA16_P                     : inout   std_logic;
    FMC_LA19_N                     : inout   std_logic;
    FMC_LA19_P                     : inout   std_logic;
    FMC_LA20_N                     : inout   std_logic;
    FMC_LA20_P                     : inout   std_logic;
    FMC_LA21_N                     : inout   std_logic;
    FMC_LA21_P                     : inout   std_logic;
    FMC_LA22_N                     : inout   std_logic;
    FMC_LA22_P                     : inout   std_logic;
    FMC_LA23_N                     : inout   std_logic;
    FMC_LA23_P                     : inout   std_logic;
    FMC_LA24_N                     : inout   std_logic;
    FMC_LA24_P                     : inout   std_logic;
    FMC_LA25_N                     : inout   std_logic;
    FMC_LA25_P                     : inout   std_logic;
    FMC_LA26_N                     : inout   std_logic;
    FMC_LA26_P                     : inout   std_logic;
    FMC_LA27_N                     : inout   std_logic;
    FMC_LA27_P                     : inout   std_logic;
    FMC_LA28_N                     : inout   std_logic;
    FMC_LA28_P                     : inout   std_logic;
    FMC_LA29_N                     : inout   std_logic;
    FMC_LA29_P                     : inout   std_logic;
    FMC_LA30_N                     : inout   std_logic;
    FMC_LA30_P                     : inout   std_logic;
    FMC_LA31_N                     : inout   std_logic;
    FMC_LA31_P                     : inout   std_logic;
    FMC_LA32_N                     : inout   std_logic;
    FMC_LA32_P                     : inout   std_logic;
    FMC_LA33_N                     : inout   std_logic;
    FMC_LA33_P                     : inout   std_logic;
    FMC_DP0_C2M_N                  : inout   std_logic;
    FMC_DP0_C2M_P                  : inout   std_logic;
    FMC_DP0_M2C_N                  : inout   std_logic;
    FMC_DP0_M2C_P                  : inout   std_logic;
    FMC_DP1_C2M_N                  : inout   std_logic;
    FMC_DP1_C2M_P                  : inout   std_logic;
    FMC_DP1_M2C_N                  : inout   std_logic;
    FMC_DP1_M2C_P                  : inout   std_logic;
    FMC_DP2_C2M_N                  : inout   std_logic;
    FMC_DP2_C2M_P                  : inout   std_logic;
    FMC_DP2_M2C_N                  : inout   std_logic;
    FMC_DP2_M2C_P                  : inout   std_logic;
    FMC_DP3_C2M_N                  : inout   std_logic;
    FMC_DP3_C2M_P                  : inout   std_logic;
    FMC_DP3_M2C_N                  : inout   std_logic;
    FMC_DP3_M2C_P                  : inout   std_logic;
    FMC_LA00_CC_N                  : inout   std_logic;
    FMC_LA00_CC_P                  : inout   std_logic;
    FMC_LA01_CC_N                  : inout   std_logic;
    FMC_LA01_CC_P                  : inout   std_logic;
    FMC_LA17_CC_N                  : inout   std_logic;
    FMC_LA17_CC_P                  : inout   std_logic;
    FMC_LA18_CC_N                  : inout   std_logic;
    FMC_LA18_CC_P                  : inout   std_logic;
    FMC_CLK0_M2C_N                 : inout   std_logic;
    FMC_CLK0_M2C_P                 : inout   std_logic;
    FMC_CLK1_M2C_N                 : inout   std_logic;
    FMC_CLK1_M2C_P                 : inout   std_logic;
    FMC_GCLK0_M2C_N                : inout   std_logic;
    FMC_GCLK0_M2C_P                : inout   std_logic;
    
    -- HDMI
    HDMI_HPD                       : in      std_logic;
    
    -- I2C FPGA
    I2C_SCL_FPGA                   : inout   std_logic;
    I2C_SDA_FPGA                   : inout   std_logic;
    
    -- I2C_MIPI_SEL
    I2C_MIPI_SEL                   : inout   std_logic;
    
    -- I2C
    I2C_INT_N                      : in      std_logic;
    I2C_SCL                        : inout   std_logic;
    I2C_SDA                        : inout   std_logic;
    
    -- IO2
    IO2_D0_P                       : inout   std_logic;
    IO2_D1_N                       : inout   std_logic;
    IO2_D2_P                       : inout   std_logic;
    IO2_D3_N                       : inout   std_logic;
    
    -- IO3
    IO3_D0_P                       : inout   std_logic;
    IO3_D1_N                       : inout   std_logic;
    IO3_D2_P                       : inout   std_logic;
    IO3_D3_N                       : inout   std_logic;
    IO3_D4_P                       : inout   std_logic;
    IO3_D5_N                       : inout   std_logic;
    IO3_D6_P                       : inout   std_logic;
    IO3_D7_N                       : inout   std_logic;
    
    -- IO4
    IO4_D0_P                       : inout   std_logic;
    IO4_D1_N                       : inout   std_logic;
    IO4_D2_P                       : inout   std_logic;
    IO4_D3_N                       : inout   std_logic;
    IO4_D4_P                       : inout   std_logic;
    IO4_D5_N                       : inout   std_logic;
    IO4_D6_P                       : inout   std_logic;
    IO4_D7_N                       : inout   std_logic;
    
    -- LED
    FPGA_LED0_N                    : out     std_logic;
    
    -- Oscillator 100 MHz
    CLK_100_CAL                    : in      std_logic;
    
    -- USB3
    USB0_SSRX_N                    : inout   std_logic;
    USB1_SSRX_N                    : inout   std_logic;
    USB0_SSRX_P                    : inout   std_logic;
    USB1_SSRX_P                    : inout   std_logic;
    USB0_SSTX_N                    : inout   std_logic;
    USB1_SSTX_N                    : inout   std_logic;
    USB0_SSTX_P                    : inout   std_logic;
    USB1_SSTX_P                    : inout   std_logic
  );
end Mercury_ZX5_ST1;

architecture rtl of Mercury_ZX5_ST1 is

  ----------------------------------------------------------------------------------------------------
  -- component declarations
  ----------------------------------------------------------------------------------------------------
  component Mercury_ZX5 is
    port (
      Clk50               : out    std_logic;
      Rst_N               : out    std_logic;
      FIXED_IO_mio        : inout  std_logic_vector(53 downto 0);
      FIXED_IO_ddr_vrn    : inout  std_logic;
      FIXED_IO_ddr_vrp    : inout  std_logic;
      FIXED_IO_ps_srstb   : inout  std_logic;
      FIXED_IO_ps_clk     : inout  std_logic;
      FIXED_IO_ps_porb    : inout  std_logic;
      DDR_cas_n           : inout  std_logic;
      DDR_cke             : inout  std_logic;
      DDR_ck_n            : inout  std_logic;
      DDR_ck_p            : inout  std_logic;
      DDR_cs_n            : inout  std_logic;
      DDR_reset_n         : inout  std_logic;
      DDR_odt             : inout  std_logic;
      DDR_ras_n           : inout  std_logic;
      DDR_we_n            : inout  std_logic;
      DDR_ba              : inout  std_logic_vector(2 downto 0);
      DDR_addr            : inout  std_logic_vector(14 downto 0);
      DDR_dm              : inout  std_logic_vector(3 downto 0);
      DDR_dq              : inout  std_logic_vector(31 downto 0);
      DDR_dqs_n           : inout  std_logic_vector(3 downto 0);
      DDR_dqs_p           : inout  std_logic_vector(3 downto 0);
      IRQ_I2C             : in     std_logic;
      IIC_FPGA_sda_i      : in     std_logic;
      IIC_FPGA_sda_o      : out    std_logic;
      IIC_FPGA_sda_t      : out    std_logic;
      IIC_FPGA_scl_i      : in     std_logic;
      IIC_FPGA_scl_o      : out    std_logic;
      IIC_FPGA_scl_t      : out    std_logic;
      IIC_sda_i           : in     std_logic;
      IIC_sda_o           : out    std_logic;
      IIC_sda_t           : out    std_logic;
      IIC_scl_i           : in     std_logic;
      IIC_scl_o           : out    std_logic;
      IIC_scl_t           : out    std_logic
    );
    
  end component Mercury_ZX5;
  component IBUFDS is
      port (
        O : out STD_LOGIC;
        I : in STD_LOGIC;
        IB : in STD_LOGIC
      );
    end component IBUFDS;
  

  ----------------------------------------------------------------------------------------------------
  -- signal declarations
  ----------------------------------------------------------------------------------------------------
  signal Clk50            : std_logic;
  signal Rst_N            : std_logic;
  signal IRQ_I2C          : std_logic;
  signal IIC_FPGA_sda_i   : std_logic;
  signal IIC_FPGA_sda_o   : std_logic;
  signal IIC_FPGA_sda_t   : std_logic;
  signal IIC_FPGA_scl_i   : std_logic;
  signal IIC_FPGA_scl_o   : std_logic;
  signal IIC_FPGA_scl_t   : std_logic;
  signal IIC_sda_i        : std_logic;
  signal IIC_sda_o        : std_logic;
  signal IIC_sda_t        : std_logic;
  signal IIC_scl_i        : std_logic;
  signal IIC_scl_o        : std_logic;
  signal IIC_scl_t        : std_logic;
  signal LedCount         : unsigned(23 downto 0);
  
  ----------------------------------------------------------------------------------------------------
  -- attribute declarations
  ----------------------------------------------------------------------------------------------------

begin
  
  ----------------------------------------------------------------------------------------------------
  -- processor system instance
  ----------------------------------------------------------------------------------------------------
  Mercury_ZX5_i: component Mercury_ZX5
    port map (
      Clk50                => Clk50,
      Rst_N                => Rst_N,
      FIXED_IO_mio         => FIXED_IO_mio,
      FIXED_IO_ddr_vrn     => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp     => FIXED_IO_ddr_vrp,
      FIXED_IO_ps_srstb    => FIXED_IO_ps_srstb,
      FIXED_IO_ps_clk      => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb     => FIXED_IO_ps_porb,
      DDR_cas_n            => DDR_cas_n,
      DDR_cke              => DDR_cke,
      DDR_ck_n             => DDR_ck_n,
      DDR_ck_p             => DDR_ck_p,
      DDR_cs_n             => DDR_cs_n,
      DDR_reset_n          => DDR_reset_n,
      DDR_odt              => DDR_odt,
      DDR_ras_n            => DDR_ras_n,
      DDR_we_n             => DDR_we_n,
      DDR_ba               => DDR_ba,
      DDR_addr             => DDR_addr,
      DDR_dm               => DDR_dm,
      DDR_dq               => DDR_dq,
      DDR_dqs_n            => DDR_dqs_n,
      DDR_dqs_p            => DDR_dqs_p,
      IRQ_I2C              => IRQ_I2C,
      IIC_FPGA_sda_i       => IIC_FPGA_sda_i,
      IIC_FPGA_sda_o       => IIC_FPGA_sda_o,
      IIC_FPGA_sda_t       => IIC_FPGA_sda_t,
      IIC_FPGA_scl_i       => IIC_FPGA_scl_i,
      IIC_FPGA_scl_o       => IIC_FPGA_scl_o,
      IIC_FPGA_scl_t       => IIC_FPGA_scl_t,
      IIC_sda_i            => IIC_sda_i,
      IIC_sda_o            => IIC_sda_o,
      IIC_sda_t            => IIC_sda_t,
      IIC_scl_i            => IIC_scl_i,
      IIC_scl_o            => IIC_scl_o,
      IIC_scl_t            => IIC_scl_t
    );
  
  CLK_USR_buf: component IBUFDS
  port map (
  	O => open,
  	I => CLK_USR_P,
  	IB => CLK_USR_N
  );
  
  I2C_SDA_FPGA <= IIC_FPGA_sda_o when IIC_FPGA_sda_t = '0' else 'Z';
  IIC_FPGA_sda_i <= I2C_SDA_FPGA;
  I2C_SCL_FPGA <= IIC_FPGA_scl_o when IIC_FPGA_scl_t = '0' else 'Z';
  IIC_FPGA_scl_i <= I2C_SCL_FPGA;
  
  IRQ_I2C <= not I2C_INT_N;
  I2C_SDA <= IIC_sda_o when IIC_sda_t = '0' else 'Z';
  IIC_sda_i <= I2C_SDA;
  I2C_SCL <= IIC_scl_o when IIC_scl_t = '0' else 'Z';
  IIC_scl_i <= I2C_SCL;
  
  process (Clk50)
  begin
    if rising_edge (Clk50) then
      if Rst_N = '0' then
        LedCount    <= (others => '0');
      else
        LedCount    <= LedCount + 1;
      end if;
    end if;
  end process;
  FPGA_LED0_N <= '0' when LedCount(LedCount'high) = '0' else 'Z';
  
end rtl;
