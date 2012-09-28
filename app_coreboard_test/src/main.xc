// Copyright (c) 2011, XMOS Ltd., All rights reserved
// This software is freely distributable under a derivative of the
// University of Illinois/NCSA Open Source License posted in
// LICENSE.txt and at <http://github.xcore.com/>

/*===========================================================================
 Filename: main.xc
 Project : app_coreboard_test
 Author : XMOS Ltd
 Version : 1v0
 Purpose : manufacturing test of core boards using loopback dual slice
 -----------------------------------------------------------------------------

 ===========================================================================*/

/*---------------------------------------------------------------------------
 include files
 ---------------------------------------------------------------------------*/

#include<xs1.h>
#include<print.h>
#include<platform.h>
#include<string.h>

#define DISABLE_SPI

//P8A
#define P8A0_P1I  1 << 18
#define P8A1_P1N  1 << 17
#define P8A2_P1M  1 << 16
#define P8A3_P1K  1 << 15
#define P8A4_P8C5 1 << 8
#define P8A5_P8C4 1 << 7
#define P8A6_P1P  1 << 6
#define P8A7_P1L0 1 << 5

//P8B
#define P8B0_P8C2 1 << 12
#define P8B1_P8C1 1 << 11
#define P1D_P8B2  1 << 13
#define P1A_P8B3  1 << 19
#define P8B4_P1H0 1 << 2
#define P8B6_P1J0 1 << 1
#define P8B7_P8C7 1
#define P1E0_P8B5 1 << 4

//others
#define P1C_P8C3  1 << 14
#define P1G_P8C0  1 << 10
#define P1B_P1O   1 << 9
#define P1F0_P8C6 1 << 3


/*---------------------------------------------------------------------------
 ports and clocks
 ---------------------------------------------------------------------------*/
 //::Port configuration
on stdcore[1]: port p8a1 = XS1_PORT_8A;
on stdcore[1]: port p8b1 = XS1_PORT_8B;
on stdcore[1]: port p8c1 = XS1_PORT_8C;

on stdcore[1]: port p1a1 = XS1_PORT_1A;
on stdcore[1]: port p1b1 = XS1_PORT_1B;
on stdcore[1]: port p1c1 = XS1_PORT_1C;
on stdcore[1]: port p1d1 = XS1_PORT_1D;
on stdcore[1]: port p1e1 = XS1_PORT_1E;
on stdcore[1]: port p1f1 = XS1_PORT_1F;
on stdcore[1]: port p1g1 = XS1_PORT_1G;
on stdcore[1]: port p1h1 = XS1_PORT_1H;
on stdcore[1]: port p1i1 = XS1_PORT_1I;
on stdcore[1]: port p1j1 = XS1_PORT_1J;
on stdcore[1]: port p1k1 = XS1_PORT_1K;
on stdcore[1]: port p1l1 = XS1_PORT_1L;
on stdcore[1]: port p1n1 = XS1_PORT_1N;
on stdcore[1]: port p1m1 = XS1_PORT_1M;
on stdcore[1]: port p1o1 = XS1_PORT_1O;
on stdcore[1]: port p1p1 = XS1_PORT_1P;

on stdcore[0]: port p8a0 = XS1_PORT_8A;
on stdcore[0]: port p8b0 = XS1_PORT_8B;
on stdcore[0]: port p8c0 = XS1_PORT_8C;
on stdcore[0]: port p8d0 = XS1_PORT_8D;

on stdcore[0]: port p1a0 = XS1_PORT_1A;
on stdcore[0]: port p1b0 = XS1_PORT_1B;
on stdcore[0]: port p1c0 = XS1_PORT_1C;
on stdcore[0]: port p1d0 = XS1_PORT_1D;
on stdcore[0]: port p1e0 = XS1_PORT_1E;
on stdcore[0]: port p1f0 = XS1_PORT_1F;
on stdcore[0]: port p1g0 = XS1_PORT_1G;
on stdcore[0]: port p1h0 = XS1_PORT_1H;
on stdcore[0]: port p1i0 = XS1_PORT_1I;
on stdcore[0]: port p1j0 = XS1_PORT_1J;
on stdcore[0]: port p1k0 = XS1_PORT_1K;
on stdcore[0]: port p1l0 = XS1_PORT_1L;
on stdcore[0]: port p1n0 = XS1_PORT_1N;
on stdcore[0]: port p1m0 = XS1_PORT_1M;
on stdcore[0]: port p1o0 = XS1_PORT_1O;
on stdcore[0]: port p1p0 = XS1_PORT_1P;


