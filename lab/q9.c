#include <stdio.h>
#define ll long long int
ll missing(ll n, ll *ans);
int main()
{
    ll n;
    scanf("%lld", &n);
    ll arr[n];
    for (ll i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    ll ans = missing(n, arr);

    printf("%lld\n", ans);
}