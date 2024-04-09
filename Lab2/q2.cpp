#include <iostream>
#include <fstream>

using namespace std;

bool checkCustomDelimiter(char ch)
{
    if (ch == ' ' || ch == '+' || ch == '-' || ch == '*' || 
        ch == '/' || ch == ',' || ch == ';' || ch == '>' || 
        ch == '<' || ch == '=' || ch == '(' || ch == ')' || 
        ch == '[' || ch == ']' || ch == '{' || ch == '}')
        return true;
    return false;
}

bool checkCustomOperator(char ch)
{
    if (ch == '+' || ch == '-' || ch == '*' || 
        ch == '/' || ch == '>' || ch == '<' || 
        ch == '=')
        return true;
    return false;
}

bool isValidCustomIdentifier(const string& str)
{
    if (str.empty() || isdigit(str[0]) || checkCustomDelimiter(str[0]))
        return false;
    return true;
}

bool checkInteger(const string& str)
{
    if (str.empty())
        return false;

    for (char c : str) {
        if (!isdigit(c) && !(c == '-' && c > 0))
            return false;
    }
    return true;
}

bool checkRealNumber(const string& str)
{
    if (str.empty())
        return false;

    bool hasDecimal = false;
    for (char c : str) {
        if (!isdigit(c) && c != '.' && !(c == '-' && c > 0))
            return false;
        if (c == '.')
            hasDecimal = true;
    }
    return hasDecimal;
}

string getSubString(const string& str, int left, int right)
{
    return str.substr(left, right - left + 1);
}

void printToken(const string& token, const string& type)
{
    cout << "'" << token << "' IS A " << type << endl;
}
bool checkKeyword(const string& str)
{
    if (str == "if" || str == "else" || str == "while" || str == "do" || 
        str == "break" || str == "continue" || str == "int" ||
        str == "double" || str == "float" || str == "return" || 
        str == "char" || str == "case" || str == "sizeof" || 
        str == "long" || str == "short" || str == "typedef" || 
        str == "switch" || str == "unsigned" || str == "void" || 
        str == "static" || str == "struct" || str == "goto")
        return true;
    return false;
}
int main()
{
    ifstream myfile;
    myfile.open("q2.txt");
    if (myfile.is_open()) {
        string mychar;
        while (getline(myfile, mychar)) {
            int left = 0, right = 0;
            int len = mychar.length();

            while (right <= len && left <= right) {
                if (!checkCustomDelimiter(mychar[right]) && !checkCustomOperator(mychar[right]))
                    right++;

                if ((checkCustomDelimiter(mychar[right]) || checkCustomOperator(mychar[right])) && left == right) {
                    if (checkCustomOperator(mychar[right]))
                        printToken(string(1, mychar[right]), "OPERATOR");
                    // else
                    //     printToken(string(1, mychar[right]), "DELIMITER");

                    right++;
                    left = right;
                } else if ((checkCustomDelimiter(mychar[right]) || checkCustomOperator(mychar[right])) && left != right
                        || (right == len && left != right)) {
                    string subStr = getSubString(mychar, left, right - 1);

                    if (checkKeyword(subStr))
                        printToken(subStr, "KEYWORD");
                    else if (checkInteger(subStr))
                        printToken(subStr, "INTEGER");
                    else if (checkRealNumber(subStr))
                        printToken(subStr, "REAL NUMBER");
                    else if (isValidCustomIdentifier(subStr) && !checkCustomDelimiter(mychar[right - 1]))
                        printToken(subStr, "VALID IDENTIFIER");
                    else if (!isValidCustomIdentifier(subStr) && !checkCustomDelimiter(mychar[right - 1]))
                        printToken(subStr, "NOT A VALID IDENTIFIER");
                    // else if (checkCustomDelimiter(mychar[right]))
                    //     printToken(string(1, mychar[right]), "DELIMITER");

                    left = right;
                }
            }
        }
    }

    return 0;
}
