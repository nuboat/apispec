library;

const String sampleCode = """
POST https://transitionlayer.thpc.cc/build_info
Authorization: eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjE1MTYyMzkwMjIiLCJpc3MiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJleHAiOjI1MTYyMzkwMjJ9.uT9TwET2UVRmGEw8hk9HtdONYvlYGfjkz5a428PciF8FfGg-Csa1dn4Fi72yuCBtI4JBGh3fsu9uy2Q8w7H5Bw
""";

const String sampleResponse = """
HTTP/1.1 502 Bad Gateway
Date: Sun, 08 Jun 2025 07:55:49 GMT
Content-Type: text/plain; charset=UTF-8
Content-Length: 15
Connection: close
Report-To: {"endpoints":[{"url":"https://a.nel.cloudflare.com/report/v4?s=3MxaO20bV4IHxHG7kwEf5CCU%2BhkAjYD%2FfaPIRKVXzjomjlrFnfVpNiVIgAf9Vf2oRXD%2F4Pf2SZBAwM5oQUQrSauabZZCjqREu3CRA7qWrFm15%2FAgUQwPqPZbPBEeawIs5JsBMyOXyCfY"}],"group":"cf-nel","max_age":604800}
Nel: {"success_fraction":0,"report_to":"cf-nel","max_age":604800}
Strict-Transport-Security: max-age=0; includeSubDomains; preload
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
Referrer-Policy: same-origin
Cache-Control: private, max-age=0, no-store, no-cache, must-revalidate, post-check=0, pre-check=0
Expires: Thu, 01 Jan 1970 00:00:01 GMT
Server: cloudflare
Cf-Ray: 94c6d4421b6f4745-SIN
server-timing: cfL4;desc="?proto=TCP&rtt=37067&min_rtt=37047&rtt_var=10456&sent=5&recv=6&lost=0&retrans=0&sent_bytes=2796&recv_bytes=1025&delivery_rate=110423&cwnd=252&unsent_bytes=0&cid=7c3c841b28b359da&ts=160&x=0"

error code: 502
""";
