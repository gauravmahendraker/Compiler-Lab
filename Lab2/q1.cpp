#include<bits/stdc++.h>
using namespace std;
#define ll long long int
int main(){
    cout<<"Enter the identifier name"<<endl;
    string s;
    cin>>s;
    unordered_map<string, bool> cKeywords = {
        {"auto", true},
        {"break", true},
        {"case", true},
        {"char", true},
        {"const", true},
        {"continue", true},
        {"default", true},
        {"do", true},
        {"double", true},
        {"else", true},
        {"enum", true},
        {"extern", true},
        {"float", true},
        {"for", true},
        {"goto", true},
        {"if", true},
        {"int", true},
        {"long", true},
        {"register", true},
        {"return", true},
        {"short", true},
        {"signed", true},
        {"sizeof", true},
        {"static", true},
        {"struct", true},
        {"switch", true},
        {"typedef", true},
        {"union", true},
        {"unsigned", true},
        {"void", true},
        {"volatile", true},
        {"while", true}
    };
    string tocheck;
    ll ind=0,r=s.length()-1;
    while(s[ind]==' ')
    {
        ind++;
    }
    while(s[r]==' ')
    {
        r--;
    }
    tocheck=s.substr(ind,r-ind+1);
    if(cKeywords[tocheck])
    {
        cout<<"Its a keyword so cannot be an identifier"<<endl;
    }
    else{
        bool invalidchar=false;
        for(auto &i:tocheck)
        {
            if((i>='a' && i<='z') || (i>='A' && i<='Z') || (i>='0' && i<='9') || (i=='_'))
            {
                ;
            }
            else{
                invalidchar=true;
            }
        }
        bool invalidStart=false;
        if(tocheck[0]>='0' && tocheck[0]<='9')
        {
            invalidStart=true;
        }
        if(invalidchar || invalidStart)
        {
            cout<<"Not a Identifier"<<endl;
        }
        else{
            cout<<"Is a identifier"<<endl;
        }
    }
}