#include <stdio.h>
#define ll long long int

ll gcd(ll n, ll m);
int main()
{
    ll n, m;
    scanf("%lld %lld", &n, &m);
    ll ans = gcd(n, m);

    printf("%lld\n", ans);
}