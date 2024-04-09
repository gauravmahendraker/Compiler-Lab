#include<bits/stdc++.h>
using namespace std;
#include <iostream>
#include <fstream>
#define ll long long int

int main(){
    ifstream myfile;
    myfile.open("q3.txt");
    int nchar=0,nspace=0,nlines=1;
    if(myfile.is_open())
    {
        char mychar;
        while ( myfile ) {
            if(mychar=='\n')
            {
                nlines++;
            }
            mychar = myfile.get();
            nchar++;
            if(mychar==' ')
            {
                nspace++;
            }
            
        }
    }
    cout<<"Number of charecters: "<<nchar<<endl;
    cout<<"Number of spaces: "<<nspace<<endl;
    cout<<"Number of linebreaks: "<<nlines<<endl;

}