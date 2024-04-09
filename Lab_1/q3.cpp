#include <iostream>
using namespace std;

int main() {
    string inputStream;
    cout << "Enter the line to check\n";
    getline(cin, inputStream);
    
    int ptr = 0;
    while(ptr < inputStream.size() && inputStream[ptr] == ' ') ptr++;

    if(ptr + 1 >= inputStream.size() || (inputStream[ptr] != '/')){
        cout<<"input line is not a comment\n"; return 0;
    }

    if(inputStream[ptr + 1] == '/'){
        cout<<"input line is a comment\n"; return 0;
    }else if(inputStream[ptr + 1] != '*'){
        cout<<"input line is not a comment\n"; return 0;
    }else{
        ptr += 2;
    }
    
    bool endOfComment = false;
    while(ptr - 1 < inputStream.size() - 1 && !endOfComment){
        if(inputStream[ptr - 1] == '*' && inputStream[ptr] == '/'){
            if(ptr == inputStream.size() - 1){
                cout<<"input line is a comment\n"; return 0;
            }else{
                endOfComment = true;
            }
        }
        ptr++;
    }

    while(ptr < inputStream.size() && inputStream[ptr] == ' ') ptr++;
    if(ptr == inputStream.size() && endOfComment){
        cout<<"input line is a comment\n"; 
    }else{
        cout<<"input line is not a comment\n"; 
    }

    return 0;
}