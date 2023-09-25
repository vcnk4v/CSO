#include <stdio.h>
#define ll long long int

ll palindrome(ll n);
int main()
{
    ll n;
    scanf("%lld", &n);
    ll ans = palindrome(n);
    if (ans == 1)
    {
        printf("True\n");
    }
    else
    {
        printf("False\n");
    }
}