void wait(void) {
  int i=0;
  while(i<1000) { i = i+1;}
}

void waitlong(void) {
  int i=0;
  while(i<0x00FFFFFF) { i = i+1;}
}

void  all_1b_ports_input1() {
  unsigned tmp;
  p1a1 :> tmp;
  p1b1 :> tmp;
  p1c1 :> tmp;
  p1d1 :> tmp;
  p1e1 :> tmp;
  p1f1 :> tmp;
  p1g1 :> tmp;
  p1h1 :> tmp;
  p1i1 :> tmp;
  p1j1 :> tmp;
  p1k1 :> tmp;
  p1l1 :> tmp;
  p1m1 :> tmp;
  p1n1 :> tmp;
  p1o1 :> tmp;
  p1p1 :> tmp;
}

void  all_1b_ports_input0() {
  unsigned tmp;
  p1a0 :> tmp;
  p1b0 :> tmp;
  p1c0 :> tmp;
  p1d0 :> tmp;
  p1e0 :> tmp;
  p1f0 :> tmp;
  p1g0 :> tmp;
  p1h0 :> tmp;
  p1i0 :> tmp;
  p1j0 :> tmp;
  p1k0 :> tmp;
  p1l0 :> tmp;
  p1m0 :> tmp;
  p1n0 :> tmp;
  p1o0 :> tmp;
  p1p0 :> tmp;
}


