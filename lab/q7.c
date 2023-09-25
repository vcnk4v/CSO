#include <stdio.h>
#define ll long long int
ll maxsum(ll n, ll *arr, ll b);

int main()
{
    ll n, b;
    scanf("%lld %lld", &n, &b);
    ll arr[n];
    for (ll i = 0; i < n; i++)
    {
        scanf("%lld", &arr[i]);
    }
    ll ans = maxsum(n, arr, b);
    printf("%lld\n", ans);
}