#define X 3.1415926f
#define Y 2.7182818f

int main(void) {
   float x;
   float y;
   float z;
   z = x * y;
   if(z) { // for the compiler to like my code and not ommit it, this is needed. :)
      return 0;
   }
   return 1;
}