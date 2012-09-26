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

#define PATTERNA 0
#define PATTERNB 1




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
on stdcore[1]: port p8a = XS1_PORT_8A;
on stdcore[1]: port p8b = XS1_PORT_8B;
on stdcore[1]: port p8c = XS1_PORT_8C;

on stdcore[1]: port p1a = XS1_PORT_1A;
on stdcore[1]: port p1b = XS1_PORT_1B;
on stdcore[1]: port p1c = XS1_PORT_1C;
on stdcore[1]: port p1d = XS1_PORT_1D;
on stdcore[1]: port p1e = XS1_PORT_1E;
on stdcore[1]: port p1f = XS1_PORT_1F;
on stdcore[1]: port p1g = XS1_PORT_1G;
on stdcore[1]: port p1h = XS1_PORT_1H;
on stdcore[1]: port p1i = XS1_PORT_1I;
on stdcore[1]: port p1j = XS1_PORT_1J;
on stdcore[1]: port p1k = XS1_PORT_1K;
on stdcore[1]: port p1l = XS1_PORT_1L;
on stdcore[1]: port p1n = XS1_PORT_1N;
on stdcore[1]: port p1m = XS1_PORT_1M;
on stdcore[1]: port p1o = XS1_PORT_1O;
on stdcore[1]: port p1p = XS1_PORT_1P;




void wait(void) {
  int i;
  while(i<1000) { i = i+1;}
}

void  all_1b_ports_input() {
  unsigned tmp;
  p1a :> tmp;
  p1b :> tmp;
  p1c :> tmp;
  p1d :> tmp;
  p1e :> tmp;
  p1f :> tmp;
  p1g :> tmp;
  p1h :> tmp;
  p1i :> tmp;
  p1j :> tmp;
  p1k :> tmp;
  p1l :> tmp;
  p1m :> tmp;
  p1n :> tmp;
  p1o :> tmp;
  p1p :> tmp;
}


