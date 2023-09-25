#include <stdio.h>
#define ll long long int

ll min_bacteria(int n);

int main()
{
    ll n;
    scanf("%lld", &n);
    ll ans = min_bacteria(n);
    printf("%lld\n", ans);
}