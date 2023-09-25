#include <stdio.h>
#include <stdlib.h>
#define ll long long int
ll sum_mul(ll n, ll m, ll arr[n][m]);

int main()
{
    ll n, m;
    scanf("%lld %lld", &n, &m);
    ll arr[n][m];
    for (ll i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            scanf("%lld", &arr[i][j]);
        }
    }

    ll ans = sum_mul(n, m, arr);

    printf("%lld\n", ans);
}