int run_test(void) {
  //result vector
  unsigned int result, tmp;
  unsigned char message[60];
  unsigned failed=0;

  //1: test P8A driving partners
  all_1b_ports_input();

  p8a <: 0;
  wait();
  p1n :> tmp; if(tmp) { failed=1; printstr("8A1 failed to drive P1N to 0\n");}
  p1m :> tmp; if(tmp) { failed=1; printstr("8A2 failed to drive P1M to 0\n");}
  p1k :> tmp; if(tmp) { failed=1; printstr("8A3 failed to drive P1K to 0\n");}
  p1p :> tmp; if(tmp) { failed=1; printstr("8A6 failed to drive P1P to 0\n");}
  p1l :> tmp; if(tmp) { failed=1; printstr("8A7 failed to drive P1L to 0\n");}
  p1i :> tmp; if(tmp) { failed=1; printstr("8A0 failed to drive P1I to 0\n");}
  p8c :> tmp; if(tmp & 0x30) { failed=1; printstr("8A4, 8A5 failed to drive P8C5, P8C4 to 0\n");}

  p8a <: 0xFF;

  wait();  
  p1m :> tmp; if(!tmp) { failed=1; printstr("8A2 failed to drive P1M to 1\n");}
  p1n :> tmp; if(!tmp) { failed=1; printstr("8A1 failed to drive P1N to 1\n");}
  p1k :> tmp; if(!tmp) { failed=1; printstr("8A3 failed to drive P1K to 1\n");}
  p1p :> tmp; if(!tmp) { failed=1; printstr("8A6 failed to drive P1P to 1\n");}
  p1l :> tmp; if(!tmp) { failed=1; printstr("8A7 failed to drive P1L to 1\n");}
  p1i :> tmp; if(!tmp) { failed=1; printstr("8A0 failed to drive P1I to 1\n");}
  p8c :> tmp; if(!(tmp & 0x30)) { failed=1; printstr("8A4, 8A5 failed to drive P8C5, P8C4 to 1\n");}

  p8a <: 0;
  wait();
  p1n :> tmp; if(tmp) { failed=1; printstr("8A1 failed to drive P1N to 0\n");}
  p1m :> tmp; if(tmp) { failed=1; printstr("8A2 failed to drive P1M to 0\n");}
  p1k :> tmp; if(tmp) { failed=1; printstr("8A3 failed to drive P1K to 0\n");}
  p1p :> tmp; if(tmp) { failed=1; printstr("8A6 failed to drive P1P to 0\n");}
  p1l :> tmp; if(tmp) { failed=1; printstr("8A7 failed to drive P1L to 0\n");}
  p1i :> tmp; if(tmp) { failed=1; printstr("8A0 failed to drive P1I to 0\n");}
  p8c :> tmp; if(tmp & 0x30) { failed=1; printstr("8A4, 8A5 failed to drive P8C5, P8C4 to 0\n");}

  //2: test P8B driving partners
  all_1b_ports_input();

  p8b <: 0;
  wait();
  p1a :> tmp; if(tmp) { failed=1; printstr("8B3 failed to drive P1A to 0\n");}
  p1d :> tmp; if(tmp) { failed=1; printstr("8B2 failed to drive P1D to 0\n");}
  p1e :> tmp; if(tmp) { failed=1; printstr("8B5 failed to drive P1E to 0\n");}
  p1h :> tmp; if(tmp) { failed=1; printstr("8B4 failed to drive P1H to 0\n");}
  p1j :> tmp; if(tmp) { failed=1; printstr("8B6 failed to drive P1J to 0\n");}
  p8c :> tmp; if(tmp & 0x30) { failed=1; printstr("8B0, 8B1, 8B7 failed to drive P8C2, P8C1, P8C7 to 0\n");}

  p8b <: 0xFF;
  wait();  

  p1a :> tmp; if(!tmp) { failed=1; printstr("8B3 failed to drive P1A to 0\n");}
  p1d :> tmp; if(!tmp) { failed=1; printstr("8B2 failed to drive P1D to 0\n");}
  p1e :> tmp; if(!tmp) { failed=1; printstr("8B5 failed to drive P1E to 0\n");}
  p1h :> tmp; if(!tmp) { failed=1; printstr("8B4 failed to drive P1H to 0\n");}
  p1j :> tmp; if(!tmp) { failed=1; printstr("8B6 failed to drive P1J to 0\n");}
  p8c :> tmp; if(!(tmp & 0x86)) { failed=1; printstr("8B0, 8B1, 8B7 failed to drive P8C2, P8C1, P8C7 to 0\n");}

  p8b <: 0;
  wait();
  p1a :> tmp; if(tmp) { failed=1; printstr("8B3 failed to drive P1A to 0\n");}
  p1d :> tmp; if(tmp) { failed=1; printstr("8B2 failed to drive P1D to 0\n");}
  p1e :> tmp; if(tmp) { failed=1; printstr("8B5 failed to drive P1E to 0\n");}
  p1h :> tmp; if(tmp) { failed=1; printstr("8B4 failed to drive P1H to 0\n");}
  p1j :> tmp; if(tmp) { failed=1; printstr("8B6 failed to drive P1J to 0\n");}
  p8c :> tmp; if(tmp & 0x30) { failed=1; printstr("8B0, 8B1, 8B7 failed to drive P8C2, P8C1, P8C7 to 0\n");}

  //3: test remainder of drivers for port 8c, and port 1B driving port 1O
  all_1b_ports_input();

  p1c <:0;
  p1g <: 0;
  p1b <: 0;
  p1f <: 0;
  wait();
  p8c :> tmp; if(tmp & 0x45) { failed=1; printstr("P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 0\n");}
  p1o :> tmp; if(tmp) { failed=1; printstr("P1B failed to drive P1O to 0\n");}

  p1c <:1;
  p1g <: 1;
  p1b <: 1;
  p1f <: 1;
  wait();
  p8c :> tmp; if(!(tmp & 0x45)) { failed=1; printstr("P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 1\n");}
  p1o :> tmp; if(tmp) { failed=1; printstr("P1B failed to drive P1O to 1\n");}

  p1c <:0;
  p1g <: 0;
  p1b <: 0;
  p1f <: 0;
  wait();
  p8c :> tmp; if(tmp & 0x45) { failed=1; printstr("P1G, P1C, P1F failed to drive P8C0, P8C3, P8C6 to 0\n");}
  p1o :> tmp; if(tmp) { failed=1; printstr("P1B failed to drive P1O to 0\n");}

  //4: test P8A being driven by partners
  p8a :> tmp; //turn port round
  p8b :> tmp;
  p8c :> tmp;
  all_1b_ports_input();

  p1n <: 0;
  p1m <: 0;
  p1k <: 0;
  p1p <: 0;
  p1l <: 0;
  p1i <: 0;
  p8c <: 0x00;

  wait();
  p8a :> tmp; if(tmp) { failed=1; printstr("8A was not driven to to 0\n");}

  p1n <: 1;
  p1m <: 1;
  p1k <: 1;
  p1p <: 1;
  p1l <: 1;
  p1i <: 1;
  p8c <: 0xFF;

  wait();
  p8a :> tmp; if(tmp != 0xFF) { failed=1; printstr("8A was not driven to to 1\n");}


  p1n <: 0;
  p1m <: 0;
  p1k <: 0;
  p1p <: 0;
  p1l <: 0;
  p1i <: 0;
  p8c <: 0x00;
  p8a :> tmp; if(tmp) { failed=1; printstr("8A was not driven to to 0\n");}

  wait();

  //5: test partners driving P8B
  p8a :> tmp; //turn port round
  p8b :> tmp;
  p8c :> tmp;
  all_1b_ports_input();

  p1a <: 0;
  p1d <: 0;
  p1e <: 0;
  p1h <: 0;
  p1j <: 0;
  p8c <: 0;

  wait();

  p8b :> tmp; if(tmp) { failed=1; printstr("8B was not driven to to 0\n");}

  p1a <: 1;
  p1d <: 1;
  p1e <: 1;
  p1h <: 1;
  p1j <: 1;
  p8c <: 0xFF;
  wait();  

  p8b :> tmp; if(tmp != 0xFF) { failed=1; printstr("8B was not driven to to 1\n");}

  p1a <: 0;
  p1d <: 0;
  p1e <: 0;
  p1h <: 0;
  p1j <: 0;
  p8c <: 0;
  wait();  
  p8b :> tmp; if(tmp) { failed=1; printstr("8B was not driven to to 0\n");}

  //6: test remainder of drivers 
  all_1b_ports_input();
  p1o <: 0;
  p8c <: 0;

  wait();

  p1c :> tmp; if(tmp) { failed=1; printstr("P8C3 failed to drive P1C to 0\n");}
  p1g :> tmp; if(tmp) { failed=1; printstr("P8C0 failed to drive P1G to 0\n");}
  p1b :> tmp; if(tmp) { failed=1; printstr("P1O failed to drive P1B to 0\n");}
  p1f :> tmp; if(tmp) { failed=1; printstr("P8C6 failed to drive P1F to 0\n");}

  p1o <: 1;
  p8c <: 0xFF;

  wait();

  p1c :> tmp; if(!tmp) { failed=1; printstr("P8C3 failed to drive P1C to 1\n");}
  p1g :> tmp; if(!tmp) { failed=1; printstr("P8C0 failed to drive P1G to 1\n");}
  p1b :> tmp; if(!tmp) { failed=1; printstr("P1O failed to drive P1B to 1\n");}
  p1f :> tmp; if(!tmp) { failed=1; printstr("P8C6 failed to drive P1F to 1\n");}

  p1o <: 0;
  p8c <: 0;

  wait();

  p1c :> tmp; if(tmp) { failed=1; printstr("P8C3 failed to drive P1C to 0\n");}
  p1g :> tmp; if(tmp) { failed=1; printstr("P8C0 failed to drive P1G to 0\n");}
  p1b :> tmp; if(tmp) { failed=1; printstr("P1O failed to drive P1B to 0\n");}
  p1f :> tmp; if(tmp) { failed=1; printstr("P8C6 failed to drive P1F to 0\n");}


  //Output Test Status

  if(failed) { 
    printstr("TEST STATUS: FAILED :(\n"); 
  } else {
    printstr("TEST STATUS: PASSED :)\n");
  }

}

int main(void)
{
  par {
    on stdcore[1] : run_test();
  }
}
