#include<bits/stdc++.h>
using namespace std;
bool isVowel(char c)
{
    vector<char>vow{'a','e','i','o','u','A','E','I','O','U'};
    bool ans=false;
    for(auto &i:vow)
    {
        if(c==i)
        {
            ans=true;
        }

    }
    return ans;
}
int main(){
    string s;
    cout<<"Enter the string: "<<endl;
    cin>>s;
    int oc=0,ec=0;
    for(int i=0;i<s.length();i++)
    {
        if(isVowel(s[i]))
        {
            oc++;
        }
        else if(!isVowel(s[i]) && ((s[i]-'a'<26 && s[i]-'a'>-1) || (s[i]-'A'<26 && s[i]-'A'>-1))){
            ec++;
        }
    }
    cout<<"Vowel count: "<<oc<<"    Consonant count: "<<ec<<endl;
}