int run_test1(chanend c) {
  //result vector
  unsigned int result, tmp;
  unsigned char message[60];
  unsigned failed=0;

   printstr("On Core 1 Begin test\n");
  //1: test P8A driving partners
  all_1b_ports_input1();
  printstr("On Core 1 test #1\n");
  
  p8a1 <: 0xAA;
  wait();
  p1n1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A1 failed to drive P1N to 1\n");}
  p1m1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A2 failed to drive P1M to 0\n");}
  p1k1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A3 failed to drive P1K to 1\n");}
  p1p1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A6 failed to drive P1P to 0\n");}
  p1l1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A7 failed to drive P1L to 1\n");}
  p1i1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A0 failed to drive P1I to 0\n");}
  p8c1 :> tmp; if(tmp & 0x20) { failed=1; printstr("On Core 1 8A4 failed to drive P8C5 to 0\n");}
			  if(!(tmp & 0x10)) { failed=1; printstr("On Core 1 8A5 failed to drive P8C4 to 1\n");}
			  
  p8a1 <: 0x55;
  wait();  
  p1n1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A1 failed to drive P1N to 1\n");}
  p1m1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A2 failed to drive P1M to 0\n");}
  p1k1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A3 failed to drive P1K to 0\n");}
  p1p1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A6 failed to drive P1P to 1\n");}
  p1l1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A7 failed to drive P1L to 0\n");}
  p1i1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A0 failed to drive P1I to 1\n");}
  p8c1 :> tmp; if(!(tmp & 0x20)) { failed=1; printstr("On Core 1 8A4 failed to drive P8C5 to 1\n");}
              if((tmp & 0x10)) { failed=1; printstr("On Core 1 8A5 failed to drive P8C4 to 0\n");}
		  
  p8a1 <: 0xFF;
  wait();  
  p1n1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A1 failed to drive P1N to 1\n");}
  p1m1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A2 failed to drive P1M to 1\n");}
  p1k1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A3 failed to drive P1K to 1\n");}
  p1p1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A6 failed to drive P1P to 1\n");}
  p1l1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A7 failed to drive P1L to 1\n");}
  p1i1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A0 failed to drive P1I to 1\n");}
  // p8c1 :> tmp; if(!(tmp & 0x30)) { failed=1; printstr("On Core 1 8A4, 8A5 failed to drive P8C5, P8C4 to 1\n");}
  p8c1 :> tmp; if(!(tmp & 0x20)) { failed=1; printstr("On Core 1 8A4 failed to drive P8C5 to 1\n");}
			  if(!(tmp & 0x10)) { failed=1; printstr("On Core 1 8A5 failed to drive P8C4 to 1\n");}
  
  p8a1 <: 0;
  wait();
  p1n1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A1 failed to drive P1N to 0\n");}
  p1m1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A2 failed to drive P1M to 0\n");}
  p1k1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A3 failed to drive P1K to 0\n");}
  p1p1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A6 failed to drive P1P to 0\n");}
  p1l1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A7 failed to drive P1L to 0\n");}
  p1i1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A0 failed to drive P1I to 0\n");}
 // p8c1 :> tmp; if(tmp & 0x30) { failed=1; printstr("On Core 1 8A4, 8A5 failed to drive P8C5, P8C4 to 0\n");}
   p8c1 :> tmp; if(tmp & 0x20) { failed=1; printstr("On Core 1 8A4 failed to drive P8C5 to 0\n");}
			  if(tmp & 0x10) { failed=1; printstr("On Core 1 8A5 failed to drive P8C4 to 0\n");}
  

              

  //2: test P8B driving partners
  all_1b_ports_input1();
  printstr("On Core 1 test #2\n");

  p8b1 <: 0xAA;
  wait();
  p1a1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B3 failed to drive P1A to 1\n");}
  p1d1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B2 failed to drive P1D to 0\n");}
  p1e1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B5 failed to drive P1E to 1\n");}
  p1h1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B4 failed to drive P1H to 0\n");}
  p1j1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B6 failed to drive P1J to 0\n");}
  p8c1 :> tmp; 
  if(tmp & 0x04) { failed=1; printstr("On Core 1 8B0 failed to drive P8C2 to 0\n");}
  if(!(tmp & 0x02)) { failed=1; printstr("On Core 1 8B1 failed to drive P8C1 to 1\n");}
  if(!(tmp & 0xF0)) { failed=1; printstr("On Core 1 8B7 failed to drive P8C7 to 1\n");}
  
  p8b1 <: 0x55;
  wait();
  p1a1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B3 failed to drive P1A to 0\n");}
  p1d1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B2 failed to drive P1D to 1\n");}
  p1e1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B5 failed to drive P1E to 0\n");}
  p1h1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B4 failed to drive P1H to 1\n");}
  p1j1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B6 failed to drive P1J to 1\n");}
  p8c1 :> tmp; 
  if(!(tmp & 0x04)) { failed=1; printstr("On Core 1 8B0 failed to drive P8C2 to 1\n");}
  if(tmp & 0x02) { failed=1; printstr("On Core 1 8B1 failed to drive P8C1 to 0\n");}
  if(tmp & 0xF0) { failed=1; printstr("On Core 1 8B7 failed to drive P8C7 to 0\n");}
  
  p8b1 <: 0xFF;
  wait();  

  p1a1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B3 failed to drive P1A to 1\n");}
  p1d1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B2 failed to drive P1D to 1\n");}
  p1e1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B5 failed to drive P1E to 1\n");}
  p1h1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B4 failed to drive P1H to 1\n");}
  p1j1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B6 failed to drive P1J to 1\n");}
  //p8c1 :> tmp; if(!(tmp & 0x86)) { failed=1; printstr("On Core 1 8B0, 8B1, 8B7 failed to drive P8C2, P8C1, P8C7 to 0\n");}
  p8c1 :> tmp; 
  if(!(tmp & 0x04)) { failed=1; printstr("On Core 1 8B0 failed to drive P8C2 to 1\n");}
  if(!(tmp & 0x02)) { failed=1; printstr("On Core 1 8B1 failed to drive P8C1 to 1\n");}
  if(!(tmp & 0xF0)) { failed=1; printstr("On Core 1 8B7 failed to drive P8C7 to 1\n");}

  p8b1 <: 0;
  wait();
  p1a1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B3 failed to drive P1A to 0\n");}
  p1d1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B2 failed to drive P1D to 0\n");}
  p1e1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B5 failed to drive P1E to 0\n");}
  p1h1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B4 failed to drive P1H to 0\n");}
  p1j1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B6 failed to drive P1J to 0\n");}
  //p8c1 :> tmp; if(tmp & 0x86) { failed=1; printstr("On Core 1 8B0, 8B1, 8B7 failed to drive P8C2, P8C1, P8C7 to 0\n");}
  p8c1 :> tmp; 
  if(tmp & 0x04) { failed=1; printstr("On Core 1 8B0 failed to drive P8C2 to 0\n");}
  if(tmp & 0x02) { failed=1; printstr("On Core 1 8B1 failed to drive P8C1 to 0\n");}
  if(tmp & 0xF0) { failed=1; printstr("On Core 1 8B7 failed to drive P8C7 to 0\n");}

  //3: test remainder of drivers for port 8c, and port 1B driving port 1O
  all_1b_ports_input1();
  printstr("On Core 1 test #3\n");

  p1c1 <: 1;
  p1g1 <: 0;
  p1b1 <: 1;
  p1f1 <: 0;
  wait();
 // p8c1 :> tmp; if(tmp & 0x45) { failed=1; printstr("On Core 1 P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 0\n");}
  p8c1 :> tmp; 
  if(tmp & 0x01) { failed=1; printstr("On Core 1 P1G failed to drive P8C0 to 0\n");}
  if(!(tmp & 0x08)) { failed=1; printstr("On Core 1 P1C failed to drive P8C3 to 1\n");}
  if(tmp & 0x40) { failed=1; printstr("On Core 1 P1F failed to drive P8C6 to 0\n");}
  p1o1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 P1B failed to drive P1O to 1\n");}
  
  p1c1 <: 0;
  p1g1 <: 1;
  p1b1 <: 0;
  p1f1 <: 1;
  wait();
 // p8c1 :> tmp; if(tmp & 0x45) { failed=1; printstr("On Core 1 P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 0\n");}
  p8c1 :> tmp; 
  if(!(tmp & 0x01)) { failed=1; printstr("On Core 1 P1G failed to drive P8C0 to 1\n");}
  if(tmp & 0x08) { failed=1; printstr("On Core 1 P1C failed to drive P8C3 to 0\n");}
  if(!(tmp & 0x40)) { failed=1; printstr("On Core 1 P1F failed to drive P8C6 to 1\n");}
  p1o1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P1B failed to drive P1O to 0\n");}

  p1c1 <:1;
  p1g1 <: 1;
  p1b1 <: 1;
  p1f1 <: 1;
  wait();
 // p8c1 :> tmp; if(!(tmp & 0x45)) { failed=1; printstr("On Core 1 P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 1\n");}
  p8c1 :> tmp; 
  if(!(tmp & 0x01)) { failed=1; printstr("On Core 1 P1G failed to drive P8C0 to 1\n");}
  if(!(tmp & 0x08)) { failed=1; printstr("On Core 1 P1C failed to drive P8C3 to 1\n");}
  if(!(tmp & 0x40)) { failed=1; printstr("On Core 1 P1F failed to drive P8C6 to 1\n");}
  p1o1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 P1B failed to drive P1O to 1\n");} //EB

  p1c1 <:0;
  p1g1 <: 0;
  p1b1 <: 0;
  p1f1 <: 0;
  wait();
 // p8c1 :> tmp; if(tmp & 0x45) { failed=1; printstr("On Core 1 P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 0\n");}
  p8c1 :> tmp; 
  if(tmp & 0x01) { failed=1; printstr("On Core 1 P1G failed to drive P8C0 to 0\n");}
  if(tmp & 0x08) { failed=1; printstr("On Core 1 P1C failed to drive P8C3 to 0\n");}
  if(tmp & 0x40) { failed=1; printstr("On Core 1 P1F failed to drive P8C6 to 0\n");}
  p1o1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P1B failed to drive P1O to 0\n");}

  //4: test P8A being driven by partners
    printstr("On Core 1 test #4\n");

  p8a1 :> tmp; //turn port round
  p8b1 :> tmp;
  p8c1 :> tmp;
  all_1b_ports_input1();

  p1n1 <: 0;
  p1m1 <: 0;
  p1k1 <: 0;
  p1p1 <: 0;
  p1l1 <: 0;
  p1i1 <: 0;
  p8c1 <: 0x00;

  wait();
  p8a1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A was not driven to to 0\n");}

  p1n1 <: 1;
  p1m1 <: 1;
  p1k1 <: 1;
  p1p1 <: 1;
  p1l1 <: 1;
  p1i1 <: 1;
  p8c1 <: 0xFF;

  wait();
  p8a1 :> tmp; if(tmp != 0xFF) { failed=1; printstr("On Core 1 8A was not driven to to 1\n");}


  p1n1 <: 0;
  p1m1 <: 0;
  p1k1 <: 0;
  p1p1 <: 0;
  p1l1 <: 0;
  p1i1 <: 0;
  p8c1 <: 0x00;
      wait();

    p8a1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A was not driven to to 0\n");} 


  wait();

  //5: test partners driving P8B
    printstr("On Core 1 test #5\n");

  p8a1 :> tmp; //turn port round
  p8b1 :> tmp;
  p8c1 :> tmp;
  all_1b_ports_input1();

  p1a1 <: 0;
  p1d1 <: 0;
  p1e1 <: 0;
  p1h1 <: 0;
  p1j1 <: 0;
  p8c1 <: 0;

  wait();

  p8b1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B was not driven to to 0\n");}

  p1a1 <: 1;
  p1d1 <: 1;
  p1e1 <: 1;
  p1h1 <: 1;
  p1j1 <: 1;
  p8c1 <: 0xFF;
  wait();  

  p8b1 :> tmp; if(tmp != 0xFF) { failed=1; printstr("On Core 1 8B was not driven to to 1\n");}

  p1a1 <: 0;
  p1d1 <: 0;
  p1e1 <: 0;
  p1h1 <: 0;
  p1j1 <: 0;
  p8c1 <: 0;
  wait();  
  p8b1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B was not driven to to 0\n");}

  //6: test remainder of drivers 
    printstr("On Core 1 test #6\n");

  all_1b_ports_input1();
  p1o1 <: 0;
  p8c1 <: 0;

  p1c1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P8C3 failed to drive P1C to 0\n");}
  
  p1g1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P8C0 failed to drive P1G to 0\n");}
  p1b1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P1O failed to drive P1B to 0\n");}
  p1f1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P8C6 failed to drive P1F to 0\n");}

  p1o1 <: 1;
  p8c1 <: 0xFF;

  wait();

  p1c1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 P8C3 failed to drive P1C to 1\n");}
  p1g1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 P8C0 failed to drive P1G to 1\n");}
  p1b1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 P1O failed to drive P1B to 1\n");}
  p1f1 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 P8C6 failed to drive P1F to 1\n");}

  p1o1 <: 0;
  p8c1 <: 0;

  wait();

  p1c1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P8C3 failed to drive P1C to 0\n");}
  p1g1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P8C0 failed to drive P1G to 0\n");}
  p1b1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P1O failed to drive P1B to 0\n");}
  p1f1 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P8C6 failed to drive P1F to 0\n");}


  //Output Test Status

  if(failed) { 
    printstr("On Core 1 TEST STATUS: FAILED :(\n"); 
  } else {
    printstr("On Core 1 TEST STATUS: PASSED :)\n");
  }
  c <: 0;
}

