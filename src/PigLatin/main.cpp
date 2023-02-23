#include <algorithm>
#include <bits/stdc++.h>
#include <iostream>
#include <string>
using namespace std;

string input, firstPart, lastPart, answer;
int currentChar;

bool isPunctuation() {
  return (input[currentChar] == '.' || input[currentChar] == ',' ||
          input[currentChar] == '?' || input[currentChar] == '!' ||
          input[currentChar] == '\"' || input[currentChar] == '\'' ||
          input[currentChar] == '(' || input[currentChar] == ')' ||
          input[currentChar] == ';' || input[currentChar] == ':');
}

int main() {
  while (true) {
    cout << "Input a word or paragraph:\n";
    input = "";
    getline(cin, input);
    transform(input.begin(), input.end(), input.begin(), ::toupper);
    int characters = input.size();
    currentChar = 0;
    while (currentChar < characters) {
      lastPart = "";
      firstPart = "";

      while (input[currentChar] != 'A' && input[currentChar] != 'E' &&
             input[currentChar] != 'I' && input[currentChar] != 'O' &&
             input[currentChar] != 'O' && input[currentChar] != 'U' &&
             input[currentChar] != ' ' && currentChar < characters) {
        if (!isPunctuation()) {
          firstPart += input[currentChar];
        }
        currentChar++;
      }

      while (input[currentChar] != ' ' && currentChar < characters) {
        if (!isPunctuation()) {
          lastPart += input[currentChar];
        }
        currentChar++;
      }

      currentChar += 1;

      if (firstPart == "") {
        firstPart = "W";
      }

      answer += lastPart + firstPart + "AY" + " ";
    }

    cout << "\nPig Latin Conversion >> " + answer + "\n\n --------------------------\n";
    answer = "";
  }
}