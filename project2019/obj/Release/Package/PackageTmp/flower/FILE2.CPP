#include<stdio.h>
#include<conio.h>
#include<iostream.h>
#include<string.h>
void main()
{
 clrscr();
 char c[20];
 char str[10];
 FILE *fptr;
 char ch[20];
 int j=0;
 cout<<"\n enter your file:";
 cin>>filename;
 cout<<"enter a string you find:";
 cin>>str;
 if(fptr==NULL)
    {
       cout<<"\n cannot open file";
    }
     ch=fgets(fptr)
     while(ch !=EOF)
    {
      cout<<ch;
    }
}
