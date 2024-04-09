#include<bits/stdc++.h>
using namespace std;

int main(){
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
    string s;
    cout<<"Enter string to check as keyword"<<endl;
    getline(cin,s);
    int i=0,r=s.length()-1;
    while(i<s.length() && s[i]==' ')
    {
        i++;
    }
    while(r>-1 && s[r]==' ')
    {
        r--;
    }
    
    bool keyword=false;
    if(r<i)
    {
        keyword=false;
    }
    else{
        int l=i;
    r=i;
    while(r<s.length())
    {
        while(s[r]!=' ')
        {
            r++;
        }
        if(cKeywords[s.substr(l,r-l)])
        {
            cout<<s.substr(l,r-l)<<" Is a keyword"<<endl;
        }
        else{
            cout<<s.substr(l,r-l)<<" Is not a keyword"<<endl;
        }
        while(s[r]==' ')
        {
            r++;
        }
        l=r;
    }
    }
    
    return 0;
    
}