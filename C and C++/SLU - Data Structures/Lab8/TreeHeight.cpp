#include <iostream>
#include <string>
using namespace std;

int depth(string::iterator& i){
      int num;
      int max = 1;
      
      while(*(++i) == 'd'){
         num = 1 + depth(i);
         if(num > max)
            max = num;
         }//end while
      return max;
      
   };



int main() {
   string traverse;
   int counter = 0;
   
   cin >> traverse;
   while((traverse[0] == 'd') || (traverse[0] == 'u')){
      int height = 0;
      string::iterator it = traverse.begin();
      traverse.insert(0, "d");
      traverse.append("u");  
      counter += 1;
      
      
      height = depth(it) - 1; //from suggestion
      
      cout << "Tree " << counter << ": " << height << endl;
      
      traverse.clear();
      cin >> traverse;
      }

}

