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


/*---------------------------------------------------------------------------
 ports and clocks
 ---------------------------------------------------------------------------*/
 //::Port configuration
on stdcore[0]: port prx = XS1_PORT_8C;
on stdcore[0]: port ptx = XS1_PORT_8D;

void wait(void) {
  int i=0;
  while(i<2000) { i = i+1; asm ("");}
}

void waitlong(void) {
  int i=0;
  while(i<0x00FFFFFF) { i = i+1;asm ("");}
}

int run_test() {
  //result vector
  unsigned int result, tmp;
  unsigned char message[60];
  unsigned failed=0;

  printstr("Begin MUART loopback test\n");
  //1: test P8A driving partners
  ptx <: 0XAA;
  wait();
  prx :> tmp;
  if(tmp != 0xAA) {
    printstr("failed: sent(0xAA), got "); printint(tmp); printstr("\n");
    failed=1;
  } 

  ptx <: 0X55;
  wait();
  prx :> tmp;
  if(tmp != 0x55) {
    printstr("failed: sent(0x55), got "); printint(tmp); printstr("\n");
    failed=1;
  } 

  ptx <: 0XAA;
  wait();
  prx :> tmp;
  if(tmp != 0xAA) {
    printstr("failed: sent(0xAA), got "); printint(tmp); printstr("\n");
    failed=1;
  } 

  if(failed) { 
    printstr("TEST STATUS: FAILED :(\n"); 
  } else {
    printstr("TEST STATUS: PASSED :)\n");
  }
}


int main(void)
{
  par {
      on stdcore[0] : run_test();
  }
}
