module word_2_byte
  (input  rst,
   input  clk,
   input  ce,
   input  word_dv,
   input  [15:0] word,
   output byte_dv,
   output [7:0] byte);
  wire word_dv_dly;
  wire word_dv_dly2;
  wire [15:0] word_reg;
  wire [7:0] n738_o;
  wire [7:0] n739_o;
  wire [7:0] n741_o;
  wire [7:0] n742_o;
  wire n744_o;
  reg n745_q;
  reg n746_q;
  reg [15:0] n747_q;
  assign byte_dv = n744_o;
  assign byte = n742_o;
  /* word_2_byte.vhd:44:12  */
  assign word_dv_dly = n745_q; // (signal)
  /* word_2_byte.vhd:44:25  */
  assign word_dv_dly2 = n746_q; // (signal)
  /* word_2_byte.vhd:45:12  */
  assign word_reg = n747_q; // (signal)
  /* word_2_byte.vhd:65:29  */
  assign n738_o = word_reg[7:0];
  /* word_2_byte.vhd:67:29  */
  assign n739_o = word_reg[15:8];
  /* word_2_byte.vhd:66:9  */
  assign n741_o = word_dv_dly2 ? n739_o : 8'b00000000;
  /* word_2_byte.vhd:64:9  */
  assign n742_o = word_dv_dly ? n738_o : n741_o;
  /* word_2_byte.vhd:73:28  */
  assign n744_o = word_dv_dly | word_dv_dly2;
  /* word_2_byte.vhd:55:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n745_q <= 1'b0;
    else
      n745_q <= word_dv;
  /* word_2_byte.vhd:55:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n746_q <= 1'b0;
    else
      n746_q <= word_dv_dly;
  /* word_2_byte.vhd:55:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n747_q <= 16'b0000000000000000;
    else
      n747_q <= word;
endmodule

module byte_2_word
  (input  rst,
   input  clk,
   input  ce,
   input  byte_dv,
   input  [7:0] byte,
   output word_dv,
   output [15:0] word);
  wire [7:0] byte_reg;
  wire [7:0] byte_reg2;
  wire byte_dv_dly;
  wire [1:0] byte_count;
  wire n678_o;
  wire n679_o;
  wire [1:0] n699_o;
  wire n701_o;
  wire n707_o;
  wire n708_o;
  wire n709_o;
  wire n710_o;
  wire [15:0] n712_o;
  wire [7:0] n713_o;
  reg [7:0] n714_q;
  wire [7:0] n715_o;
  reg [7:0] n716_q;
  wire n717_o;
  reg n718_q;
  wire [1:0] n719_o;
  reg [1:0] n720_q;
  assign word_dv = n710_o;
  assign word = n712_o;
  /* byte_2_word.vhd:45:12  */
  assign byte_reg = n714_q; // (signal)
  /* byte_2_word.vhd:45:22  */
  assign byte_reg2 = n716_q; // (signal)
  /* byte_2_word.vhd:46:12  */
  assign byte_dv_dly = n718_q; // (signal)
  /* byte_2_word.vhd:47:12  */
  assign byte_count = n720_q; // (signal)
  /* byte_2_word.vhd:56:13  */
  assign n678_o = byte_dv & ce;
  /* byte_2_word.vhd:56:13  */
  assign n679_o = byte_dv & ce;
  /* byte_2_word.vhd:83:46  */
  assign n699_o = byte_count + 2'b01;
  /* byte_2_word.vhd:81:13  */
  assign n701_o = byte_dv & ce;
  /* byte_2_word.vhd:89:36  */
  assign n707_o = byte_count[0];
  /* byte_2_word.vhd:89:40  */
  assign n708_o = ~n707_o;
  /* byte_2_word.vhd:89:46  */
  assign n709_o = byte_dv_dly & n708_o;
  /* byte_2_word.vhd:89:20  */
  assign n710_o = n709_o ? 1'b1 : 1'b0;
  /* byte_2_word.vhd:91:22  */
  assign n712_o = {byte_reg, byte_reg2};
  /* byte_2_word.vhd:55:9  */
  assign n713_o = n678_o ? byte : byte_reg;
  /* byte_2_word.vhd:55:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n714_q <= 8'b00000000;
    else
      n714_q <= n713_o;
  /* byte_2_word.vhd:55:9  */
  assign n715_o = n679_o ? byte_reg : byte_reg2;
  /* byte_2_word.vhd:55:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n716_q <= 8'b00000000;
    else
      n716_q <= n715_o;
  /* byte_2_word.vhd:69:9  */
  assign n717_o = ce ? byte_dv : byte_dv_dly;
  /* byte_2_word.vhd:69:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n718_q <= 1'b0;
    else
      n718_q <= n717_o;
  /* byte_2_word.vhd:80:9  */
  assign n719_o = n701_o ? n699_o : byte_count;
  /* byte_2_word.vhd:80:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n720_q <= 2'b00;
    else
      n720_q <= n719_o;
endmodule

module uart_fifoed_send_4_2_115200_100000000_3f29546453678b855931c174a97d6c0894b8f546
  (input  clk_100mhz,
   input  reset,
   input  dat_en,
   input  [7:0] dat,
   output tx,
   output fifo_empty,
   output fifo_afull,
   output fifo_full);
  wire [9:0] cnt;
  wire top;
  wire [8:0] shift;
  wire [3:0] nbbits;
  wire [1:0] read_index;
  wire [1:0] write_index;
  wire [2:0] n_elements;
  wire [31:0] n466_o;
  wire n468_o;
  wire n469_o;
  wire n471_o;
  wire [31:0] n473_o;
  wire n475_o;
  wire n476_o;
  wire [31:0] n479_o;
  wire n481_o;
  wire n482_o;
  wire [31:0] n485_o;
  wire n487_o;
  wire n489_o;
  wire [31:0] n490_o;
  wire n492_o;
  wire n493_o;
  wire [31:0] n494_o;
  wire n496_o;
  wire n497_o;
  wire n498_o;
  wire n499_o;
  wire [31:0] n504_o;
  wire n506_o;
  wire [31:0] n507_o;
  wire n509_o;
  wire n510_o;
  wire [31:0] n511_o;
  wire [31:0] n513_o;
  wire [9:0] n514_o;
  wire [9:0] n516_o;
  wire [9:0] n518_o;
  wire [31:0] n524_o;
  wire n526_o;
  wire [31:0] n527_o;
  wire n529_o;
  wire [8:0] n535_o;
  wire [8:0] n536_o;
  wire [3:0] n538_o;
  wire [7:0] n539_o;
  wire [8:0] n541_o;
  wire [31:0] n542_o;
  wire n544_o;
  wire [31:0] n545_o;
  wire [31:0] n547_o;
  wire [3:0] n548_o;
  wire [3:0] n550_o;
  wire [8:0] n551_o;
  wire [3:0] n552_o;
  wire [8:0] n553_o;
  wire [3:0] n554_o;
  wire [8:0] n556_o;
  wire [3:0] n558_o;
  wire [31:0] n565_o;
  wire n567_o;
  wire [31:0] n568_o;
  wire n570_o;
  wire n571_o;
  wire n577_o;
  wire [31:0] n578_o;
  wire n580_o;
  wire [31:0] n581_o;
  wire [31:0] n583_o;
  wire [1:0] n584_o;
  wire [1:0] n586_o;
  wire [1:0] n587_o;
  wire [1:0] n589_o;
  wire [31:0] n595_o;
  wire n597_o;
  wire [31:0] n598_o;
  wire n600_o;
  wire [31:0] n601_o;
  wire n603_o;
  wire n604_o;
  wire [31:0] n605_o;
  wire [31:0] n607_o;
  wire [2:0] n608_o;
  wire [2:0] n609_o;
  wire [2:0] n611_o;
  wire [31:0] n612_o;
  wire n614_o;
  wire [31:0] n615_o;
  wire n617_o;
  wire n618_o;
  wire [31:0] n619_o;
  wire [31:0] n621_o;
  wire [2:0] n622_o;
  wire [2:0] n623_o;
  wire [2:0] n624_o;
  wire [2:0] n626_o;
  wire [31:0] n632_o;
  wire n634_o;
  wire n636_o;
  wire n637_o;
  wire [31:0] n638_o;
  wire n640_o;
  wire [31:0] n641_o;
  wire [31:0] n643_o;
  wire [1:0] n644_o;
  wire [1:0] n646_o;
  wire [1:0] n652_o;
  wire [1:0] n655_o;
  reg [9:0] n659_q;
  reg [8:0] n660_q;
  reg [3:0] n661_q;
  wire n662_o;
  wire n663_o;
  reg [1:0] n666_q;
  reg [1:0] n667_q;
  reg [2:0] n668_q;
  wire [7:0] n669_data; // mem_rd
  assign tx = n471_o;
  assign fifo_empty = n476_o;
  assign fifo_afull = n482_o;
  assign fifo_full = n499_o;
  /* UART_fifoed_send.vhd:45:11  */
  assign cnt = n659_q; // (signal)
  /* UART_fifoed_send.vhd:46:11  */
  assign top = n469_o; // (signal)
  /* UART_fifoed_send.vhd:47:11  */
  assign shift = n660_q; // (signal)
  /* UART_fifoed_send.vhd:48:11  */
  assign nbbits = n661_q; // (signal)
  /* UART_fifoed_send.vhd:50:11  */
  assign read_index = n666_q; // (signal)
  /* UART_fifoed_send.vhd:51:11  */
  assign write_index = n667_q; // (signal)
  /* UART_fifoed_send.vhd:52:11  */
  assign n_elements = n668_q; // (signal)
  /* UART_fifoed_send.vhd:58:24  */
  assign n466_o = {22'b0, cnt};  //  uext
  /* UART_fifoed_send.vhd:58:24  */
  assign n468_o = n466_o == 32'b00000000000000000000000000000000;
  /* UART_fifoed_send.vhd:58:15  */
  assign n469_o = n468_o ? 1'b1 : 1'b0;
  /* UART_fifoed_send.vhd:60:15  */
  assign n471_o = shift[0];
  /* UART_fifoed_send.vhd:62:38  */
  assign n473_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:62:38  */
  assign n475_o = n473_o == 32'b00000000000000000000000000000000;
  /* UART_fifoed_send.vhd:62:22  */
  assign n476_o = n475_o ? 1'b1 : 1'b0;
  /* UART_fifoed_send.vhd:64:38  */
  assign n479_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:64:38  */
  assign n481_o = $signed(n479_o) >= $signed(32'b00000000000000000000000000000010);
  /* UART_fifoed_send.vhd:64:22  */
  assign n482_o = n481_o ? 1'b1 : 1'b0;
  /* UART_fifoed_send.vhd:66:37  */
  assign n485_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:66:37  */
  assign n487_o = n485_o == 32'b00000000000000000000000000000100;
  /* UART_fifoed_send.vhd:67:25  */
  assign n489_o = dat_en & 1'b1;
  /* UART_fifoed_send.vhd:67:53  */
  assign n490_o = {28'b0, nbbits};  //  uext
  /* UART_fifoed_send.vhd:67:53  */
  assign n492_o = $signed(n490_o) < $signed(32'b00000000000000000000000000001100);
  /* UART_fifoed_send.vhd:67:42  */
  assign n493_o = n492_o & n489_o;
  /* UART_fifoed_send.vhd:67:73  */
  assign n494_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:67:73  */
  assign n496_o = n494_o == 32'b00000000000000000000000000000011;
  /* UART_fifoed_send.vhd:67:58  */
  assign n497_o = n496_o & n493_o;
  /* UART_fifoed_send.vhd:66:49  */
  assign n498_o = n487_o | n497_o;
  /* UART_fifoed_send.vhd:66:21  */
  assign n499_o = n498_o ? 1'b1 : 1'b0;
  /* UART_fifoed_send.vhd:78:23  */
  assign n504_o = {28'b0, nbbits};  //  uext
  /* UART_fifoed_send.vhd:78:23  */
  assign n506_o = $signed(n504_o) >= $signed(32'b00000000000000000000000000001100);
  /* UART_fifoed_send.vhd:78:36  */
  assign n507_o = {22'b0, cnt};  //  uext
  /* UART_fifoed_send.vhd:78:36  */
  assign n509_o = n507_o == 32'b00000000000000000000000000000000;
  /* UART_fifoed_send.vhd:78:29  */
  assign n510_o = n506_o | n509_o;
  /* UART_fifoed_send.vhd:81:24  */
  assign n511_o = {22'b0, cnt};  //  uext
  /* UART_fifoed_send.vhd:81:24  */
  assign n513_o = n511_o - 32'b00000000000000000000000000000001;
  /* UART_fifoed_send.vhd:81:20  */
  assign n514_o = n513_o[9:0];  // trunc
  /* UART_fifoed_send.vhd:78:10  */
  assign n516_o = n510_o ? 10'b1101100011 : n514_o;
  /* UART_fifoed_send.vhd:76:10  */
  assign n518_o = reset ? 10'b0000000000 : n516_o;
  /* UART_fifoed_send.vhd:92:23  */
  assign n524_o = {28'b0, nbbits};  //  uext
  /* UART_fifoed_send.vhd:92:23  */
  assign n526_o = $signed(n524_o) >= $signed(32'b00000000000000000000000000001100);
  /* UART_fifoed_send.vhd:94:27  */
  assign n527_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:94:27  */
  assign n529_o = $signed(n527_o) > $signed(32'b00000000000000000000000000000000);
  /* UART_fifoed_send.vhd:95:42  */
  assign n535_o = {n669_data, 1'b0};
  /* UART_fifoed_send.vhd:94:13  */
  assign n536_o = n529_o ? n535_o : shift;
  /* UART_fifoed_send.vhd:94:13  */
  assign n538_o = n529_o ? 4'b1001 : nbbits;
  /* UART_fifoed_send.vhd:101:36  */
  assign n539_o = shift[8:1];
  /* UART_fifoed_send.vhd:101:29  */
  assign n541_o = {1'b1, n539_o};
  /* UART_fifoed_send.vhd:102:26  */
  assign n542_o = {28'b0, nbbits};  //  uext
  /* UART_fifoed_send.vhd:102:26  */
  assign n544_o = n542_o == 32'b00000000000000000000000000000000;
  /* UART_fifoed_send.vhd:105:36  */
  assign n545_o = {28'b0, nbbits};  //  uext
  /* UART_fifoed_send.vhd:105:36  */
  assign n547_o = n545_o - 32'b00000000000000000000000000000001;
  /* UART_fifoed_send.vhd:105:29  */
  assign n548_o = n547_o[3:0];  // trunc
  /* UART_fifoed_send.vhd:102:16  */
  assign n550_o = n544_o ? 4'b1111 : n548_o;
  /* UART_fifoed_send.vhd:100:13  */
  assign n551_o = top ? n541_o : shift;
  /* UART_fifoed_send.vhd:100:13  */
  assign n552_o = top ? n550_o : nbbits;
  /* UART_fifoed_send.vhd:92:10  */
  assign n553_o = n526_o ? n536_o : n551_o;
  /* UART_fifoed_send.vhd:92:10  */
  assign n554_o = n526_o ? n538_o : n552_o;
  /* UART_fifoed_send.vhd:89:10  */
  assign n556_o = reset ? 9'b111111111 : n553_o;
  /* UART_fifoed_send.vhd:89:10  */
  assign n558_o = reset ? 4'b1100 : n554_o;
  /* UART_fifoed_send.vhd:117:28  */
  assign n565_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:117:28  */
  assign n567_o = $signed(n565_o) > $signed(32'b00000000000000000000000000000000);
  /* UART_fifoed_send.vhd:117:43  */
  assign n568_o = {28'b0, nbbits};  //  uext
  /* UART_fifoed_send.vhd:117:43  */
  assign n570_o = $signed(n568_o) >= $signed(32'b00000000000000000000000000001100);
  /* UART_fifoed_send.vhd:117:32  */
  assign n571_o = n570_o & n567_o;
  /* UART_fifoed_send.vhd:117:50  */
  assign n577_o = n571_o | 1'b0;
  /* UART_fifoed_send.vhd:122:27  */
  assign n578_o = {30'b0, read_index};  //  uext
  /* UART_fifoed_send.vhd:122:27  */
  assign n580_o = n578_o == 32'b00000000000000000000000000000011;
  /* UART_fifoed_send.vhd:125:41  */
  assign n581_o = {30'b0, read_index};  //  uext
  /* UART_fifoed_send.vhd:125:41  */
  assign n583_o = n581_o + 32'b00000000000000000000000000000001;
  /* UART_fifoed_send.vhd:125:30  */
  assign n584_o = n583_o[1:0];  // trunc
  /* UART_fifoed_send.vhd:122:13  */
  assign n586_o = n580_o ? 2'b00 : n584_o;
  /* UART_fifoed_send.vhd:117:10  */
  assign n587_o = n577_o ? n586_o : read_index;
  /* UART_fifoed_send.vhd:115:10  */
  assign n589_o = reset ? 2'b00 : n587_o;
  /* UART_fifoed_send.vhd:137:27  */
  assign n595_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:137:27  */
  assign n597_o = n595_o == 32'b00000000000000000000000000000000;
  /* UART_fifoed_send.vhd:142:26  */
  assign n598_o = {28'b0, nbbits};  //  uext
  /* UART_fifoed_send.vhd:142:26  */
  assign n600_o = $signed(n598_o) < $signed(32'b00000000000000000000000000001100);
  /* UART_fifoed_send.vhd:142:46  */
  assign n601_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:142:46  */
  assign n603_o = $signed(n601_o) < $signed(32'b00000000000000000000000000000100);
  /* UART_fifoed_send.vhd:142:31  */
  assign n604_o = n603_o & n600_o;
  /* UART_fifoed_send.vhd:145:41  */
  assign n605_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:145:41  */
  assign n607_o = n605_o + 32'b00000000000000000000000000000001;
  /* UART_fifoed_send.vhd:145:30  */
  assign n608_o = n607_o[2:0];  // trunc
  /* UART_fifoed_send.vhd:142:13  */
  assign n609_o = n604_o ? n608_o : n_elements;
  /* UART_fifoed_send.vhd:137:13  */
  assign n611_o = n597_o ? 3'b001 : n609_o;
  /* UART_fifoed_send.vhd:147:27  */
  assign n612_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:147:27  */
  assign n614_o = $signed(n612_o) > $signed(32'b00000000000000000000000000000000);
  /* UART_fifoed_send.vhd:147:42  */
  assign n615_o = {28'b0, nbbits};  //  uext
  /* UART_fifoed_send.vhd:147:42  */
  assign n617_o = $signed(n615_o) >= $signed(32'b00000000000000000000000000001100);
  /* UART_fifoed_send.vhd:147:31  */
  assign n618_o = n617_o & n614_o;
  /* UART_fifoed_send.vhd:150:38  */
  assign n619_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:150:38  */
  assign n621_o = n619_o - 32'b00000000000000000000000000000001;
  /* UART_fifoed_send.vhd:150:27  */
  assign n622_o = n621_o[2:0];  // trunc
  /* UART_fifoed_send.vhd:147:10  */
  assign n623_o = n618_o ? n622_o : n_elements;
  /* UART_fifoed_send.vhd:135:10  */
  assign n624_o = dat_en ? n611_o : n623_o;
  /* UART_fifoed_send.vhd:133:10  */
  assign n626_o = reset ? 3'b000 : n624_o;
  /* UART_fifoed_send.vhd:159:45  */
  assign n632_o = {29'b0, n_elements};  //  uext
  /* UART_fifoed_send.vhd:159:45  */
  assign n634_o = $signed(n632_o) < $signed(32'b00000000000000000000000000000100);
  /* UART_fifoed_send.vhd:159:57  */
  assign n636_o = n634_o | 1'b0;
  /* UART_fifoed_send.vhd:159:29  */
  assign n637_o = n636_o & dat_en;
  /* UART_fifoed_send.vhd:162:28  */
  assign n638_o = {30'b0, write_index};  //  uext
  /* UART_fifoed_send.vhd:162:28  */
  assign n640_o = n638_o == 32'b00000000000000000000000000000011;
  /* UART_fifoed_send.vhd:165:43  */
  assign n641_o = {30'b0, write_index};  //  uext
  /* UART_fifoed_send.vhd:165:43  */
  assign n643_o = n641_o + 32'b00000000000000000000000000000001;
  /* UART_fifoed_send.vhd:165:31  */
  assign n644_o = n643_o[1:0];  // trunc
  /* UART_fifoed_send.vhd:162:13  */
  assign n646_o = n640_o ? 2'b00 : n644_o;
  /* UART_fifoed_send.vhd:159:10  */
  assign n652_o = n637_o ? n646_o : write_index;
  /* UART_fifoed_send.vhd:157:10  */
  assign n655_o = reset ? 2'b00 : n652_o;
  /* UART_fifoed_send.vhd:75:7  */
  always @(posedge clk_100mhz)
    n659_q <= n518_o;
  /* UART_fifoed_send.vhd:88:7  */
  always @(posedge clk_100mhz)
    n660_q <= n556_o;
  /* UART_fifoed_send.vhd:88:7  */
  always @(posedge clk_100mhz)
    n661_q <= n558_o;
  /* UART_fifoed_send.vhd:157:10  */
  assign n662_o = ~reset;
  /* UART_fifoed_send.vhd:157:10  */
  assign n663_o = n662_o & n637_o;
  /* UART_fifoed_send.vhd:114:7  */
  always @(posedge clk_100mhz)
    n666_q <= n589_o;
  /* UART_fifoed_send.vhd:156:7  */
  always @(posedge clk_100mhz)
    n667_q <= n655_o;
  /* UART_fifoed_send.vhd:132:7  */
  always @(posedge clk_100mhz)
    n668_q <= n626_o;
  /* UART_fifoed_send.vhd:95:30  */
  reg [7:0] fifo[3:0] ; // memory
  assign n669_data = fifo[read_index];
  always @(posedge clk_100mhz)
    if (n663_o)
      fifo[write_index] <= dat;
  /* UART_fifoed_send.vhd:95:30  */
  /* UART_fifoed_send.vhd:168:18  */
endmodule

module uart_recv
  (input  clk,
   input  reset,
   input  rx,
   output [7:0] dat,
   output dat_en);
  reg [2:0] state;
  reg [3:0] nbbits;
  wire [9:0] cnt;
  reg rxi;
  wire ref_bit;
  wire [7:0] shift;
  wire n255_o;
  wire [2:0] n257_o;
  wire n259_o;
  wire [31:0] n260_o;
  wire n262_o;
  wire [2:0] n264_o;
  wire [2:0] n266_o;
  wire n268_o;
  wire [31:0] n269_o;
  wire n271_o;
  wire [2:0] n273_o;
  wire n275_o;
  wire [31:0] n276_o;
  wire n278_o;
  wire [2:0] n280_o;
  wire n282_o;
  wire [31:0] n283_o;
  wire n285_o;
  wire [2:0] n288_o;
  wire [2:0] n290_o;
  wire n292_o;
  wire n293_o;
  wire [31:0] n294_o;
  wire n296_o;
  wire [2:0] n298_o;
  wire [2:0] n300_o;
  wire n302_o;
  wire [31:0] n303_o;
  wire n305_o;
  wire [2:0] n307_o;
  wire n309_o;
  wire [6:0] n310_o;
  reg [2:0] n312_o;
  wire [2:0] n314_o;
  wire n321_o;
  wire [31:0] n322_o;
  wire n324_o;
  wire [31:0] n325_o;
  wire [31:0] n327_o;
  wire [9:0] n328_o;
  wire [9:0] n330_o;
  wire n332_o;
  wire [31:0] n333_o;
  wire n335_o;
  wire [31:0] n336_o;
  wire [31:0] n338_o;
  wire [9:0] n339_o;
  wire [9:0] n341_o;
  wire n343_o;
  wire n344_o;
  wire [31:0] n345_o;
  wire [31:0] n347_o;
  wire [9:0] n348_o;
  wire [9:0] n350_o;
  wire n352_o;
  wire [31:0] n353_o;
  wire n355_o;
  wire n356_o;
  wire [9:0] n359_o;
  wire [9:0] n361_o;
  wire n363_o;
  wire [31:0] n364_o;
  wire [31:0] n366_o;
  wire [9:0] n367_o;
  wire n369_o;
  wire n370_o;
  wire [31:0] n371_o;
  wire [31:0] n373_o;
  wire [9:0] n374_o;
  wire [9:0] n376_o;
  wire n378_o;
  wire [6:0] n379_o;
  reg [9:0] n382_o;
  wire [9:0] n384_o;
  wire n391_o;
  wire n393_o;
  wire n394_o;
  wire n402_o;
  wire [31:0] n403_o;
  wire n405_o;
  wire n406_o;
  wire [31:0] n407_o;
  wire n409_o;
  wire n410_o;
  wire [6:0] n411_o;
  wire [7:0] n412_o;
  wire n420_o;
  wire n422_o;
  wire [31:0] n423_o;
  wire [31:0] n425_o;
  wire [3:0] n426_o;
  wire [3:0] n427_o;
  wire [3:0] n429_o;
  wire n436_o;
  wire [31:0] n437_o;
  wire n439_o;
  wire n440_o;
  wire [7:0] n441_o;
  wire n444_o;
  wire [7:0] n445_o;
  wire n447_o;
  reg [2:0] n451_q;
  reg [3:0] n452_q;
  reg [9:0] n453_q;
  reg n454_q;
  wire n455_o;
  reg n456_q;
  wire [7:0] n457_o;
  reg [7:0] n458_q;
  reg [7:0] n459_q;
  reg n460_q;
  assign dat = n459_q;
  assign dat_en = n460_q;
  /* uart_recv.vhd:47:11  */
  always @*
    state = n451_q; // (isignal)
  initial
    state = 3'b000;
  /* uart_recv.vhd:48:11  */
  always @*
    nbbits = n452_q; // (isignal)
  initial
    nbbits = 4'b0000;
  /* uart_recv.vhd:49:11  */
  assign cnt = n453_q; // (signal)
  /* uart_recv.vhd:50:11  */
  always @*
    rxi = n454_q; // (isignal)
  initial
    rxi = 1'b1;
  /* uart_recv.vhd:51:11  */
  assign ref_bit = n456_q; // (signal)
  /* uart_recv.vhd:52:11  */
  assign shift = n458_q; // (signal)
  /* uart_recv.vhd:77:36  */
  assign n255_o = ~rxi;
  /* uart_recv.vhd:77:29  */
  assign n257_o = n255_o ? 3'b001 : state;
  /* uart_recv.vhd:77:16  */
  assign n259_o = state == 3'b000;
  /* uart_recv.vhd:82:20  */
  assign n260_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:82:20  */
  assign n262_o = n260_o == 32'b00000000000000000000000000000000;
  /* uart_recv.vhd:82:10  */
  assign n264_o = n262_o ? 3'b010 : state;
  /* uart_recv.vhd:80:35  */
  assign n266_o = rxi ? 3'b000 : n264_o;
  /* uart_recv.vhd:80:13  */
  assign n268_o = state == 3'b001;
  /* uart_recv.vhd:85:39  */
  assign n269_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:85:39  */
  assign n271_o = n269_o == 32'b00000000000000000000000000000000;
  /* uart_recv.vhd:85:32  */
  assign n273_o = n271_o ? 3'b011 : state;
  /* uart_recv.vhd:85:10  */
  assign n275_o = state == 3'b010;
  /* uart_recv.vhd:88:33  */
  assign n276_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:88:33  */
  assign n278_o = n276_o == 32'b00000000000000000000000000000000;
  /* uart_recv.vhd:88:26  */
  assign n280_o = n278_o ? 3'b100 : state;
  /* uart_recv.vhd:88:7  */
  assign n282_o = state == 3'b011;
  /* uart_recv.vhd:91:35  */
  assign n283_o = {28'b0, nbbits};  //  uext
  /* uart_recv.vhd:91:35  */
  assign n285_o = $signed(n283_o) < $signed(32'b00000000000000000000000000001000);
  /* uart_recv.vhd:93:1  */
  assign n288_o = ref_bit ? 3'b101 : 3'b110;
  /* uart_recv.vhd:91:25  */
  assign n290_o = n285_o ? 3'b010 : n288_o;
  /* uart_recv.vhd:91:4  */
  assign n292_o = state == 3'b100;
  /* uart_recv.vhd:98:30  */
  assign n293_o = ~rxi;
  /* uart_recv.vhd:100:11  */
  assign n294_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:100:11  */
  assign n296_o = n294_o == 32'b00000000000000000000000000000000;
  /* uart_recv.vhd:100:1  */
  assign n298_o = n296_o ? 3'b000 : state;
  /* uart_recv.vhd:98:23  */
  assign n300_o = n293_o ? 3'b110 : n298_o;
  /* uart_recv.vhd:98:1  */
  assign n302_o = state == 3'b101;
  /* uart_recv.vhd:103:33  */
  assign n303_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:103:33  */
  assign n305_o = n303_o == 32'b00000000000000000000000000000000;
  /* uart_recv.vhd:103:26  */
  assign n307_o = n305_o ? 3'b000 : state;
  /* uart_recv.vhd:103:1  */
  assign n309_o = state == 3'b110;
  assign n310_o = {n309_o, n302_o, n292_o, n282_o, n275_o, n268_o, n259_o};
  /* uart_recv.vhd:76:13  */
  always @*
    case (n310_o)
      7'b1000000: n312_o = n307_o;
      7'b0100000: n312_o = n300_o;
      7'b0010000: n312_o = n290_o;
      7'b0001000: n312_o = n280_o;
      7'b0000100: n312_o = n273_o;
      7'b0000010: n312_o = n266_o;
      7'b0000001: n312_o = n257_o;
      default: n312_o = 3'bX;
    endcase
  /* uart_recv.vhd:73:10  */
  assign n314_o = reset ? 3'b000 : n312_o;
  /* uart_recv.vhd:119:13  */
  assign n321_o = state == 3'b000;
  /* uart_recv.vhd:120:42  */
  assign n322_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:120:42  */
  assign n324_o = n322_o == 32'b00000000000000000000000000000000;
  /* uart_recv.vhd:123:27  */
  assign n325_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:123:27  */
  assign n327_o = n325_o - 32'b00000000000000000000000000000001;
  /* uart_recv.vhd:123:23  */
  assign n328_o = n327_o[9:0];  // trunc
  /* uart_recv.vhd:120:35  */
  assign n330_o = n324_o ? 10'b1010000011 : n328_o;
  /* uart_recv.vhd:120:13  */
  assign n332_o = state == 3'b001;
  /* uart_recv.vhd:125:39  */
  assign n333_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:125:39  */
  assign n335_o = n333_o == 32'b00000000000000000000000000000000;
  /* uart_recv.vhd:128:21  */
  assign n336_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:128:21  */
  assign n338_o = n336_o - 32'b00000000000000000000000000000001;
  /* uart_recv.vhd:128:17  */
  assign n339_o = n338_o[9:0];  // trunc
  /* uart_recv.vhd:125:32  */
  assign n341_o = n335_o ? 10'b0011011000 : n339_o;
  /* uart_recv.vhd:125:10  */
  assign n343_o = state == 3'b010;
  /* uart_recv.vhd:130:37  */
  assign n344_o = ref_bit != rxi;
  /* uart_recv.vhd:133:18  */
  assign n345_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:133:18  */
  assign n347_o = n345_o - 32'b00000000000000000000000000000001;
  /* uart_recv.vhd:133:14  */
  assign n348_o = n347_o[9:0];  // trunc
  /* uart_recv.vhd:130:26  */
  assign n350_o = n344_o ? 10'b0011011000 : n348_o;
  /* uart_recv.vhd:130:7  */
  assign n352_o = state == 3'b011;
  /* uart_recv.vhd:135:35  */
  assign n353_o = {28'b0, nbbits};  //  uext
  /* uart_recv.vhd:135:35  */
  assign n355_o = $signed(n353_o) < $signed(32'b00000000000000000000000000001000);
  /* uart_recv.vhd:137:15  */
  assign n356_o = ~ref_bit;
  /* uart_recv.vhd:137:1  */
  assign n359_o = n356_o ? 10'b1101100011 : 10'b0110110001;
  /* uart_recv.vhd:135:25  */
  assign n361_o = n355_o ? 10'b1010000011 : n359_o;
  /* uart_recv.vhd:135:4  */
  assign n363_o = state == 3'b100;
  /* uart_recv.vhd:142:34  */
  assign n364_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:142:34  */
  assign n366_o = n364_o - 32'b00000000000000000000000000000001;
  /* uart_recv.vhd:142:30  */
  assign n367_o = n366_o[9:0];  // trunc
  /* uart_recv.vhd:142:1  */
  assign n369_o = state == 3'b101;
  /* uart_recv.vhd:143:33  */
  assign n370_o = ~rxi;
  /* uart_recv.vhd:146:12  */
  assign n371_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:146:12  */
  assign n373_o = n371_o - 32'b00000000000000000000000000000001;
  /* uart_recv.vhd:146:8  */
  assign n374_o = n373_o[9:0];  // trunc
  /* uart_recv.vhd:143:26  */
  assign n376_o = n370_o ? 10'b1101100011 : n374_o;
  /* uart_recv.vhd:143:1  */
  assign n378_o = state == 3'b110;
  assign n379_o = {n378_o, n369_o, n363_o, n352_o, n343_o, n332_o, n321_o};
  /* uart_recv.vhd:118:10  */
  always @*
    case (n379_o)
      7'b1000000: n382_o = n376_o;
      7'b0100000: n382_o = n367_o;
      7'b0010000: n382_o = n361_o;
      7'b0001000: n382_o = n350_o;
      7'b0000100: n382_o = n341_o;
      7'b0000010: n382_o = n330_o;
      7'b0000001: n382_o = 10'b0011011000;
      default: n382_o = 10'bX;
    endcase
  /* uart_recv.vhd:115:7  */
  assign n384_o = reset ? 10'b0011011000 : n382_o;
  /* uart_recv.vhd:160:16  */
  assign n391_o = state == 3'b010;
  /* uart_recv.vhd:160:41  */
  assign n393_o = state == 3'b011;
  /* uart_recv.vhd:160:32  */
  assign n394_o = n391_o | n393_o;
  /* uart_recv.vhd:169:16  */
  assign n402_o = state == 3'b011;
  /* uart_recv.vhd:169:37  */
  assign n403_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:169:37  */
  assign n405_o = n403_o == 32'b00000000000000000000000000000000;
  /* uart_recv.vhd:169:29  */
  assign n406_o = n405_o & n402_o;
  /* uart_recv.vhd:169:52  */
  assign n407_o = {28'b0, nbbits};  //  uext
  /* uart_recv.vhd:169:52  */
  assign n409_o = $signed(n407_o) < $signed(32'b00000000000000000000000000001000);
  /* uart_recv.vhd:169:41  */
  assign n410_o = n409_o & n406_o;
  /* uart_recv.vhd:170:35  */
  assign n411_o = shift[7:1];
  /* uart_recv.vhd:170:27  */
  assign n412_o = {ref_bit, n411_o};
  /* uart_recv.vhd:178:16  */
  assign n420_o = state == 3'b000;
  /* uart_recv.vhd:180:19  */
  assign n422_o = state == 3'b100;
  /* uart_recv.vhd:181:27  */
  assign n423_o = {28'b0, nbbits};  //  uext
  /* uart_recv.vhd:181:27  */
  assign n425_o = n423_o + 32'b00000000000000000000000000000001;
  /* uart_recv.vhd:181:20  */
  assign n426_o = n425_o[3:0];  // trunc
  /* uart_recv.vhd:180:7  */
  assign n427_o = n422_o ? n426_o : nbbits;
  /* uart_recv.vhd:178:7  */
  assign n429_o = n420_o ? 4'b0000 : n427_o;
  /* uart_recv.vhd:192:19  */
  assign n436_o = state == 3'b101;
  /* uart_recv.vhd:192:43  */
  assign n437_o = {22'b0, cnt};  //  uext
  /* uart_recv.vhd:192:43  */
  assign n439_o = n437_o == 32'b00000000000000000000000000000000;
  /* uart_recv.vhd:192:35  */
  assign n440_o = n439_o & n436_o;
  /* uart_recv.vhd:192:7  */
  assign n441_o = n440_o ? shift : n459_q;
  /* uart_recv.vhd:192:7  */
  assign n444_o = n440_o ? 1'b1 : 1'b0;
  /* uart_recv.vhd:190:7  */
  assign n445_o = reset ? n459_q : n441_o;
  /* uart_recv.vhd:190:7  */
  assign n447_o = reset ? 1'b0 : n444_o;
  /* uart_recv.vhd:72:7  */
  always @(posedge clk)
    n451_q <= n314_o;
  initial
    n451_q = 3'b000;
  /* uart_recv.vhd:177:4  */
  always @(posedge clk)
    n452_q <= n429_o;
  initial
    n452_q = 4'b0000;
  /* uart_recv.vhd:114:4  */
  always @(posedge clk)
    n453_q <= n384_o;
  /* uart_recv.vhd:64:7  */
  always @(posedge clk)
    n454_q <= rx;
  initial
    n454_q = 1'b1;
  /* uart_recv.vhd:159:4  */
  assign n455_o = n394_o ? rxi : ref_bit;
  /* uart_recv.vhd:159:4  */
  always @(posedge clk)
    n456_q <= n455_o;
  /* uart_recv.vhd:168:4  */
  assign n457_o = n410_o ? n412_o : shift;
  /* uart_recv.vhd:168:4  */
  always @(posedge clk)
    n458_q <= n457_o;
  /* uart_recv.vhd:189:4  */
  always @(posedge clk)
    n459_q <= n445_o;
  /* uart_recv.vhd:189:4  */
  always @(posedge clk)
    n460_q <= n447_o;
endmodule

module boot_loader
  (input  rst,
   input  clk,
   input  ce,
   input  rx,
   input  scan_memory,
   input  [15:0] ram_out,
   output tx,
   output boot,
   output ram_rw,
   output ram_enable,
   output [5:0] ram_adr,
   output [15:0] ram_in);
  wire [7:0] rx_byte;
  wire [7:0] tx_byte;
  wire rx_data_valid;
  wire tx_data_valid;
  wire rx_word_valid;
  wire [15:0] rx_word;
  wire [5:0] rx_byte_count;
  wire enable_rx_byte_counter;
  wire init_byte_counter;
  wire [3:0] current_state;
  wire [3:0] future_state;
  wire [14:0] tx_cycle_count;
  wire init_tx_cycle_count;
  wire tx_cycle_count_over;
  wire tx_word_valid;
  wire [7:0] inst_uart_recv_n6;
  wire inst_uart_recv_n7;
  wire [7:0] inst_uart_recv_dat;
  wire inst_uart_recv_dat_en;
  wire inst_uart_send_n12;
  wire inst_uart_send_tx;
  wire inst_uart_send_fifo_empty;
  wire inst_uart_send_fifo_afull;
  wire inst_uart_send_fifo_full;
  wire b2w_n21;
  wire [15:0] b2w_n22;
  wire b2w_word_dv;
  wire [15:0] b2w_word;
  wire n31_o;
  wire [5:0] n33_o;
  wire [5:0] n35_o;
  wire [5:0] n36_o;
  wire [5:0] n38_o;
  wire w2b_n44;
  wire [7:0] w2b_n45;
  wire w2b_byte_dv;
  wire [7:0] w2b_byte;
  wire n54_o;
  wire [14:0] n56_o;
  wire [14:0] n58_o;
  wire n61_o;
  wire [14:0] n63_o;
  wire n65_o;
  wire n83_o;
  wire [3:0] n86_o;
  wire n88_o;
  wire n90_o;
  wire [3:0] n93_o;
  wire n95_o;
  wire n97_o;
  wire [3:0] n100_o;
  wire n102_o;
  wire n104_o;
  wire n105_o;
  wire [3:0] n108_o;
  wire n110_o;
  wire n112_o;
  wire n114_o;
  wire [3:0] n117_o;
  wire n119_o;
  wire n121_o;
  wire [9:0] n122_o;
  reg [3:0] n129_o;
  wire n133_o;
  wire n135_o;
  wire n137_o;
  wire n139_o;
  wire n141_o;
  wire n143_o;
  wire n145_o;
  wire n147_o;
  wire n149_o;
  wire n151_o;
  wire [9:0] n152_o;
  reg n164_o;
  reg n176_o;
  reg n188_o;
  reg n200_o;
  reg n212_o;
  reg n224_o;
  localparam n226_o = 1'b1;
  wire [5:0] n231_o;
  reg [5:0] n232_q;
  wire [3:0] n233_o;
  reg [3:0] n234_q;
  wire [14:0] n235_o;
  reg [14:0] n236_q;
  wire n237_o;
  wire n238_o;
  wire n239_o;
  reg n240_q;
  assign tx = inst_uart_send_n12;
  assign boot = n164_o;
  assign ram_rw = n176_o;
  assign ram_enable = n226_o;
  assign ram_adr = rx_byte_count;
  assign ram_in = rx_word;
  /* boot_loader.vhd:78:12  */
  assign rx_byte = inst_uart_recv_n6; // (signal)
  /* boot_loader.vhd:78:21  */
  assign tx_byte = w2b_n45; // (signal)
  /* boot_loader.vhd:79:12  */
  assign rx_data_valid = inst_uart_recv_n7; // (signal)
  /* boot_loader.vhd:79:46  */
  assign tx_data_valid = n188_o; // (signal)
  /* boot_loader.vhd:80:12  */
  assign rx_word_valid = b2w_n21; // (signal)
  /* boot_loader.vhd:83:12  */
  assign rx_word = b2w_n22; // (signal)
  /* boot_loader.vhd:85:12  */
  assign rx_byte_count = n232_q; // (signal)
  /* boot_loader.vhd:86:12  */
  assign enable_rx_byte_counter = n200_o; // (signal)
  /* boot_loader.vhd:87:12  */
  assign init_byte_counter = n212_o; // (signal)
  /* boot_loader.vhd:90:12  */
  assign current_state = n234_q; // (signal)
  /* boot_loader.vhd:90:27  */
  assign future_state = n129_o; // (signal)
  /* boot_loader.vhd:92:12  */
  assign tx_cycle_count = n236_q; // (signal)
  /* boot_loader.vhd:93:12  */
  assign init_tx_cycle_count = n224_o; // (signal)
  /* boot_loader.vhd:93:33  */
  assign tx_cycle_count_over = n240_q; // (signal)
  /* boot_loader.vhd:95:12  */
  assign tx_word_valid = w2b_n44; // (signal)
  /* boot_loader.vhd:107:16  */
  assign inst_uart_recv_n6 = inst_uart_recv_dat; // (signal)
  /* boot_loader.vhd:108:19  */
  assign inst_uart_recv_n7 = inst_uart_recv_dat_en; // (signal)
  /* boot_loader.vhd:102:5  */
  uart_recv inst_uart_recv (
    .clk(clk),
    .reset(rst),
    .rx(rx),
    .dat(inst_uart_recv_dat),
    .dat_en(inst_uart_recv_dat_en));
  /* boot_loader.vhd:123:15  */
  assign inst_uart_send_n12 = inst_uart_send_tx; // (signal)
  /* boot_loader.vhd:110:5  */
  uart_fifoed_send_4_2_115200_100000000_3f29546453678b855931c174a97d6c0894b8f546 inst_uart_send (
    .clk_100mhz(clk),
    .reset(rst),
    .dat_en(tx_word_valid),
    .dat(tx_byte),
    .tx(inst_uart_send_tx),
    .fifo_empty(),
    .fifo_afull(),
    .fifo_full());
  /* boot_loader.vhd:138:20  */
  assign b2w_n21 = b2w_word_dv; // (signal)
  /* boot_loader.vhd:139:17  */
  assign b2w_n22 = b2w_word; // (signal)
  /* boot_loader.vhd:131:5  */
  byte_2_word b2w (
    .rst(rst),
    .clk(clk),
    .ce(ce),
    .byte_dv(rx_data_valid),
    .byte(rx_byte),
    .word_dv(b2w_word_dv),
    .word(b2w_word));
  /* boot_loader.vhd:153:39  */
  assign n31_o = rx_byte_count == 6'b111111;
  /* boot_loader.vhd:156:56  */
  assign n33_o = rx_byte_count + 6'b000001;
  /* boot_loader.vhd:153:21  */
  assign n35_o = n31_o ? 6'b000000 : n33_o;
  /* boot_loader.vhd:152:17  */
  assign n36_o = enable_rx_byte_counter ? n35_o : rx_byte_count;
  /* boot_loader.vhd:150:17  */
  assign n38_o = init_byte_counter ? 6'b000000 : n36_o;
  /* boot_loader.vhd:170:20  */
  assign w2b_n44 = w2b_byte_dv; // (signal)
  /* boot_loader.vhd:171:17  */
  assign w2b_n45 = w2b_byte; // (signal)
  /* boot_loader.vhd:163:5  */
  word_2_byte w2b (
    .rst(rst),
    .clk(clk),
    .ce(ce),
    .word_dv(tx_data_valid),
    .word(ram_out),
    .byte_dv(w2b_byte_dv),
    .byte(w2b_byte));
  /* boot_loader.vhd:186:39  */
  assign n54_o = tx_cycle_count == 15'b100011001010000;
  /* boot_loader.vhd:190:54  */
  assign n56_o = tx_cycle_count + 15'b000000000000001;
  /* boot_loader.vhd:186:17  */
  assign n58_o = n54_o ? 15'b000000000000000 : n56_o;
  /* boot_loader.vhd:186:17  */
  assign n61_o = n54_o ? 1'b1 : 1'b0;
  /* boot_loader.vhd:183:17  */
  assign n63_o = init_tx_cycle_count ? 15'b000000000000000 : n58_o;
  /* boot_loader.vhd:183:17  */
  assign n65_o = init_tx_cycle_count ? 1'b0 : n61_o;
  /* boot_loader.vhd:215:13  */
  assign n83_o = current_state == 4'b0000;
  /* boot_loader.vhd:218:17  */
  assign n86_o = rx_word_valid ? 4'b0011 : 4'b0001;
  /* boot_loader.vhd:217:13  */
  assign n88_o = current_state == 4'b0001;
  /* boot_loader.vhd:224:35  */
  assign n90_o = rx_byte_count == 6'b111111;
  /* boot_loader.vhd:224:17  */
  assign n93_o = n90_o ? 4'b0100 : 4'b0010;
  /* boot_loader.vhd:223:13  */
  assign n95_o = current_state == 4'b0011;
  /* boot_loader.vhd:229:13  */
  assign n97_o = current_state == 4'b0010;
  /* boot_loader.vhd:232:17  */
  assign n100_o = scan_memory ? 4'b0101 : 4'b0100;
  /* boot_loader.vhd:231:13  */
  assign n102_o = current_state == 4'b0100;
  /* boot_loader.vhd:237:13  */
  assign n104_o = current_state == 4'b0110;
  /* boot_loader.vhd:240:41  */
  assign n105_o = ~tx_cycle_count_over;
  /* boot_loader.vhd:240:17  */
  assign n108_o = n105_o ? 4'b1000 : 4'b0101;
  /* boot_loader.vhd:239:13  */
  assign n110_o = current_state == 4'b1000;
  /* boot_loader.vhd:245:13  */
  assign n112_o = current_state == 4'b0101;
  /* boot_loader.vhd:248:35  */
  assign n114_o = rx_byte_count == 6'b111111;
  /* boot_loader.vhd:248:17  */
  assign n117_o = n114_o ? 4'b1001 : 4'b0110;
  /* boot_loader.vhd:247:13  */
  assign n119_o = current_state == 4'b0111;
  /* boot_loader.vhd:253:13  */
  assign n121_o = current_state == 4'b1001;
  assign n122_o = {n121_o, n119_o, n112_o, n110_o, n104_o, n102_o, n97_o, n95_o, n88_o, n83_o};
  /* boot_loader.vhd:214:9  */
  always @*
    case (n122_o)
      10'b1000000000: n129_o = 4'b1001;
      10'b0100000000: n129_o = n117_o;
      10'b0010000000: n129_o = 4'b0111;
      10'b0001000000: n129_o = n108_o;
      10'b0000100000: n129_o = 4'b1000;
      10'b0000010000: n129_o = n100_o;
      10'b0000001000: n129_o = 4'b0001;
      10'b0000000100: n129_o = n93_o;
      10'b0000000010: n129_o = n86_o;
      10'b0000000001: n129_o = 4'b0001;
      default: n129_o = 4'bX;
    endcase
  /* boot_loader.vhd:260:13  */
  assign n133_o = current_state == 4'b0000;
  /* boot_loader.vhd:268:13  */
  assign n135_o = current_state == 4'b0001;
  /* boot_loader.vhd:276:13  */
  assign n137_o = current_state == 4'b0011;
  /* boot_loader.vhd:284:13  */
  assign n139_o = current_state == 4'b0010;
  /* boot_loader.vhd:292:13  */
  assign n141_o = current_state == 4'b0100;
  /* boot_loader.vhd:300:13  */
  assign n143_o = current_state == 4'b0101;
  /* boot_loader.vhd:308:13  */
  assign n145_o = current_state == 4'b0111;
  /* boot_loader.vhd:316:13  */
  assign n147_o = current_state == 4'b0110;
  /* boot_loader.vhd:324:13  */
  assign n149_o = current_state == 4'b1000;
  /* boot_loader.vhd:332:13  */
  assign n151_o = current_state == 4'b1001;
  assign n152_o = {n151_o, n149_o, n147_o, n145_o, n143_o, n141_o, n139_o, n137_o, n135_o, n133_o};
  /* boot_loader.vhd:259:9  */
  always @*
    case (n152_o)
      10'b1000000000: n164_o = 1'b0;
      10'b0100000000: n164_o = 1'b1;
      10'b0010000000: n164_o = 1'b1;
      10'b0001000000: n164_o = 1'b1;
      10'b0000100000: n164_o = 1'b1;
      10'b0000010000: n164_o = 1'b0;
      10'b0000001000: n164_o = 1'b1;
      10'b0000000100: n164_o = 1'b1;
      10'b0000000010: n164_o = 1'b1;
      10'b0000000001: n164_o = 1'b1;
      default: n164_o = 1'bX;
    endcase
  /* boot_loader.vhd:259:9  */
  always @*
    case (n152_o)
      10'b1000000000: n176_o = 1'b0;
      10'b0100000000: n176_o = 1'b0;
      10'b0010000000: n176_o = 1'b0;
      10'b0001000000: n176_o = 1'b0;
      10'b0000100000: n176_o = 1'b0;
      10'b0000010000: n176_o = 1'b0;
      10'b0000001000: n176_o = 1'b0;
      10'b0000000100: n176_o = 1'b1;
      10'b0000000010: n176_o = 1'b0;
      10'b0000000001: n176_o = 1'b0;
      default: n176_o = 1'bX;
    endcase
  /* boot_loader.vhd:259:9  */
  always @*
    case (n152_o)
      10'b1000000000: n188_o = 1'b0;
      10'b0100000000: n188_o = 1'b0;
      10'b0010000000: n188_o = 1'b0;
      10'b0001000000: n188_o = 1'b1;
      10'b0000100000: n188_o = 1'b0;
      10'b0000010000: n188_o = 1'b0;
      10'b0000001000: n188_o = 1'b0;
      10'b0000000100: n188_o = 1'b0;
      10'b0000000010: n188_o = 1'b0;
      10'b0000000001: n188_o = 1'b0;
      default: n188_o = 1'bX;
    endcase
  /* boot_loader.vhd:259:9  */
  always @*
    case (n152_o)
      10'b1000000000: n200_o = 1'b0;
      10'b0100000000: n200_o = 1'b0;
      10'b0010000000: n200_o = 1'b1;
      10'b0001000000: n200_o = 1'b0;
      10'b0000100000: n200_o = 1'b0;
      10'b0000010000: n200_o = 1'b0;
      10'b0000001000: n200_o = 1'b1;
      10'b0000000100: n200_o = 1'b0;
      10'b0000000010: n200_o = 1'b0;
      10'b0000000001: n200_o = 1'b0;
      default: n200_o = 1'bX;
    endcase
  /* boot_loader.vhd:259:9  */
  always @*
    case (n152_o)
      10'b1000000000: n212_o = 1'b0;
      10'b0100000000: n212_o = 1'b0;
      10'b0010000000: n212_o = 1'b0;
      10'b0001000000: n212_o = 1'b0;
      10'b0000100000: n212_o = 1'b0;
      10'b0000010000: n212_o = 1'b1;
      10'b0000001000: n212_o = 1'b0;
      10'b0000000100: n212_o = 1'b0;
      10'b0000000010: n212_o = 1'b0;
      10'b0000000001: n212_o = 1'b1;
      default: n212_o = 1'bX;
    endcase
  /* boot_loader.vhd:259:9  */
  always @*
    case (n152_o)
      10'b1000000000: n224_o = 1'b1;
      10'b0100000000: n224_o = 1'b0;
      10'b0010000000: n224_o = 1'b1;
      10'b0001000000: n224_o = 1'b1;
      10'b0000100000: n224_o = 1'b1;
      10'b0000010000: n224_o = 1'b1;
      10'b0000001000: n224_o = 1'b1;
      10'b0000000100: n224_o = 1'b1;
      10'b0000000010: n224_o = 1'b1;
      10'b0000000001: n224_o = 1'b1;
      default: n224_o = 1'bX;
    endcase
  /* boot_loader.vhd:148:9  */
  assign n231_o = ce ? n38_o : rx_byte_count;
  /* boot_loader.vhd:148:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n232_q <= 6'b000000;
    else
      n232_q <= n231_o;
  /* boot_loader.vhd:205:9  */
  assign n233_o = ce ? future_state : current_state;
  /* boot_loader.vhd:205:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n234_q <= 4'b0000;
    else
      n234_q <= n233_o;
  /* boot_loader.vhd:181:9  */
  assign n235_o = ce ? n63_o : tx_cycle_count;
  /* boot_loader.vhd:181:9  */
  always @(posedge clk or posedge rst)
    if (rst)
      n236_q <= 15'b000000000000000;
    else
      n236_q <= n235_o;
  /* boot_loader.vhd:177:5  */
  assign n237_o = ~rst;
  /* boot_loader.vhd:177:5  */
  assign n238_o = ce & n237_o;
  /* boot_loader.vhd:181:9  */
  assign n239_o = n238_o ? n65_o : tx_cycle_count_over;
  /* boot_loader.vhd:181:9  */
  always @(posedge clk)
    n240_q <= n239_o;
endmodule

