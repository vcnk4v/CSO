#include <stdio.h>
#define ll long long int

void *multiples(ll n, ll *ans);

int main()
{
    ll n;
    scanf("%lld", &n);
    ll ans[n];
    multiples(n, ans);
    for (ll i = 0; i < n; i++)
    {
        printf("%lld ", ans[i]);
    }
    printf("\n");
}