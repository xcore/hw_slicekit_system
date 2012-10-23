#include <xs1.h>
#include "platform.h"

on tile[0] : port p = XS1_PORT_8D;

int main() {
  par {
    on tile[0] : {
      p <: 0b10000000;
      sync(p);
      p <: 0b11000000;
      sync(p);
    }
  }
  return 0;
}