int run_test0(chanend c) {
  //result vector
  unsigned int result, tmp;
  unsigned char message[60];
  unsigned failed=0;
  
  c :> tmp;
  
  printstr("On Core 0 Begin test\n");
#ifdef DISABLE_SPI  
  // Latch SPI Disabled
  p8d0 <: 0x80;
  p8d0 <: 0xC0;
#else
  // Latch SPI Enabled
  p8d0 <: 0x00;
  p8d0 <: 0x40;
#endif
  
 //1: test P8A driving partners
  all_1b_ports_input0();
  printstr("On Core 1 test #1\n");
  
  p8a0 <: 0xAA;
  wait();
  p1n0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A1 failed to drive P1N to 1\n");}
  p1m0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A2 failed to drive P1M to 0\n");}
  p1k0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A3 failed to drive P1K to 1\n");}
  p1p0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A6 failed to drive P1P to 0\n");}
  p1l0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A7 failed to drive P1L to 1\n");}
  p1i0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A0 failed to drive P1I to 0\n");}
  p8c0 :> tmp; if(tmp & 0x20) { failed=1; printstr("On Core 1 8A4 failed to drive P8C5 to 0\n");}
			  if(!(tmp & 0x10)) { failed=1; printstr("On Core 1 8A5 failed to drive P8C4 to 1\n");}
			  
  p8a0 <: 0x55;
  wait();  
  p1n0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A1 failed to drive P1N to 1\n");}
  p1m0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A2 failed to drive P1M to 0\n");}
  p1k0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A3 failed to drive P1K to 0\n");}
  p1p0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A6 failed to drive P1P to 1\n");}
  p1l0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A7 failed to drive P1L to 0\n");}
  p1i0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A0 failed to drive P1I to 1\n");}
  p8c0 :> tmp; if(!(tmp & 0x20)) { failed=1; printstr("On Core 1 8A4 failed to drive P8C5 to 1\n");}
              if((tmp & 0x10)) { failed=1; printstr("On Core 1 8A5 failed to drive P8C4 to 0\n");}
		  
  p8a0 <: 0xFF;
  wait();  
  p1n0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A1 failed to drive P1N to 1\n");}
  p1m0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A2 failed to drive P1M to 1\n");}
  p1k0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A3 failed to drive P1K to 1\n");}
  p1p0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A6 failed to drive P1P to 1\n");}
  p1l0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A7 failed to drive P1L to 1\n");}
  p1i0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8A0 failed to drive P1I to 1\n");}
  // p8c0 :> tmp; if(!(tmp & 0x30)) { failed=1; printstr("On Core 1 8A4, 8A5 failed to drive P8C5, P8C4 to 1\n");}
  p8c0 :> tmp; if(!(tmp & 0x20)) { failed=1; printstr("On Core 1 8A4 failed to drive P8C5 to 1\n");}
			  if(!(tmp & 0x10)) { failed=1; printstr("On Core 1 8A5 failed to drive P8C4 to 1\n");}
  
  p8a0 <: 0;
  wait();
  p1n0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A1 failed to drive P1N to 0\n");}
  p1m0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A2 failed to drive P1M to 0\n");}
  p1k0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A3 failed to drive P1K to 0\n");}
  p1p0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A6 failed to drive P1P to 0\n");}
  p1l0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A7 failed to drive P1L to 0\n");}
  p1i0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8A0 failed to drive P1I to 0\n");}
 // p8c0 :> tmp; if(tmp & 0x30) { failed=1; printstr("On Core 1 8A4, 8A5 failed to drive P8C5, P8C4 to 0\n");}
   p8c0 :> tmp; if(tmp & 0x20) { failed=1; printstr("On Core 1 8A4 failed to drive P8C5 to 0\n");}
			  if(tmp & 0x10) { failed=1; printstr("On Core 1 8A5 failed to drive P8C4 to 0\n");}
  
  //2: test P8B driving partners
  all_1b_ports_input0();
  printstr("On Core 1 test #2\n");

  p8b0 <: 0xAA;
  wait();
  p1a0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B3 failed to drive P1A to 1\n");}
  p1d0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B2 failed to drive P1D to 0\n");}
  p1e0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B5 failed to drive P1E to 1\n");}
  p1h0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B4 failed to drive P1H to 0\n");}
  p1j0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B6 failed to drive P1J to 0\n");}
  p8c0 :> tmp; 
  if(tmp & 0x04) { failed=1; printstr("On Core 1 8B0 failed to drive P8C2 to 0\n");}
  if(!(tmp & 0x02)) { failed=1; printstr("On Core 1 8B1 failed to drive P8C1 to 1\n");}
  if(!(tmp & 0xF0)) { failed=1; printstr("On Core 1 8B7 failed to drive P8C7 to 1\n");}
  
  p8b0 <: 0x55;
  wait();
  p1a0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B3 failed to drive P1A to 0\n");}
  p1d0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B2 failed to drive P1D to 1\n");}
  p1e0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B5 failed to drive P1E to 0\n");}
  p1h0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B4 failed to drive P1H to 1\n");}
  p1j0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B6 failed to drive P1J to 1\n");}
  p8c0 :> tmp; 
  if(!(tmp & 0x04)) { failed=1; printstr("On Core 1 8B0 failed to drive P8C2 to 1\n");}
  if(tmp & 0x02) { failed=1; printstr("On Core 1 8B1 failed to drive P8C1 to 0\n");}
  if(tmp & 0xF0) { failed=1; printstr("On Core 1 8B7 failed to drive P8C7 to 0\n");}
  
  p8b0 <: 0xFF;
  wait();  

  p1a0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B3 failed to drive P1A to 1\n");}
  p1d0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B2 failed to drive P1D to 1\n");}
  p1e0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B5 failed to drive P1E to 1\n");}
  p1h0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B4 failed to drive P1H to 1\n");}
  p1j0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 8B6 failed to drive P1J to 1\n");}
  //p8c0 :> tmp; if(!(tmp & 0x86)) { failed=1; printstr("On Core 1 8B0, 8B1, 8B7 failed to drive P8C2, P8C1, P8C7 to 0\n");}
  p8c0 :> tmp; 
  if(!(tmp & 0x04)) { failed=1; printstr("On Core 1 8B0 failed to drive P8C2 to 1\n");}
  if(!(tmp & 0x02)) { failed=1; printstr("On Core 1 8B1 failed to drive P8C1 to 1\n");}
  if(!(tmp & 0xF0)) { failed=1; printstr("On Core 1 8B7 failed to drive P8C7 to 1\n");}

  p8b0 <: 0;
  wait();
  p1a0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B3 failed to drive P1A to 0\n");}
  p1d0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B2 failed to drive P1D to 0\n");}
  p1e0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B5 failed to drive P1E to 0\n");}
  p1h0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B4 failed to drive P1H to 0\n");}
  p1j0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 8B6 failed to drive P1J to 0\n");}
  //p8c0 :> tmp; if(tmp & 0x86) { failed=1; printstr("On Core 1 8B0, 8B1, 8B7 failed to drive P8C2, P8C1, P8C7 to 0\n");}
  p8c0 :> tmp; 
  if(tmp & 0x04) { failed=1; printstr("On Core 1 8B0 failed to drive P8C2 to 0\n");}
  if(tmp & 0x02) { failed=1; printstr("On Core 1 8B1 failed to drive P8C1 to 0\n");}
  if(tmp & 0xF0) { failed=1; printstr("On Core 1 8B7 failed to drive P8C7 to 0\n");}

  //3: test remainder of drivers for port 8c, and port 1B driving port 1O
  all_1b_ports_input0();
  printstr("On Core 1 test #3\n");

  p1c0 <: 1;
  p1g0 <: 0;
  p1b0 <: 1;
  p1f0 <: 0;
  wait();
 // p8c0 :> tmp; if(tmp & 0x45) { failed=1; printstr("On Core 1 P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 0\n");}
  p8c0 :> tmp; 
  if(tmp & 0x01) { failed=1; printstr("On Core 1 P1G failed to drive P8C0 to 0\n");}
  if(!(tmp & 0x08)) { failed=1; printstr("On Core 1 P1C failed to drive P8C3 to 1\n");}
  if(tmp & 0x40) { failed=1; printstr("On Core 1 P1F failed to drive P8C6 to 0\n");}
  p1o0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 P1B failed to drive P1O to 1\n");}
  
  p1c0 <: 0;
  p1g0 <: 1;
  p1b0 <: 0;
  p1f0 <: 1;
  wait();
 // p8c0 :> tmp; if(tmp & 0x45) { failed=1; printstr("On Core 1 P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 0\n");}
  p8c0 :> tmp; 
  if(!(tmp & 0x01)) { failed=1; printstr("On Core 1 P1G failed to drive P8C0 to 1\n");}
  if(tmp & 0x08) { failed=1; printstr("On Core 1 P1C failed to drive P8C3 to 0\n");}
  if(!(tmp & 0x40)) { failed=1; printstr("On Core 1 P1F failed to drive P8C6 to 1\n");}
  p1o0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P1B failed to drive P1O to 0\n");}

  p1c0 <:1;
  p1g0 <: 1;
  p1b0 <: 1;
  p1f0 <: 1;
  wait();
 // p8c0 :> tmp; if(!(tmp & 0x45)) { failed=1; printstr("On Core 1 P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 1\n");}
  p8c0 :> tmp; 
  if(!(tmp & 0x01)) { failed=1; printstr("On Core 1 P1G failed to drive P8C0 to 1\n");}
  if(!(tmp & 0x08)) { failed=1; printstr("On Core 1 P1C failed to drive P8C3 to 1\n");}
  if(!(tmp & 0x40)) { failed=1; printstr("On Core 1 P1F failed to drive P8C6 to 1\n");}
  p1o0 :> tmp; if(!tmp) { failed=1; printstr("On Core 1 P1B failed to drive P1O to 1\n");} //EB

  p1c0 <:0;
  p1g0 <: 0;
  p1b0 <: 0;
  p1f0 <: 0;
  wait();
 // p8c0 :> tmp; if(tmp & 0x45) { failed=1; printstr("On Core 1 P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 0\n");}
  p8c0 :> tmp; 
  if(tmp & 0x01) { failed=1; printstr("On Core 1 P1G failed to drive P8C0 to 0\n");}
  if(tmp & 0x08) { failed=1; printstr("On Core 1 P1C failed to drive P8C3 to 0\n");}
  if(tmp & 0x40) { failed=1; printstr("On Core 1 P1F failed to drive P8C6 to 0\n");}
  p1o0 :> tmp; if(tmp) { failed=1; printstr("On Core 1 P1B failed to drive P1O to 0\n");}

  //4: test P8A being driven by partners
    printstr("On Core 0 test #4\n");

  p8a0 :> tmp; //turn port round
  p8b0 :> tmp;
  p8c0 :> tmp;
  all_1b_ports_input0();

  p1n0 <: 0;
  p1m0 <: 0;
  p1k0 <: 0;
  p1p0 <: 0;
  p1l0 <: 0;
  p1i0 <: 0;
  p8c0 <: 0x00;

  wait();
  p8a0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 8A was not driven to to 0\n");}

  p1n0 <: 1;
  p1m0 <: 1;
  p1k0 <: 1;
  p1p0 <: 1;
  p1l0 <: 1;
  p1i0 <: 1;
  p8c0 <: 0xFF;

  wait();
  p8a0 :> tmp; if(tmp != 0xFF) { failed=1; printstr("On Core 0 8A was not driven to to 1\n");}


  p1n0 <: 0;
  p1m0 <: 0;
  p1k0 <: 0;
  p1p0 <: 0;
  p1l0 <: 0;
  p1i0 <: 0;
  p8c0 <: 0x00;
      wait();

    p8a0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 8A was not driven to to 0\n");} 


  wait();

  //5: test partners driving P8B
    printstr("On Core 0 test #5\n");

  p8a0 :> tmp; //turn port round
  p8b0 :> tmp;
  p8c0 :> tmp;
  all_1b_ports_input0();

  p1a0 <: 0;
  p1d0 <: 0;
  p1e0 <: 0;
  p1h0 <: 0;
  p1j0 <: 0;
  p8c0 <: 0;

  wait();

  p8b0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 8B was not driven to to 0\n");}

  p1a0 <: 1;
  p1d0 <: 1;
  p1e0 <: 1;
  p1h0 <: 1;
  p1j0 <: 1;
  p8c0 <: 0xFF;
  wait();  

  p8b0 :> tmp; if(tmp != 0xFF) { failed=1; printstr("On Core 0 8B was not driven to to 1\n");}

  p1a0 <: 0;
  p1d0 <: 0;
  p1e0 <: 0;
  p1h0 <: 0;
  p1j0 <: 0;
  p8c0 <: 0;
  wait();  
  p8b0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 8B was not driven to to 0\n");}

  //6: test remainder of drivers 
    printstr("On Core 0 test #6\n");

  all_1b_ports_input0();
  p1o0 <: 0;
  p8c0 <: 0;

  p1c0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 P8C3 failed to drive P1C to 0\n");}
  
  p1g0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 P8C0 failed to drive P1G to 0\n");}
  p1b0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 P1O failed to drive P1B to 0\n");}
  p1f0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 P8C6 failed to drive P1F to 0\n");}

  p1o0 <: 1;
  p8c0 <: 0xFF;

  wait();

  p1c0 :> tmp; if(!tmp) { failed=1; printstr("On Core 0 P8C3 failed to drive P1C to 1\n");}
  p1g0 :> tmp; if(!tmp) { failed=1; printstr("On Core 0 P8C0 failed to drive P1G to 1\n");}
  p1b0 :> tmp; if(!tmp) { failed=1; printstr("On Core 0 P1O failed to drive P1B to 1\n");}
  p1f0 :> tmp; if(!tmp) { failed=1; printstr("On Core 0 P8C6 failed to drive P1F to 1\n");}

  p1o0 <: 0;
  p8c0 <: 0;

  wait();

  p1c0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 P8C3 failed to drive P1C to 0\n");}
  p1g0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 P8C0 failed to drive P1G to 0\n");}
  p1b0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 P1O failed to drive P1B to 0\n");}
  p1f0 :> tmp; if(tmp) { failed=1; printstr("On Core 0 P8C6 failed to drive P1F to 0\n");}


  //Output Test Status

  if(failed) { 
    printstr("On Core 0 TEST STATUS: FAILED :(\n"); 
  } else {
    printstr("On Core 0 TEST STATUS: PASSED :)\n");
  }
  
   printstr("P8D LEDs should be flashing in sequence now\n Ctrl+C to exit test\n");
   while(1)
   {
		p8d0 <: 0x7F;
		waitlong();
		p8d0 <: 0xBF;
		waitlong();
		p8d0 <: 0xDF;
		waitlong();
		p8d0 <: 0xEF;
		waitlong();
   }
}

int main(void)
{
    chan c;
  par {

	
    on stdcore[1] : run_test1(c);
	on stdcore[0] : run_test0(c);
  }
}
